


  ; ==================================================================== EXITS SCRIPT DOCUMENT ==========================================================

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
Send, 380NCH0001 ; Complimentary Disposal Bags

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^2::
Send, 380NCH0002 ; Complimentary Dry Wipes

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^6::
Send, 380NCH0006 ; Complimentary Wet Wipes

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^5::
Send, 6164411006 ; Complimentary Isagel

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^4::
Send, 380NLTC034 ; Out Of Stock Flier

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

`::
Send, EPS
Send {Ctrl Down}
Send v
Send {Ctrl Up} ; EPS + Script ID

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

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait, 0.5
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

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()

checkForMedicationOnPX()

	MouseMove 865, 336 ; Moves to comments field and pastes the medication name (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait, 0.5
Sleep 100

clearClipboard()
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
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

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

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
Sleep 100
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyItForDuplicate()

	MouseMove 1730, 844 ; Moves over Description Field

MouseClick ; Selects the Description Field and Pastes in the PX number
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send {Up}
Sleep 100
Send {Up}
Sleep 100
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 100

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 100

clearClipboard()

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
Sleep 100

clearClipboard()

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
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyItForDuplicate()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ==================================================================== EPS RETURN PX SERVICE ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Medication product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!Insert::
BlockInput, MouseMove

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnPXServiceTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 859, 329 ; Moves to comment field and pastes the PX number with text (Siebel)
	

MouseClick
Sleep 100
Send EPS Px Services returned to spine
Send {Space}
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 100
checkForPatientNameToAppear()

checkForProgressBar()

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSReturnTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 870, 271 ; Moves to description field and pastes the PX number (Siebel)

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 100

	MouseMove 715, 327 ; Moves to source field and selects PX Service (Siebel)

MouseClick
Sleep 50
MouseMove 712, 410
MouseClick
Sleep 50

	MouseMove 865, 336 ; Moves to comments field and pastes the Duplicate Notes

MouseClick
MouseClick
Sleep 50


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

checkIfSiebelOrderNoIsCopied()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

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

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()

selectsEPSShortfallTemplate()

MouseClick
Sleep 50

clicksOnOkInTemplateWindow()

	MouseMove 1307, 408 ; Clicks on Siebel Order No and pastes Order No

MouseClick
MouseClick
Send {Ctrl Down}
Send v
Send {Ctrl Up}
ClipWait
Sleep 100

clearClipboard()

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
Sleep 100

MouseMove 714, 302 ; Moves over sub-type drop arrow and clicks it
MouseClick

clearClipboard()

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

checkIfCurrentWindowIsCorrectForStockAndCheck()

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








	; ============================================== PARTIAL STOCK & CHECK =====================================================================

; This script performs first part of the Stock & Check 
; It changes the "Origin" to "Perscription EPS"
; It changes the "Source" to "Professional Contact"
; It changes the "Order Status" to "Pending"
; It clicks on "Stock & Check" button

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!End::
BlockInput, MouseMove

checkIfCurrentWindowIsCorrectForStockAndCheck()

checkIfScreenIsScrolledToTop()

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

clearClipboard()


lookForNHSOnPX()

	MouseMove 89, 441 ; NHS Number field Coordinates (Siebel)

MouseClick
Sleep, 50
MouseClick
Sleep 50
Send, {Backspace}
Sleep 50
Send, {Backspace}
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 100
Send {Enter}
Sleep 50

MouseMove 61, 642

checkForProgressBar()

checkForPatientNameToAppear()

clearClipboard()

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

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

	MouseMove 1609, 600 ; "Auto GAS All" button Coordinates (Siebel)

MouseClick
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 672, 241 ; Perscription No. box Coordinates (Siebel)

checkForWindowChangeGas()

MouseClick
Sleep, 50
MouseClick
Sleep 50
Send {backspace}
Sleep 50
Send {backspace}
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send, EPS
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 100

clickOnPXAfterGAS()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS GAS SELECTED + SCRIPT ID COPY + PASTE INTO SIEBEL =====================================================================

; This script copies the Script ID from ProScript, then pastes it into Siebel into "Perscription NO" field with "EPS" in front of it

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+PgUp::
BlockInput, MouseMove

clearClipboard()

checkIfScreenIsScrolledToTop()

checkIfCurrentWindowIsCorrect()

	MouseMove 1750, 469 ; Whitespace coordinates (Siebel)

Sleep 50
MouseClick
Sleep 100

	MouseMove 1700, 599 ; "Auto GAS Selected" button Coordinates

MouseClick
checkIfPxIsScrolledToTop()
selectsPXNumberInProScriptAndCopyIt()

	MouseMove 672, 241 ; Perscription No. box Coordinates (Siebel)

checkForWindowChangeGas()

MouseClick
Sleep, 50
MouseClick
Sleep 50
Send {backspace}
Sleep 50
Send {backspace}
Sleep 50
Send, ^{End}
Sleep 50
Send, +{Home}
Sleep 100
Send, EPS
Send {Ctrl Down}
Send v
Send {Ctrl Up}
Sleep 100

clickOnPXAfterGAS()

BlockInput, MouseMoveOff

Return ; Script Run Finished










	;============================================== FUNCTIONS =====================================================





	; ========== Wait Functions ==========

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




checkForWindowChangeGas()
{
	PixelGetColor, color, 691, 526 ; "Team" field Coordinates (Siebel - gray color sample) - Loop looks for white color to appear at these coordinates before moving forward
While color = 0xEEEEEE
{
	PixelGetColor, color, 691, 526 
Sleep 10
}
}






	; ========== PX & Patient Account Functions ==========

lookForNHSOnPX()
{
Loop
{

	PixelSearch, OutputVarX, OutputVarY, -970, 164, -947, 191, %A_LoopField%, 210, Fast ; NHS Number color search box Coordinates (ProScript)

if ErrorLevel 
MsgBox, 4096, Error 001, "Script Failed - Please try again or copy NHS Manually. Press F12 to Exit the error message"
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
ClipWait, 1
if RegExMatch(Clipboard, "(\d{10})", OutputVar)
{
;
}
else if (OutputVar = 0)
{
Sleep 200
MouseClick
Sleep 50
MouseClick
Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait, 1
}
else
{
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error 001, "Script Failed - Please try again or copy NHS Manually. Press F12 to Exit the error message"
Reload
}
}




checkIfPxIsScrolledToTop()
{
Loop
{
PixelGetColor, color, -461, 83
if (color = 0xF0F0F0)
{
MouseMove -460, 83 ; Moves the mouse over up bar on PX
MouseClick ; Scrolls Up the PX
Sleep 10
MouseClick
Sleep 10
MouseClick
Sleep 10
MouseClick
Sleep 10
break
}
else
{
break
}
}
}




checkForPatientNameToAppear()
{
Loop
{
	PixelSearch, OutputVarX, OutputVarY, 45, 628, 71, 661, 6666CC, 210, Fast ; Last Name Field Coordinates (Search Box - Siebel)
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
	PixelSearch, OutputVarX, OutputVarY, -1179, 210, -1066, 303, 000000, 50 ; Looks for black font in PX to select the medication
if (ErrorLevel != 0)
return
else
MouseMove %OutputVarX%, %OutputVarY%
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait, 0.5
Sleep 50
Return
}
}




selectsPXNumberInProScriptAndCopyItForDuplicate()
{

	MouseMove -738, 78 ; Selects PX number and copies it (ProScript)
	
MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait, 1
}




selectsPXNumberInProScriptAndCopyIt()
{

	MouseMove -738, 78 ; Selects PX number and copies it (ProScript)
	
MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait, 1
if RegExMatch(Clipboard, "(.{6}-.{6}-.{6})", OutputVar)
{
;
}
else if (OutputVar = 0)
{
Sleep 200
MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
Send a
Send {Ctrl Up}
Sleep 50
Send {Ctrl Down}
Send c
Send {Ctrl Up}
ClipWait, 1
}
else
{
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, "Script Failed - Please copy the PX number manually. Press F12 to Exit the error message"
Reload
}
}






	; ========== Template Window Functions ==========

clickOnNewlyCreatedActivity()
{
	MouseMove 729, 626 ; Clicks on Newly Created Activity
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
MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window
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




clicksOnOkInTemplateWindow()
{
	MouseMove 1276, 702 ; Clicks on OK

MouseClick
MouseClick
Sleep 100
}




selectsEPSReturnTemplate()
{
	MouseMove 1275, 635 ; Selects EPS Return Template
}




selectsEPSReturnPXServiceTemplate()
{
	MouseMove 1275, 680 ; Selects EPS Return Template
}




selectsEPSShortfallTemplate()
{
	MouseMove 1275, 659 ; Selects EPS Shortfall Template
}






	; ========== Safety Functions ==========

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
Sleep 1000
return
}
else
{
break
}
}
}




checkIfSiebelOrderNoIsCopied()
{
if RegExMatch(Clipboard, "(\d{1}-\d{10})", OutputVar)
{
;
}
else
{
MsgBox, 4096, Error, "Script Failed - Please copy the Siebel Order number first. Press F12 to Exit the error message"
Reload
}
}




checkIfCurrentWindowIsCorrect()
{
PixelGetColor, color, 526, 557 ; Siebel "AP Order Lines" label coordinates
PixelGetColor, color2, 176, 141 ; Siebel "Contacts" label coordinates
While (color != 0xFFFFFF) || (color2 != 0xFFFFFF)
{
BlockInput, MouseMoveOff
MsgBox, 4096, Error, You can only run this script from AP Order Lines Tab. Press F12 to Exit the error message.
Reload
}
}




checkIfCurrentWindowIsCorrectForStockAndCheck()
{
PixelGetColor, color, 592, 138 ; Siebel "Orders" label coordinates
While color != 0xFFFFFF
{
BlockInput, MouseMoveOff
MsgBox, 4096, Error, You can only run this script while Stock Checking the order. Press F12 to Exit the error message.
Reload
}
}






	; ========== Misc Functions ==========

clickOnPXAfterGAS()
{
	MouseMove -910, 275 ; General PX coordinates (So that the script selects the PX at the end)
	MouseClick
}




clearClipboard()
{
Clipboard :=
return
}








; Scripts created by PLBASIO & PLTOTO