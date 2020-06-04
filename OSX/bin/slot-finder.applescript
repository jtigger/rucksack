-- ===- Functions -===

-- visualDelay() sleeps for `total` number of seconds, displaying a progress indicator in the status area.
--   `verb` is the message included in the progress indicator.
to visualDelay(total, verb)
	set maxSteps to total
	-- Update the initial progress information
	set progress total steps to maxSteps
	set progress completed steps to 0
	set progress description to verb
	
	repeat with step from 1 to maxSteps
		set progress completed steps to step
		delay 1
	end repeat
	
	-- Reset the progress information
	set progress total steps to 0
	set progress completed steps to 0
	set progress description to ""
end visualDelay

-- clickClassName() finds a specific thing on the web page and clicks on it.
to clickClassName(theClassName, elementnum, tab_num, window_id)
	tell application "Safari"
		do JavaScript "document.getElementsByClassName('" & theClassName & "')[" & elementnum & "].click();" in tab tab_num of window id window_id
	end tell
end clickClassName

-- clickID() finds a unique thing on the web page and clicks on it.
to clickID(theID, tab_num, window_id)
	tell application "Safari"
		do JavaScript "document.getElementById('" & theID & "').click();" in tab tab_num of window id window_id
	end tell
end clickID

-- restartCheckout() starts the whole checkout process from scratch.
--   (useful for recovering when something unexpected has happened.)
to restartCheckout(selected_cart_url, window_id)
	log "  - opening the cart"
	-- TO-DO: check "if not on cart tab already" then load cart tab
	-- closes the tab so the tab can be reloaded and processed anew
	-- TO-DO: perhaps i can shorten this code by not closing and reopening a tab
	
	tell application "Safari"
		close (last tab of window id window_id)
		tell window id window_id
			make new tab with properties {URL:selected_cart_url}
			set current tab to last tab
		end tell
	end tell
	visualDelay(10, "Waiting for page...")
	
	-- clicks the "Checkout Whole Foods Market Cart" button
	clickClassName("a-button-input", 0, -1, window_id)
	log "  - waiting for 'before you checkout' page. Clicking continue."
	visualDelay(5, "Waiting for page...")
	clickClassName("a-button-text a-text-center", 0, -1, window_id)
	log "  - waiting for 'substitution preferences' page (keeping existing settings)."
	visualDelay(5, "Waiting for page...")
	clickClassName("a-button-text a-text-center", 0, -1, window_id)
	visualDelay(10, "Waiting for page...")
	
	tell application "Safari"
		close (last tab of window id window_id)
	end tell
end restartCheckout

-- randomBetweenTargetsWithMax() generates a random number that for:
--    90% of the time is between `lowerTarget` and `upperTarget`.
--    5% of the time can be as high as `maxAllowed`
--    5% of the time can be as low as 1
to randomBetweenTargetsWithMax(lowerTarget, upperTarget, maxAllowed)
	set value to random number from lowerTarget to upperTarget
	
	set eventScore to (random number from 1 to 100)
	if eventScore ³ 95 then
		set value to value + (random number from upperTarget to (maxAllowed - upperTarget))
	else if eventScore ² 5 then
		set value to value - (random number from 1 to (lowerTarget - 1))
	end if
	
	return value
end randomBetweenTargetsWithMax


to loadScheduleYourOrderPage(window_id)
	tell application "Safari"
		-- opens in a new tab every time instead of just using open url request, which would prompt "Are you sure you want to send a form again?" and prevent this from running neatly in the background
		tell window id window_id
			make new tab with properties {URL:"https://smile.amazon.com/gp/buy/shipoptionselect/handlers/display.html?hasWorkingJavascript=1"}
			set current tab to last tab
		end tell
	end tell
	visualDelay(10, "Waiting...")
end loadScheduleYourOrderPage


to callOutNames(default, nicknames, timesToCall)
	set progress total steps to timesToCall
	set progress completed steps to 0
	set progress description to "Calling your name..."
	
	repeat with step from 1 to timesToCall
		set x to randomBetweenTargetsWithMax(1, 20, 40)
		if x > 10 and x < 20 then
			set nameToCall to default
		else if x ² 10 or x ³ 20 then
			set nameToCall to item (random number from 1 to length of nicknames) of nicknames
		end if
		say nameToCall
		set progress completed steps to step
	end repeat
	
	-- the punchline
	delay 2
	say "hi!"
	
	set progress total steps to 0
	set progress completed steps to 0
	set progress description to ""
	set progress additional description to ""
end callOutNames




-- ****************************
-- *** EXECUTION BEGINS HERE ***
-- ****************************

-- a flag to keep track of whether or not a slot has been found, yet.
set slot_has_been_found to false
-- the web address of the cart being automated.
set selected_cart_url to ""


set service to choose from list {"Whole Foods", "Amazon Fresh"} with title "Select cart" with prompt "Which kind of Amazon cart should we find a delivery slot for?" default items {"Whole Foods"}

if service is {"Whole Foods"} then
	set selected_cart_url to "https://www.amazon.com/cart/localmarket"
	log "Using 'WHOLE FOODS' cart."
else if service is {"Amazon Fresh"} then
	set selected_cart_url to "https://www.amazon.com/cart/fresh"
	log "Using 'AMAZON FRESH' cart."
else
	error number -128
end if


-- create new empty window, with one empty tab
tell application "Safari"
	make new document
	delay 0.5 -- wait for new window to open
	
	set amzn_win_id to id of front window
	tell window id amzn_win_id
		make new tab with properties {URL:"about:blank"}
		set current tab to last tab
	end tell
end tell
restartCheckout(selected_cart_url, amzn_win_id)


-- 
set numRetries to 0
set totalWait to 0
set minWait to 60
set maxWait to 0

log "Started searching at " & (time string of (current date)) & "."
repeat while slot_has_been_found is false
	set numRetries to numRetries + 1
	
	log "Attempt " & numRetries & ":"
	log "  - Waiting for 'Shipping & Payment' page to load."
	loadScheduleYourOrderPage(amzn_win_id)
	
	tell application "Safari"
		set siteText to (text of last tab of window id amzn_win_id) as string
	end tell
	
	-- no delivery slots available
	if siteText contains "No delivery windows available" then
		log "  - No delivery slots are available."
		
		set secToWait to randomBetweenTargetsWithMax(10, 20, 60)
		set totalWait to totalWait + secToWait
		set avgWait to round (totalWait / numRetries)
		if secToWait < minWait then
			set minWait to secToWait
		end if
		if secToWait > maxWait then
			set maxWait to secToWait
		end if
		log "  - Pausing for " & secToWait & " seconds before refreshing the page.  [min = " & minWait & "s; max = " & maxWait & "s; avg = " & avgWait & "s]."
		visualDelay(secToWait, "Pausing...")
		
		tell application "Safari"
			close (last tab of window id amzn_win_id)
		end tell
		
	else if siteText contains "We're sorry we are unable to fulfill your entire order" then
		-- landed on out of stock page
		
		-- click continue button to dismiss out of stock warning
		clickClassName("a-button-text", 0, -1, amzn_win_id)
		
		log "Amazon reported some items were out-of-stock."
		delay 1
		
		-- closes the tab so the tab can be reloaded and processed anew
		tell application "Safari"
			close (last tab of window id amzn_win_id)
		end tell
		-- sometimes the site stuck on page with the same out of stock items, despite clicking continue and refreshing repeatedly. restarting the checkout process bypasses this hang up. To prevent getting stuck in the first place, the checkout process is restarted after every time the 'out of stock' page is encountered.
		restartCheckout(selected_cart_url, amzn_win_id)
		
	else if siteText contains "Schedule your order" and (siteText contains "AM" or siteText contains "PM") then
		-- landed on delivery slot page and delivery slot selection drop down appears aka. slot found!
		log "Found slot at " & (time string of (current date)) & "."
		
		display notification "Delivery slot found." with title "Amazon Shipping Slot Finder" sound name "Ping"
		
		-- bring Safari window to front and expand to fill screen so delivery slots are clearly visible
		tell application "Safari"
			-- unminimize
			set miniaturized of window id amzn_win_id to false
			-- wait for window to open
			delay 1
			
			tell application "System Events"
				tell application "Finder" to get the bounds of the window of the desktop
				tell application "Safari" to set the bounds of the front window to {0, 22, (3rd item of the result), (4th item of the result)}
			end tell
		end tell
		
		callOutNames("Barnaby!", {"Barn", "Bonnafiss", "Berttram", "Ambrose", "Hoopy Frood"}, 20)
		
		-- signals that the loop should end
		set slot_has_been_found to true
	else
		-- encountered unknown page
		-- will navigate back to the cart and from there back to the slot selection page
		log "unknown page encountered"
		restartCheckout(selected_cart_url, amzn_win_id)
	end if
end repeat
