#!/bin/bash
# Claude Code status line
# Mirrors the relevant elements of ~/.config/starship.toml:
#   - [directory]   -> bold bright-white current directory
#   - $git_branch / $git_status -> bold yellow branch name + ahead/behind/staged/modified/untracked
# Plus Claude Code session info: model, effort level, and context window usage.

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
[ -z "$cwd" ] && cwd="$PWD"

# --- Directory (mirrors [directory]: bold bright-white, full path, ~ for home) ---
dir_display="${cwd/#$HOME/~}"

# --- Git branch + status (mirrors $git_branch / $git_status: bold yellow) ---
git_segment=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  status_symbols=""

  upstream=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null)
  if [ -n "$upstream" ]; then
    counts=$(git -C "$cwd" --no-optional-locks rev-list --left-right --count "HEAD...$upstream" 2>/dev/null)
    ahead=$(echo "$counts" | awk '{print $1}')
    behind=$(echo "$counts" | awk '{print $2}')
    [ -n "$ahead" ] && [ "$ahead" != "0" ] && status_symbols="${status_symbols}\xF0\x9F\x93\xA4${ahead}"
    [ -n "$behind" ] && [ "$behind" != "0" ] && status_symbols="${status_symbols}\xF0\x9F\x93\xAB${behind}"
  fi

  porcelain=$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)
  echo "$porcelain" | grep -q '^[MADRC]' && status_symbols="${status_symbols}\xF0\x9F\xA5\xA1"
  echo "$porcelain" | grep -q '^.[MADRC]' && status_symbols="${status_symbols}\xCE\x94"
  echo "$porcelain" | grep -q '^??' && status_symbols="${status_symbols}\xEF\xBC\x9F"

  git_segment=" \033[1;33m${branch}${status_symbols:+ $status_symbols}\033[0m"
fi

# --- Claude Code session info: model, effort, context usage (dimmed cyan) ---
model_name=$(echo "$input" | jq -r '.model.display_name // empty')
effort_level=$(echo "$input" | jq -r '.effort.level // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

session_segment="🤖"
if [ -n "$model_name" ]; then
  session_segment="${session_segment}${model_name}"
  [ -n "$effort_level" ] && session_segment="${session_segment} (${effort_level})"
fi
if [ -n "$used_pct" ]; then
  used_fmt=$(printf '%.0f' "$used_pct")
  ctx_str="ctx ${used_fmt}% used"
  if [ -n "$remaining_pct" ]; then
    remaining_fmt=$(printf '%.0f' "$remaining_pct")
    ctx_str="${ctx_str}, ${remaining_fmt}% left"
  fi
  session_segment="${session_segment}${session_segment:+ | }${ctx_str}"
fi
session_segment=" \033[2;36m${session_segment}\033[0m"

# --- Plan usage: 5-hour (session) + 7-day (weekly) rate limits (dimmed cyan) ---
# Only present for Claude.ai Pro/Max subscribers, after the first API response.
# Each window may be independently absent, so guard with // empty.
plan_segment="📜"
five_hour_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
five_hour_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_day_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Human-friendly "resets in" from a Unix epoch (e.g. "2h13m", "3d4h").
reset_in() {
  local target now diff d h m
  target="$1"
  now=$(date +%s)
  diff=$((target - now))
  [ "$diff" -lt 0 ] && diff=0
  d=$((diff / 86400)); h=$(((diff % 86400) / 3600)); m=$(((diff % 3600) / 60))
  if [ "$d" -gt 0 ]; then printf '%dd%dh' "$d" "$h"
  elif [ "$h" -gt 0 ]; then printf '%dh%dm' "$h" "$m"
  else printf '%dm' "$m"; fi
}

if [ -n "$five_hour_pct" ]; then
  seg="5h ${five_hour_pct%.*}%"
  [ -n "$five_hour_reset" ] && seg="${seg} ($(reset_in "$five_hour_reset"))"
  plan_segment="${plan_segment}${seg}"
fi
if [ -n "$seven_day_pct" ]; then
  seg="7d ${seven_day_pct%.*}%"
  [ -n "$seven_day_reset" ] && seg="${seg} ($(reset_in "$seven_day_reset"))"
  plan_segment="${plan_segment}${plan_segment:+ · }${seg}"
fi
plan_segment=" \033[2;36m ${plan_segment}\033[0m"

printf "\033[1;97m%s\033[0m%b%b%b\n" "$dir_display" "$git_segment" "$session_segment" "$plan_segment"
