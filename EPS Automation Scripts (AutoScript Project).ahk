 



  ; ==================================================================== EXITS SCRIPT DOCUMENT ==============================================================
; This script exits the AHK application



#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

#x::ExitApp  ; Win+X
return



    ; ==================================================================== COMPLIMENTARIES ==============================================================

; This script adds shortcuts for adding complimentary items, also adds EPS+ScriptID functionality



#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^1::
Send, 380NCH0001

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^2::
Send, 380NCH0002

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^6::
Send, 380NCH0006

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^5::
Send, 6164411006

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^4::
Send, 380NLTC034

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

`::
Send, EPS^v

Return





	; ==================================================================== RELOAD WHOLE SCRIPT DOCUMENT ==============================================================

; This script reloads the whole script document in case any of the scripts gets stuck

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

F12::
Reload

Return








	; ==================================================================== EPS RETURN ACTIVITY ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Delete::

BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1012, 557 ; Moves over activity tab

MouseClick ; Clicks on Activity

	MouseMove 590, 581 ; Moves on New in activity tab

checkForProgressBar()

Sleep 50
MouseClick ; Creates New Activity

	MouseMove 776, 483 ; Moves the cursor away from activities field

checkForProgressBar()

MouseClick ; Clicks Away from the Activity Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50

clickOnNewlyCreatedActivity()

MouseClick

	MouseMove 872, 268 ; Moves to description field

checkForProgressBar()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
Send ^q ; Opens up Template Window

Sleep 50

	MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

	MouseMove 1276, 702 ; Clicks on OK

MouseClick
MouseClick
Sleep 50

selectsPXNumberInProScriptAndCopyIt()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait

BlockInput, MouseMoveOff

Return ; Script Run Finished









	; ==================================================================== EPS RETURN MED ACTIVITY (If only 1 product on PX) ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Medication product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!Delete::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1012, 557 ; Moves over activity tab

MouseClick ; Clicks on Activity

	MouseMove 590, 581 ; Moves on New in activity tab

checkForProgressBar()

Sleep 50
MouseClick ; Creates New Activity

	MouseMove 776, 483 ; Moves the cursor away from activities field

checkForProgressBar()

MouseClick ; Clicks Away from the Activity Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50

clickOnNewlyCreatedActivity()

MouseClick

	MouseMove 872, 268 ; Moves to description field

checkForProgressBar()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
Send ^q ; Opens up Template Window

Sleep 50

	MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

	MouseMove 1276, 702 ; Clicks on OK

MouseClick
MouseClick
Sleep 50


checkForMedicationOnPX()

	MouseMove 865, 336 ; Moves to comments field and pastes the medication name (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=


selectsPXNumberInProScriptAndCopyIt()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50


	MouseMove 715, 327 ; Moves to source field and selects medication (Siebel)

MouseClick
Sleep 50
MouseMove 647, 385
MouseClick
Sleep 50


	MouseMove 939, 383 ; Moves to status field and selects done (Siebel)

MouseClick
Sleep 50
MouseMove 878, 409
MouseClick

BlockInput, MouseMoveOff

Return ; Script Run Finished






	;=============================================== EPS RETURN DUPLICATE ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Dupliate product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step


#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^Delete::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1423, 899 ; Moves over New in Notes

MouseClick ; Clicks on New

	MouseMove 1651, 843 ; Moves over dropdown menu arrow in Type

checkForProgressBar()

MouseClick ; Clicks on dropdown arrow
Sleep 50

	MouseMove 1654, 884 ; Moves over Duplicate Derscription Alert

MouseClick ; Clicks on Duplicate Perscription Alert
Sleep 50

	MouseMove 1686, 841 ; Moves over Flag Tick

MouseClick
Sleep 50
MouseClick ; Ticks the Flag Content Tick
Sleep 50

	MouseMove 1730, 844 ; Moves over Description Field

WinActivate, ahk_class ApplicationFrameWindow ; Opens up Sticky Notes app by its class
Sleep 100
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait
Sleep 50
WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 100

MouseClick
MouseClick ; Selects and pastes the Sticky Notes
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=

selectsPXNumberInProScriptAndCopyIt()

	MouseMove 1730, 844 ; Moves over Description Field

MouseClick ; Selects the Description Field and Pastes in the PX number
Send {Enter}
Sleep 10
Send {Enter}
Sleep 50
Send {Up}
Sleep 10
Send {Up}
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50

	MouseMove 1008, 453 ; Moves over activity tab

MouseClick ; Clicks on Activity

	MouseMove 590, 581 ; Moves on New in activity tab

checkForProgressBar()

Sleep 50
MouseClick ; Creates New Activity

	MouseMove 776, 483 ; Moves the cursor away from activities field

checkForProgressBar()

MouseClick ; Clicks Away from the Activity Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50

clickOnNewlyCreatedActivity()

MouseClick

	MouseMove 872, 268 ; Moves to description field

checkForProgressBar()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
Send ^q ; Opens up Template Window

Sleep 50

	MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

	MouseMove 1276, 702 ; Clicks on OK

MouseClick
MouseClick
Sleep 50

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=

WinActivate, ahk_class ApplicationFrameWindow ; Opens up Sticky Notes app by its class
Sleep 100
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait
Sleep 50
WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 100

	MouseMove 865, 336 ; Moves to comments field and pastes the Duplicate Notes

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=

	MouseMove 715, 327 ; Moves to source field and selects duplicate (Siebel)

MouseClick
Sleep 50
MouseMove 707, 360
MouseClick
Sleep 50


	MouseMove 939, 383 ; Moves to status field and selects done (Siebel)

MouseClick
Sleep 50
MouseMove 878, 409
MouseClick

selectsPXNumberInProScriptAndCopyIt()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS SHORTFALL =====================================================================

; This script works by creating Shortfall activity in Siebel
; It also copies the PX Number from ProScript and pastes it into Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Insert::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1012, 557 ; Clicks on Activity

MouseClick

	MouseMove 590, 581 ; Moves the cursor over the activity tab

checkForProgressBar()

Sleep 50
MouseClick ; Creates New Activity

	MouseMove 776, 483 ; Moves the cursor away from activities field

checkForProgressBar()

MouseClick ; Clicks Away from the Activity Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50

clickOnNewlyCreatedActivity()

MouseClick

	MouseMove 872, 268 ; Moves the cursor over the description field

checkForProgressBar()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
Send ^q ; Opens up Template Window

Sleep 50

MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSShortfallTemplate()

MouseClick
Sleep 50

	MouseMove 1276, 702 ; Clicks on OK

MouseClick
MouseClick
Sleep 100

	MouseMove 1307, 408 ; Clicks on Siebel Order No and pastes Order No

MouseClick
MouseClick
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=

WinActivate, ahk_class ApplicationFrameWindow ; Opens up Sticky Notes app by its class
Sleep 100
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait
Sleep 50
WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 100

	MouseMove 854, 335 ; Moves comment field and pastes the Shortfall Notes in

MouseClick
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 50
Clipboard :=

BlockInput, MouseMoveOff

Return ; Script Run finishes









	; ============================================== STOCK & CHECK =====================================================================

; This script performs first part of the Stock & Check 
; It changes the "Origin" to "Perscription EPS"
; It changes the "Source" to "Professional Contact"
; It changes the "Order Status" to "Pending"
; It clicks on "Stock & Check" button

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+End::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 752, 477 ; "Origin" field Coordinates (Siebel)

MouseClick
Sleep 50

	MouseMove 797, 499 ; "Up" arrow Coordinates

MouseClick
MouseClick
MouseClick
MouseClick
MouseClick
MouseClick
MouseClick
Sleep 50

	MouseMove 715, 561 ; "Prescription EPS" option Coordinates 

MouseClick
Sleep 50

	MouseMove 751, 373 ; "Source" field Coordinates (Siebel)

MouseClick
Sleep 50

	MouseMove 751, 392 ; "Up" arrow Coordinates

MouseClick
MouseClick
MouseClick
MouseClick
Sleep 50

	MouseMove 692, 402 ; "Professional Contact" option Coordinates

MouseClick
Sleep 50

	MouseMove 752, 295 ; "Order Status" field coordinates

MouseClick
Sleep 50

	MouseMove 682, 338 ; "Pending" option Coordinates

MouseClick
Sleep 50

	MouseMove 851, 704 ; Stock & Check button Coordinates

MouseClick

Send {Enter}
Send {Enter}
Send {Enter}

	MouseMove 753, 294 ; "Order Ststus" field Coordinates

MouseClick
Sleep 50

	MouseMove 743, 311 ; "Open" option Coordinates

MouseClick
Sleep 50

	MouseMove 753, 294 ; "Order Ststus" field Coordinates

MouseClick
Sleep 50

	MouseMove 739, 322 ; "Awaiting Payment" option Coordinates

MouseClick
Sleep 50
checkForPatientNameToAppear()

BlockInput, MouseMoveOff

Return ; Script Run Finished






	; ============================================== EPS NHS NUMBER COPY + PASTE INTO SIEBEL =====================================================================

; This script copies the NHS Number from PX in ProScript, then pastes it into "NHS Number' field in Siebel, then searches for the patient account
; This script finds the text (PX Number in ProScript) by looking for specified font colors in specified area 
; If it finds the color, it clicks in that place and copies the text

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
colors := "97E8A2, 6666CC" ; Array of colors used by PixelSearch function (NHS number font colors - regular and highlighted)

+PgDn::
BlockInput, MouseMove

Loop
{

	PixelSearch, OutputVarX, OutputVarY, -970, 164, -947, 191, %A_LoopField%, 210, Fast ; NHS Number color search box Coordinates (ProScript)

if ErrorLevel 
return
else
break
}

	click %OutputVarX%, %OutputVarY% ; Function clicks on the coordinates of found color (In that case NHS number)

Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait

	MouseMove 89, 441 ; NHS Number field Coordinates (Siebel)

MouseClick
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 50
Send {Enter}
Sleep 50
Clipboard :=

MouseMove 61, 642

checkForProgressBar()

checkForPatientNameToAppear()

BlockInput, MouseMoveOff

Return ; Script Run Finished






	; ============================================== EPS GAS ALL + SCRIPT ID COPY + PASTE INTO SIEBEL =====================================================================

; This script works by GASsing the entire order
; Then it checks the color in the specified area ("Team" field Coordinates in Siebel - It retrieves gray color sample from there)
; When the color changes to white (Since gray color doesn't exist in that position in the next window, it means that window changed) then it executes the rest of the script 
; Rest of the script includes: Copying Script ID number and pasting it into Siebel along with EPS in front of it

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Home::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1609, 600 ; "Auto GAS All" button Coordinates (Siebel)

MouseClick

selectsPXNumberInProScriptAndCopyIt()

	MouseMove 672, 241 ; Perscription No. box Coordinates (Siebel)

checkForWindowChangeGas()
MouseClick
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send, EPS^v
Sleep 50
Clipboard :=

clickOnPXAfterGAS()

MouseClick

BlockInput, MouseMoveOff

Return ; Script Run Finished







	; ============================================== EPS GAS SELECTED + SCRIPT ID COPY + PASTE INTO SIEBEL =====================================================================

; This script copies the Script ID from ProScript, then pastes it into Siebel into "Perscription NO" field with "EPS" in front of it

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+PgUp::
BlockInput, MouseMove

checkIfScreenIsScrolledToTop()

	MouseMove 1750, 469 ; Whitespace coordinates (Siebel)

Sleep 50
MouseClick
Sleep 100

	MouseMove 1700, 599 ; "Auto GAS Selected" button Coordinates

MouseClick

selectsPXNumberInProScriptAndCopyIt()

	MouseMove 672, 241 ; Perscription No. box Coordinates (Siebel)

checkForWindowChangeGas()
MouseClick
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send, EPS^v
Sleep 50
Clipboard :=

clickOnPXAfterGAS()

MouseClick

BlockInput, MouseMoveOff

Return ; Script Run Finished








			;============================================== FUNCTIONS =====================================================



checkIfScreenIsScrolledToTop()
{
Loop
{
PixelGetColor, color, 1908, 190
if (color = 0xFFFFFF)
{
	MouseMove 1907, 178 ; Scrolls up to the top of the window
MouseClick
MouseClick
MouseClick
MouseClick
Sleep 100
}
else
{
break
}
}
}




checkForProgressBar()
{
Loop
{
	PixelSearch, OutputVarX, OutputVarY, 1299, 1027, 1383, 1035, 000080, 150, Fast ; Loop looks for progress bar to appear before moving forward

if (ErrorLevel != 0)
Sleep 10
else
break
}
Loop
{
	PixelSearch, OutputVarX, OutputVarY, 1299, 1027, 1383, 1035, 000080, 150, Fast ; Loop looks for progress bar to disappear before moving forward

if (ErrorLevel = 0)
Sleep 10
else
break
}
}





checkForTemplateWindow()
{

	PixelGetColor, color, 968, 409 ; Looks for pixel (load up the template window and select pixel that is behind the blue top of the window) and waits for the template window to load before progressing
While color = 0xffffff 
{
	PixelGetColor, color, 968, 409 ; Loop keeps looking for pixel until it changes to blue (top of the template window)
sleep 10
}
}


checkIfTemplateWindowIsScrolled()
{
Loop
{
PixelGetColor, color, 1348, 638
if (color = 0xFFFFFF)
{
MouseClick ; Scrolls Down in the Template Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
break
}
else
{
break
}
}
}




checkForWindowChangeGas()
{
	PixelGetColor, color, 691, 526 ; "Team" field Coordinates (Siebel - gray color sample) - Loop looks for white color to appear at these coordinates before moving forward
While color = 0xEEEEEE
{
	PixelGetColor, color, 691, 526 
Sleep 10
}
}





checkForPatientNameToAppear()
{
Loop
{
	PixelSearch, OutputVarX, OutputVarY, 50, 634, 71, 661, 6666CC, 210, Fast ; Last Name Field Coordinates (Search Box - Siebel)
if (ErrorLevel != 0)
return
else
click %OutputVarX%, %OutputVarY%
Return
}
}




checkForMedicationOnPX()
{
Loop
{
	PixelSearch, OutputVarX, OutputVarY, -1174, 219, -1066, 303, 000000, 50, Fast ; Looks for black font in PX to select the medication
if (ErrorLevel != 0)
return
else
MouseMove %OutputVarX%, %OutputVarY%
Clipboard :=
MouseClick
MouseClick
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait
Sleep 50
Return
}
}



clickOnNewlyCreatedActivity()
{
	MouseMove 729, 626 ; Clicks on Newly Created Activity
}



selectsEPSReturnTemplate()
{
	MouseMove 1325, 635 ; Selects EPS Return Template
}


selectsEPSShortfallTemplate()
{
	MouseMove 1325, 659 ; Selects EPS Shortfall Template
}



selectsPXNumberInProScriptAndCopyIt()
{

	MouseMove -738, 78 ; Selects PX number and copies it (ProScript)
Clipboard :=
MouseClick
MouseClick
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait
Sleep 50
}




clickOnPXAfterGAS()
{
	MouseMove -910, 275 ; General PX coordinates (So that the script selects the PX at the end)
}


; Scripts created by PLBASIO & PLTOTO