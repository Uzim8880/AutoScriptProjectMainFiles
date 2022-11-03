


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
SendInput {Raw}380NCH0001 ; Complimentary Disposal Bags

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^2::
SendInput {Raw}380NCH0002 ; Complimentary Dry Wipes

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^6::
SendInput {Raw}380NCH0006 ; Complimentary Wet Wipes

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^5::
SendInput {Raw}6164411006 ; Complimentary Isagel

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^4::
SendInput {Raw}380NLTC034 ; Out Of Stock Flier

Return

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

`::
SendInput {Raw}EPS
Send {Ctrl Down}
SendInput v
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
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Delete::
BlockInput, MouseMove

clearClipboard()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelActivityTab()
checkForProgressBar()
siebelActivityNewButton()
checkForProgressBar()
siebelActivityWhiteSpace()
clickOnNewlyCreatedActivity()
checkForProgressBar()
siebelActivityDescriptionField()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
SendInput ^q ; Opens up Template Window
Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSReturnTemplate()
clicksOnOkInTemplateWindow()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelActivityDescriptionField()

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait, 1

keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ==================================================================== EPS RETURN MED ACTIVITY (If only 1 product on PX) ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Medication product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!Delete::
BlockInput, MouseMove

clearClipboard()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelActivityTab()
checkForProgressBar()
siebelActivityNewButton()
checkForProgressBar()
siebelActivityWhiteSpace()
clickOnNewlyCreatedActivity()
siebelActivityDescriptionField()
checkForProgressBar()

MouseClick ; Clicks on Description in Activity
Sleep 50
MouseClick
Sleep 50
SendInput ^q ; Opens up Template Window
Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSReturnTemplate()
clicksOnOkInTemplateWindow()
checkForMedicationOnPX()
siebelActivityCommentField()

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait, 1
Sleep 200

clearClipboard()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelActivityDescriptionField()

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
Sleep 50


siebelSourceDownArrow()
siebelSelectSourceMED()
siebelSelectStatusDownArrow()
siebelSelectStatusDone()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	;=============================================== EPS RETURN DUPLICATE ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Dupliate product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step


#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^Delete::
BlockInput, MouseMove

clearClipboard()
checkIfStickyNotesAreRunning()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelClickOnNewInNotes()
checkForProgressBar()
siebelTypeFieldInActiveNotes()
siebelFlagContactTick()
copyStickyNotes()
siebelDescriptionFieldInActiveNotes()

WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 50
MouseClick ; Selects and pastes the Sticky Notes
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait
Sleep 50

checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelDescriptionFieldInActiveNotes()

Send ^{Home}
Sleep 50
SendInput {Enter}
Sleep 50
SendInput {Enter}
Sleep 50
SendInput {Up}
Sleep 50
SendInput {Up}
Sleep 50
SendInput {Up}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait
Sleep 50

siebelActivityTabDuplicate()
checkForProgressBar()
siebelActivityNewButton()
checkForProgressBar()
siebelActivityWhiteSpace()
clickOnNewlyCreatedActivity()
siebelActivityDescriptionField()
checkForProgressBar()

MouseClick ; Clicks on Description in Activity
Sleep 50
MouseClick
Sleep 50
SendInput ^q ; Opens up Template Window

Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSReturnTemplate()
clicksOnOkInTemplateWindow()
siebelActivityDescriptionField()

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait
Sleep 100

clearClipboard()
copyStickyNotes()

WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 100

siebelActivityCommentField()

MouseClick
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait
Sleep 100

siebelSourceDownArrow()
siebelSelectSourceDUP()
clearClipboard()
siebelSelectStatusDownArrow()
siebelSelectStatusDone()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ==================================================================== EPS RETURN PX SERVICE ==============================================================

; This script works by creating Return activity in Siebel
; It also copies and pastes PX number and Medication product from ProScript to Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!Insert::
BlockInput, MouseMove

clearClipboard()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelActivityTab()
checkForProgressBar()
siebelActivityNewButton()
checkForProgressBar()
siebelActivityWhiteSpace()
clickOnNewlyCreatedActivity()
siebelActivityDescriptionField()
checkForProgressBar()

MouseClick
MouseClick
SendInput ^q ; Opens up Template Window
Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSReturnPXServiceTemplate()
clicksOnOkInTemplateWindow()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelActivityCommentField()
	

MouseClick
Sleep 100
SendInput {Raw}EPS Px Services returned to spine
SendInput {Space}
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
Sleep 100
Send {Ctrl Down}
SendInput {Raw}b
Send {Ctrl Up}
Sleep 100

siebelActivityDescriptionField()

MouseClick ; Clicks on Description in Activity
MouseClick
Sleep 50
SendInput ^q ; Opens up Template Window
Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSReturnTemplate()
clicksOnOkInTemplateWindow()
siebelActivityDescriptionField()

MouseClick
Sleep, 50
SendInput {Ctrl Down}
SendInput {Raw}v
SendInput {Ctrl Up}
Sleep 100


siebelSourceDownArrow()
siebelSourcePXService()
siebelActivityCommentField()

MouseClick
MouseClick
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}

Sleep 200
clearClipboard()
checkForExpiryDateOnPXFirstLine()
siebelActivityCommentField()

MouseClick
Sleep, 50
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}v
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50

Sleep 200
clearClipboard()
checkForExpiryDateOnPXSecondLine()
siebelActivityCommentField()

MouseClick
Sleep, 50
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput {Enter}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}v
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SendInput {Enter}
Sleep 50
SendInput {Enter}
Sleep 100

keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS SHORTFALL =====================================================================

; This script works by creating Shortfall activity in Siebel
; It also copies the PX Number from ProScript and pastes it into Siebel
; Of of its' functions is to wait for the blue progress bar in Siebel to appear (after every window change) 
; It waits until it appears, then it waits until it disappears
; After that it completes the next step

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Insert::
BlockInput, MouseMove

checkIfStickyNotesAreRunning()
checkIfSiebelOrderNoIsCopied()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelActivityTab()
checkForProgressBar()
siebelActivityNewButton()
checkForProgressBar()
siebelActivityWhiteSpace()
clickOnNewlyCreatedActivity()
siebelActivityDescriptionField()
checkForProgressBar()

Sleep 100
MouseClick ; Clicks on Description in Activity
Sleep 50
MouseClick
Sleep 50
SendInput ^q ; Opens up Template Window
Sleep 50

checkForTemplateWindow()

Sleep 50

checkIfTemplateWindowIsScrolled()
selectsEPSShortfallTemplate()
clicksOnOkInTemplateWindow()
siebelSiebelOrderNoField()
clearClipboard()
copyStickyNotes()

WinActivate, ahk_class Transparent Windows Client ; Opens up Siebel app by its class
Sleep 100

siebelActivityCommentField()

MouseClick
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait
Sleep 100

siebelSubTypeDownArrow()
clearClipboard()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run finishes








	; ============================================== STOCK & CHECK =====================================================================

; This script performs first part of the Stock & Check 
; It changes the "Origin" to "Perscription EPS"
; It changes the "Source" to "Professional Contact"
; It changes the "Order Status" to "Pending"
; It clicks on "Stock & Check" button

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+End::
SetDefaultMouseSpeed, 0
BlockInput, MouseMove

checkIfCurrentWindowIsCorrectForStockAndCheck()
checkIfScreenIsScrolledToTop()
siebelSourceAndOriginFields()
siebelStockAndCheckOrderStatusChanges()
checkForPatientNameToAppear()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== PARTIAL STOCK & CHECK =====================================================================

; This script performs first part of the Stock & Check 
; It changes the "Origin" to "Perscription EPS"
; It changes the "Source" to "Professional Contact"
; It changes the "Order Status" to "Pending"
; It clicks on "Stock & Check" button

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

!End::
SetDefaultMouseSpeed, 0
BlockInput, MouseMove

checkIfCurrentWindowIsCorrectForStockAndCheck()
checkIfScreenIsScrolledToTop()
siebelAddOosFlier()
siebelStockAndCheckOrderStatusChanges()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS NHS NUMBER COPY + PASTE INTO SIEBEL =====================================================================

; This script copies the NHS Number from PX in ProScript, then pastes it into "NHS Number' field in Siebel, then searches for the patient account
; This script finds the text (PX Number in ProScript) by looking for specified font colors in specified area 
; If it finds the color, it clicks in that place and copies the text

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
colors := "97E8A2, 6666CC" ; Array of colors used by PixelSearch function (NHS number font colors - regular and highlighted)

+PgDn::
SetDefaultMouseSpeed, 0
BlockInput, MouseMove

clearClipboard()
lookForNHSOnPX()
siebelPasteNHSNumber()
checkForProgressBar()
checkForPatientNameToAppear()
keyFix()
clearClipboard()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS GAS ALL + SCRIPT ID COPY + PASTE INTO SIEBEL =====================================================================

; This script works by GASsing the entire order
; Then it checks the color in the specified area ("Team" field Coordinates in Siebel - It retrieves gray color sample from there)
; When the color changes to white (Since gray color doesn't exist in that position in the next window, it means that window changed) then it executes the rest of the script 
; Rest of the script includes: Copying Script ID number and pasting it into Siebel along with EPS in front of it

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+Home::
BlockInput, MouseMove

clearClipboard()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelAutoGASAllButton()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelPerscriptionNoField()
checkForWindowChangeGas()
siebelPerscriptionNoFieldClearAndPastePX()
clearClipboard()
siebelCheckPerscriptionFieldIfPXIsPastedIn()
clickOnPXAfterGAS()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished








	; ============================================== EPS GAS SELECTED + SCRIPT ID COPY + PASTE INTO SIEBEL =====================================================================

; This script copies the Script ID from ProScript, then pastes it into Siebel into "Perscription NO" field with "EPS" in front of it

#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

+PgUp::
BlockInput, MouseMove

clearClipboard()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelAutoGASSelectedButton()
checkIfPxIsScrolled()
selectsPXNumberInProScriptAndCopyIt()
siebelPerscriptionNoField()
checkForWindowChangeGas()
siebelPerscriptionNoFieldClearAndPastePX()
clearClipboard()
siebelCheckPerscriptionFieldIfPXIsPastedIn()
clickOnPXAfterGAS()
keyFix()

BlockInput, MouseMoveOff

Return ; Script Run Finished
















	;============================================== FUNCTIONS =====================================================


	; ====================== PROSCRIPT FUNCTIONS ========================


lookForNHSOnPX()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\NHS_Number_Green.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 110
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 100
SetDefaultMouseSpeed, 2
if RegExMatch(Clipboard, "(\d{10})", OutputVar)
{
Return
}
else
{
Sleep 100
}
}
else if (ErrorLevel != 0)
{
Break
}
}
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\NHS_Number_Purple.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 110
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 100
SetDefaultMouseSpeed, 2
if RegExMatch(Clipboard, "(\d{10})", OutputVar)
{
Return
}
else
{
Sleep 100
}
}
else if (ErrorLevel != 0)
{
Break
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, "Script Failed - Please try again or copy NHS Manually. Press F12 to Exit the error message"
SetDefaultMouseSpeed, 2
Reload
}




checkForMedicationOnPX()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\Prescribed_Medication_Green.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 15
VarPosY := OutputVarY + 25
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\Prescribed_Medication_Purple.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 15
VarPosY := OutputVarY + 25
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, Could not copy the product! Press F12 to exit
Reload
}




selectsPXNumberInProScriptAndCopyIt()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\Script_Id.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 130
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
SetDefaultMouseSpeed, 2
if RegExMatch(Clipboard, "(.{6}-.{6}-.{6})", OutputVar)
{
Return
}
else 
{
Sleep 100
}
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, "Could not find the PX Number. Press F12 to Exit the error message"
Reload
}




selectsPXNumberInProScriptAndCopyItForDuplicate()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\Script_Id.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 130
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MsgBox, 4096, Error, "Could not find the PX Number. Press F12 to Exit the error message"
Reload
}




checkIfPxIsScrolled()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *25 %A_ScriptDir%\Images\PX_Scroll_Up_Arrow.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 7
VarPosY := OutputVarY + 19
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *25 %A_ScriptDir%\Images\PX_Scroll_Up_Arrow_2.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 7
VarPosY := OutputVarY + 19
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
Return
}
else if (ErrorLevel != 0)
{
Break
}
}
}




checkForExpiryDateOnPXFirstLine()
{
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *100 %A_ScriptDir%\Images\PX_Expiry_Date_Green.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 20
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *100 %A_ScriptDir%\Images\PX_Expiry_Date_Purple.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 20
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, Could not find the PX! Press F12 to exit
Reload
}




checkForExpiryDateOnPXSecondLine()
{
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *100 %A_ScriptDir%\Images\PX_Expiry_Date_Green.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 37
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *100 %A_ScriptDir%\Images\PX_Expiry_Date_Purple.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 37
MouseMove %VarPosX%, %VarPosY%
Sleep 200
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
if (Clipboard = "")
{
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 200
}
else
{
Return
}
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, Could not find the PX! Press F12 to exit
Reload
}




checkForPatientNameToAppear()
{
Loop
{
	PixelSearch, OutputVarX, OutputVarY, 45, 628, 71, 661, 6666CC, 210, Fast ; Last Name Field Coordinates (Search Box - Siebel)
if (ErrorLevel != 0)
return
else
SetDefaultMouseSpeed, 0
click %OutputVarX%, %OutputVarY%
SetDefaultMouseSpeed, 2
Return
}
}
















	; ====================== SIEBEL FUNCTIONS ========================


	; === Activity Coordinates ===




siebelActivityTab()
{
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, 960, 520, 1884, 622, *60 %A_ScriptDir%\Images\Activities_Tab.png
if (ErrorLevel = 0)
{
VarPosX := OutputVarX + 30
VarPosY := OutputVarY + 10
SetDefaultMouseSpeed, 0
MouseMove %VarPosX%, %VarPosY%
MouseClick
SetDefaultMouseSpeed, 2
Return
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Could not find Activity tab. Press F12 to Exit the error message"
Reload
}




siebelActivityNewButton()
{
Loop, 10
{
Sleep 200
ImageSearch OutputVarX, OutputVarY, 565, 570, 613, 593, *100 %A_ScriptDir%\Images\New_Activity_Button.png
if (ErrorLevel = 0)
{
VarPosX := OutputVarX + 15
VarPosY := OutputVarY + 5
SetDefaultMouseSpeed, 0
MouseMove %VarPosX%, %VarPosY%
Sleep 100
MouseClick
SetDefaultMouseSpeed, 2
Return
}
}
ImageSearch OutputVarX, OutputVarY, 565, 570, 613, 593, *100 %A_ScriptDir%\Images\New_Activity_Button.png
if (ErrorLevel != 0)
{
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Could not find New Activity button. Press F12 to Exit the error message"
Reload
}
}




siebelActivityWhiteSpace()
{
SetDefaultMouseSpeed, 0

	MouseMove 776, 483 ; Moves the cursor away from activities field after creating new activity

MouseClick
Sleep 100
MouseClick
Sleep 100
MouseClick
SetDefaultMouseSpeed, 2
}




clickOnNewlyCreatedActivity()
{
Loop, 10
{
Sleep 200
ImageSearch OutputVarX, OutputVarY, 492, 569, 1265, 720, *50 %A_ScriptDir%\Images\New_Activity_Other.png
if (ErrorLevel = 0)
{
VarPosX := OutputVarX + 15
VarPosY := OutputVarY + 5
SetDefaultMouseSpeed, 0
MouseMove %VarPosX%, %VarPosY%
MouseClick
SetDefaultMouseSpeed, 2
Return
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Could not find new activity created. Press F12 to Exit the error message"
Reload
}




siebelActivityDescriptionField()
{
SetDefaultMouseSpeed, 0

	MouseMove 872, 268 ; Moves to description field in New Activity
	
SetDefaultMouseSpeed, 2
}




siebelActivityCommentField()
{
SetDefaultMouseSpeed, 0

	MouseMove 865, 336 ; Moves to comments field in New Activity

SetDefaultMouseSpeed, 2
}




siebelSiebelOrderNoField()
{
SetDefaultMouseSpeed, 0

	MouseMove 1376, 404 ; Clicks on Siebel Order No Field in Shortfall Activity and pastes in Siebel Order Number

Sleep 100
MouseClick
Sleep 50
MouseClick
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait, 1
Sleep 100
MouseClick
SendInput ^{End}
SendInput +{Home}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
ClipWait, 1
Sleep 50
SetDefaultMouseSpeed, 2
Loop, 5
{
if RegExMatch(Clipboard, "(\d{1}-\d{10})", OutputVar)
{
Return
}
else
{
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait, 1
Sleep 50
MouseClick
SendInput ^{End}
SendInput +{Home}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
ClipWait, 1
Sleep 50
}
}
}




siebelSourceDownArrow()
{
SetDefaultMouseSpeed, 0

	MouseMove 715, 327 ; Moves to source field down arrow in a newly created Activity and clicks it
	
MouseClick
Sleep 100
SetDefaultMouseSpeed, 2
}




siebelSelectSourceMED()
{
SendInput {Raw}Medication
SendInput {Enter}
}




siebelSelectSourceDUP()
{
SendInput {Raw}Dupliate
SendInput {Enter}
}




siebelSourcePXService()
{
SendInput {Raw}Px Services
SendInput {Enter}
}




siebelSelectStatusDownArrow()
{
SetDefaultMouseSpeed, 0

	MouseMove 939, 383 ; Moves to status field down arrow in a newly created Activity and clicks it
	
MouseClick
SetDefaultMouseSpeed, 2
}




siebelSelectStatusDone()
{
SendInput {Raw}Done
SendInput {Enter}
}




siebelSubTypeDownArrow()
{
SetDefaultMouseSpeed, 0

	MouseMove 714, 302 ; Moves over sub-type drop arrow in Shortfall activity and clicks it

MouseClick
SetDefaultMouseSpeed, 2
}




clicksOnOkInTemplateWindow()
{
SetDefaultMouseSpeed, 0

	MouseMove 1276, 702 ; Clicks on OK

Sleep 100
MouseClick
MouseClick
Sleep 100
SetDefaultMouseSpeed, 2
}




selectsEPSReturnTemplate()
{
SetDefaultMouseSpeed, 0

	MouseMove 1273, 657 ; Selects EPS Return Template
	
MouseClick
SetDefaultMouseSpeed, 2
}




selectsEPSReturnPXServiceTemplate()
{
SetDefaultMouseSpeed, 0

	MouseMove 1276, 679 ; Selects EPS Return Template

MouseClick
SetDefaultMouseSpeed, 2
}




selectsEPSShortfallTemplate()
{
SetDefaultMouseSpeed, 0

	MouseMove 1278, 633 ; Selects EPS Shortfall Template
	
MouseClick
SetDefaultMouseSpeed, 2
}








	; === Duplicate Coordinates ===




siebelClickOnNewInNotes()
{
SetDefaultMouseSpeed, 0

	MouseMove 1422, 899 ; Moves over New button in Active Notes on AP Order Lines
	
MouseClick ; Clicks on New to create a New Active Note
SetDefaultMouseSpeed, 2
}




siebelActivityTabDuplicate()
{
Loop
{
Sleep 100
ImageSearch OutputVarX, OutputVarY, 484, 367, 1897, 518, *60 %A_ScriptDir%\Images\Activities_Tab.png
if (ErrorLevel = 0)
{
VarPosX := OutputVarX + 30
VarPosY := OutputVarY + 10
SetDefaultMouseSpeed, 0
MouseMove %VarPosX%, %VarPosY%
MouseClick
SetDefaultMouseSpeed, 2
Break
}
else (ErrorLevel != 0)
{
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Could not find Activity tab. Press F12 to Exit the error message"
Reload
}
}
}




siebelFlagContactTick()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Images\Flag_Contact_Label.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 14
VarPosY := OutputVarY + 30
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 100
Break
}
else
{
Sleep 50
}
}
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Images\Flag_Contact_Tick_Empty.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 7
VarPosY := OutputVarY + 7
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 100
Break
}
else if (ErrorLevel != 0)
{
Sleep 50
}
}
Loop
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Images\Flag_Contact_Ticked.png
if (ErrorLevel = 0)
{
Return
}
else
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 7
VarPosY := OutputVarY + 7
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Return
}
}
}




siebelDescriptionFieldInActiveNotes()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 1260, 714, 1912, 1077, *120 %A_ScriptDir%\Images\Description_Field_Active_Notes.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 12
VarPosY := OutputVarY + 30
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
MouseClick
Sleep 100
Break
}
else
{
Sleep 50
}
}
}




siebelTypeFieldInActiveNotes()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *100 %A_ScriptDir%\Images\Type_Field_Active_Notes.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 6
VarPosY := OutputVarY + 28
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
Break
}
else
{
Sleep 50
}
}
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *100 %A_ScriptDir%\Images\Type_Field_Active_Notes_Down_Arrow.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 6
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 100
MouseMove 0, 40, 0, R
Sleep 100
MouseClick
Sleep 100
Break
}
else
{
Sleep 50
}
}
}









	; === GAS Related (Buttons, PX Field) Coordinates ===




siebelPerscriptionNoField()
{
SetDefaultMouseSpeed, 0

	MouseMove 672, 241 ; Perscription No Field coordinates in Siebel, after GASing the order
	
SetDefaultMouseSpeed, 2
}




siebelPerscriptionNoFieldClearAndPastePX()
{
MouseClick
Sleep, 50
MouseClick
Sleep 50
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
Sleep 50
SendInput {Raw}EPS
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait 1
Sleep 200
}




siebelCheckPerscriptionFieldIfPXIsPastedIn()
{
Loop, 5
{
MouseClick
SendInput ^{End}
SendInput +{Home}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
ClipWait, 1
Sleep 50
if RegExMatch(Clipboard, "(EPS.{6}-.{6}-.{6})", OutputVar)
{
return
}
else
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\Script_Id.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 130
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}a
SendInput {Ctrl Up}
Sleep 50
SendInput {Ctrl Down}
SendInput {Raw}c
SendInput {Ctrl Up}
ClipWait, 1
Sleep 50
MouseMove 672, 241 ; Perscription No Field coordinates in Siebel, after GASing the order    
MouseClick
Sleep, 50
MouseClick
Sleep 50
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
Sleep 50
SendInput {Raw}EPS
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait 1
Sleep 50
SetDefaultMouseSpeed, 2
}
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Please copy and paste the PX number manually. Press F12 to Exit the error message"
Reload
}




siebelAutoGASAllButton()
{
SetDefaultMouseSpeed, 0

	MouseMove 1609, 600 ; "Auto GAS All" button Coordinates (Siebel)

MouseClick

SetDefaultMouseSpeed, 2
}




siebelAutoGASSelectedButton()
{
SetDefaultMouseSpeed, 0

	MouseMove 1750, 469 ; Whitespace coordinates (Siebel) above Auto GAS Selected Button

Sleep 50
MouseClick
Sleep 100

	MouseMove 1700, 599 ; "Auto GAS Selected" button Coordinates

MouseClick

SetDefaultMouseSpeed, 2
}








	; === NHS Copy & Paste Coordinates ===	




siebelClickReset()
{
SetDefaultMouseSpeed, 0

	MouseMove 72, 557 ; Reset Button in Search Side Tab in Siebel

MouseClick

SetDefaultMouseSpeed, 2
}




siebelPasteNHSNumber()
{
SetDefaultMouseSpeed, 0

	MouseMove 91, 439 ; NHS Number Field coordinates in Search Side Tab in Siebel

MouseClick
MouseClick
Sleep 50
SendInput {Backspace}
SendInput {Backspace}
Sleep 50
SendInput ^{End}
SendInput +{Home}
Sleep 50
SendInput {Backspace}
SendInput {Backspace}
Sleep 50
SendInput {Ctrl Down}
SendInput v
SendInput {Ctrl Up}
Sleep 50
SendInput {Enter}
Sleep 50
SetDefaultMouseSpeed, 2
}










	; === Template Window Coordinates ===	




checkForTemplateWindow()
{
	PixelGetColor, color, 968, 409 ; Looks for pixel (load up the template window and select pixel that is behind the blue top of the window) and waits for the template window to load before progressing
While color = 0xffffff 
{
	PixelGetColor, color, 968, 409 ; Loop keeps looking for pixel until it changes to blue (top of the template window)
sleep 50
}
}




checkIfTemplateWindowIsScrolled()
{
Loop
{
Sleep 100
PixelGetColor, color, 1348, 638
if (color = 0xFFFFFF)
{
SetDefaultMouseSpeed, 0
MouseMove 1349, 683 ; Moves the mouse over the down arrow in template window
MouseClick ; Scrolls Down in the Template Window
Sleep 50
MouseClick
Sleep 50
MouseClick
Sleep 50
SetDefaultMouseSpeed, 2
break
}
else
{
break
}
}
}








	; === Stock & Check Coordinates ===	




siebelStockAndCheckOrderStatusChanges()
{
SetDefaultMouseSpeed, 0
OrderStatusX := 752 ; X coordinate of the "Order Status" down arrow in new Order Window
OrderStatusY := 295 ; Y coordinate of the "Order Status" down arrow in new Order Window
MouseMove %OrderStatusX%, %OrderStatusY% ; "Order Status" downarrow coordinates in new Order window
MouseClick
Sleep 50
MouseMove 682, 338 ; "Pending" option Coordinates in dropdown menu
MouseClick
Sleep 50
MouseMove 851, 704 ; Stock & Check button Coordinates in  new Order Window
MouseClick
SendInput {Enter}
SendInput {Enter}
SendInput {Enter}
MouseMove %OrderStatusX%, %OrderStatusY% ; "Order Status" downarrow coordinates in new Order window
MouseClick
Sleep 50
MouseMove 743, 311 ; "Open" option Coordinates in dropdown menu
MouseClick
Sleep 50
MouseMove %OrderStatusX%, %OrderStatusY% ; "Order Status" downarrow coordinates in new Order window
MouseClick
Sleep 50
MouseMove 739, 322 ; "Awaiting Payment" option Coordinates in dropdown menu
MouseClick
Sleep 50
SetDefaultMouseSpeed, 2
}




siebelSourceAndOriginFields()
{
SetDefaultMouseSpeed, 0
MouseMove 752, 477 ; "Origin" downarrow field Coordinates (Siebel)
MouseClick
Sleep 50
SendInput {Raw}Prescription - EPS
SendInput {Enter}
MouseMove 751, 373 ; "Source" downarrow field Coordinates (Siebel)
MouseClick
Sleep 50
SendInput {Raw}Professional Contact
SendInput {Enter}
SetDefaultMouseSpeed, 2
}




siebelAddOosFlier()
{
MouseMove 591, 702 ; New product button coordinates
MouseClick
checkForProgressBar()
SendInput {Raw}380NLTC034
Sleep 50
SendInput {Tab}
Sleep 50
SendInput {Tab}
Sleep 500
SendInput {Raw}1
Sleep 50
}
















	; ====================== WAIT FUNCTIONS ========================


checkForProgressBar()
{
Loop, 50
{
	PixelSearch, OutputVarX, OutputVarY, 1299, 1027, 1383, 1035, 000080, 150, Fast ; Loop looks for progress bar to appear before moving forward

if (ErrorLevel != 0)
Sleep 50
else
break
}
Loop, 50
{
	PixelSearch, OutputVarX, OutputVarY, 1299, 1027, 1383, 1035, 000080, 150, Fast ; Loop looks for progress bar to disappear before moving forward

if (ErrorLevel = 0)
Sleep 50
else
Return
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








	; ====================== SAFETY FUNCTIONS ========================


checkIfScreenIsScrolledToTop()
{
Loop
{
PixelGetColor, color, 1908, 190
if (color = 0xFFFFFF)
{
SetDefaultMouseSpeed, 0
	MouseMove 1907, 178 ; Scrolls up to the top of the window
MouseClick
MouseClick
MouseClick
MouseClick
Sleep 1000
SetDefaultMouseSpeed, 2
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
Loop
{
ImageSearch OutputVarX, OutputVarY, 490, 518, 983, 574, *70 %A_ScriptDir%\Images\AP_Order_Lines.png
if (ErrorLevel = 0)
{
;
}
else if (ErrorLevel != 0)
{
BlockInput, MouseMoveOff
MsgBox, 4096, Error, You can only run this script from AP Order Lines Tab. Press F12 to Exit the error message.
Reload
}
ImageSearch OutputVarX, OutputVarY, 6, 114, 426, 156, *70 %A_ScriptDir%\Images\Contacts.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
BlockInput, MouseMoveOff
MsgBox, 4096, Error, You can only run this script from AP Order Lines Tab. Press F12 to Exit the error message.
Reload
}
}
}




checkIfCurrentWindowIsCorrectForStockAndCheck()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 6, 114, 888, 176, *20 %A_ScriptDir%\Images\Orders.png
if (ErrorLevel = 0)
{
Break
}
else (ErrorLevel != 0)
{
BlockInput, MouseMoveOff
MsgBox, 4096, Error, You can only run this script while Stock Checking the order. Press F12 to Exit the error message.
Reload
}
}
}




checkIfStickyNotesAreRunning()
{
Loop
{
if WinExist("ahk_class ApplicationFrameWindow")
Return
else
MsgBox, 4096, Error, Please open Sticky Notes app before running the script! Press F12 to exit
Reload
}
}




copyStickyNotes()
{
Loop, 5
{
if (Clipboard = "")
{
Sleep 100
WinActivate, ahk_class ApplicationFrameWindow ; Opens up Sticky Notes app by its class
Sleep 100
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
ClipWait, 1
Sleep 50
}
else
{
Return
}
}
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
MsgBox, 4096, Error, Could not find the selected sticky notes! Press F12 to exit
Reload
}








	; ====================== MISC FUNCTIONS ========================


clickOnPXAfterGAS()
{
SetDefaultMouseSpeed, 0
	MouseMove -910, 275 ; General PX coordinates (So that the script selects the PX at the end)
	MouseClick
SetDefaultMouseSpeed, 2
}




clearClipboard()
{
Clipboard :=
return
}




keyFix()
{
GetKeyState, state, Shift
if (state = "D")
{
SendInput {Shift down}
SendInput {Shift up}
}
else
{
;
}

GetKeyState, state, Ctrl
if (state = "D")
{
SendInput {Ctrl down}
SendInput {Ctrl up}
}
else
{
;
}

GetKeyState, state, Alt
if (state = "D")
{
SendInput {Alt down}
SendInput {Alt up}
}
else
{
;
}
}








; Scripts created by PLBASIO & PLTOTO