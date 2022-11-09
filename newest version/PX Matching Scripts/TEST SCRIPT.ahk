
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





#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^p::
siebelTypeFieldInActiveNotes()
return







  ; ==================================================================== EXITS SCRIPT DOCUMENT ==========================================================

; This script exits the AHK application



#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

#x::ExitApp  ; Win+X
return





	; ==================================================================== RELOAD WHOLE SCRIPT DOCUMENT ==============================================================

; This script reloads the whole script document in case any of the scripts gets stuck

#UseHook
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

F12::
Reload

Return







checkForExpiryDateOnPX2()
{
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\PX_Expiry_Date_Green.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 37
MouseMove %VarPosX%, %VarPosY%
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, -1534, -8, -282, 1064, *150 %A_ScriptDir%\Images\PX_Expiry_Date_Purple.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 120
VarPosY := OutputVarY + 37
MouseMove %VarPosX%, %VarPosY%
Return
}
}




























removeCommentsField()
{
SetDefaultMouseSpeed, 0
MouseMove 879, 337
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
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SetDefaultMouseSpeed, 2
}



removeDescriptionField()
{
SetDefaultMouseSpeed, 0
MouseMove 882, 275
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
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SetDefaultMouseSpeed, 2
}



removeSiebelOrderNoField()
{
SetDefaultMouseSpeed, 0
MouseMove 1338, 404
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
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SendInput ^{End}
SendInput +{Home}
SendInput {backspace}
SendInput {backspace}
SetDefaultMouseSpeed, 2
}




setStatusDone()
{
SetDefaultMouseSpeed, 0
MouseMove 935, 380
Sleep 50
MouseClick
Sleep 50
MouseMove 936, 409
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
}



setTypeOpenedInError()
{
SetDefaultMouseSpeed, 0
MouseMove 715, 279
Sleep 50
MouseClick
Sleep 50
SendInput {Raw}Opened in Error
Sleep 50
SendInput {Enter}
SetDefaultMouseSpeed, 2
}



copySiebelOrderNumber()
{
MouseMove 1093, 647
MouseClick
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput +{Home}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
Sleep 100
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait, 1
Sleep 100
}


siebelFlagContactUnTick()
{

MouseMove 1613, 839
Sleep 100
MouseClick
MouseClick
Return
}

















#UseHook
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

^Delete::
BlockInput, MouseMove

Loop, 50
{
Sleep 200
var++
Gui,help:Add, Text,     , %var%
Gui,help:+toolwindow
Gui,help:Show
sleep,400
Gui, help: Destroy

















clearClipboard()
checkIfStickyNotesAreRunning()
checkIfScreenIsScrolledToTop()
checkIfCurrentWindowIsCorrect()
siebelClickOnNewInNotes()
checkForProgressBar()
siebelClickOnDropDownArrowInNotes()
siebelSelectDupPxAlert()
siebelFlagContactTick()
selectsPXNumberInAlchemyAndCopyIt()
siebelDescriptionFieldInActiveNotes()

Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
Sleep 50
Send ^{End}
Sleep 50
SendInput {Enter}
Sleep 50
SendInput {Enter}












siebelFlagContactUnTick()
checkForPatientNameToAppear()
checkForProgressBar()
}

BlockInput, MouseMoveOff
MsgBox Meczyk wygrany, kurczak podany
Return ; Script Run Finished




















































	;============================================== FUNCTIONS =====================================================
	
	
	; ====================== ALCHEMY FUNCTIONS ========================
	
	
	; === General Alchemy Functions ===

	


selectsPXNumberInAlchemyAndCopyIt()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Perscription_No.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 200
VarPosY := OutputVarY + 8
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
if RegExMatch(Clipboard, "(.{11})", OutputVar)
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
SetDefaultMouseSpeed, 2
Reload
}




selectsPXNumberInAlchemyAndCopyItForIsleOfMan()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Perscription_No.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 200
VarPosY := OutputVarY + 8
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
if RegExMatch(Clipboard, "(.{8})", OutputVar)
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
SetDefaultMouseSpeed, 2
Reload
}




selectsPXNumberInAlchemyAndCopyItForDuplicate()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Perscription_No.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 200
VarPosY := OutputVarY + 8
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




alchemyMoveToNextPxAndClickPostcode()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Additional_Comments.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 220
VarPosY := OutputVarY + 8
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
MouseClick
Sleep 50
SendInput {Enter}
MouseMove 74, 557 ; Reset button coordinates (Siebel)
Sleep 100
MouseClick
MouseMove 86, 355 ; Postcode search field coordinates (Siebel)
Sleep 100
MouseClick
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
}
MsgBox, 4096, Error, Cannot find Additional Comments Field. Press F12 to Exit the error message.
SetDefaultMouseSpeed, 2
Reload
}




alchemyRequiresAttentionDownArrow()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Return Script\Down_Arrow.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 10
VarPosY := OutputVarY + 10
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
Break
}
else
{
Sleep 100
}
}
MsgBox, 4096, Error, Cannot find "Requires Attention" field Down Arrow. Press F12 to Exit the error message.
Reload
}


alchemyRequiresAttentionComplete()
{
SendInput {Raw}Complete
SendInput {Enter}
}


alchemyRequiresAttentionMedicine()
{
SendInput {Raw}Medicine / Not Our Patient
SendInput {Enter}
}


alchemyRequiresAttentionNOO()
{
SendInput {Raw}No Outstanding Order
SendInput {Enter}
}


alchemyRequiresAttentionWP()
{
SendInput {Raw}Wrong Product
SendInput {Enter}
}


alchemyRequiresAttentionWQ()
{
SendInput {Raw}Wrong Quantity
SendInput {Enter}
}


alchemyCommentFieldClear()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Additional_Comments.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 220
VarPosY := OutputVarY + 8
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput +{Home}
Sleep 50
SendInput {Backspace}
Sleep 50
SetDefaultMouseSpeed, 2
Break
}
else
{
Sleep 100
}
}
MsgBox, 4096, Error, Cannot find Additional Comments field. Press F12 to Exit the error message.
SetDefaultMouseSpeed, 2
Reload
}


alchemyCommentField()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Additional_Comments.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 220
VarPosY := OutputVarY + 8
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
MsgBox, 4096, Error, Cannot find Additional Comments. Press F12 to Exit the error message.
Reload
}
}




alchemyClickOnSearchButton()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -1920, -10, -6, 488, *150 %A_ScriptDir%\Misc\Alchemy_Search_Button.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 15
VarPosY := OutputVarY + 10
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else 
{
Sleep 100
}
MsgBox Could not find the Alchemy search button. Press F12 to exit
Return
}
}




alchemyClickOnBatchNumberInSearchBoxAndDeleteContents()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 501, 423, 734, 625, *150 %A_ScriptDir%\Misc\Batch_Number_Search_Box.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 185
VarPosY := OutputVarY + 10
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput +{Home}
Sleep 50
SendInput {Backspace}
ClipWait, 1
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
MsgBox Could not find the Alchemy search box. Press F12 to exit 
BlockInput, MouseMoveOff
Return
}
}




alchemyClickOnPrescriptionNoInSearchBoxAndPasteContents()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 501, 423, 734, 625, *150 %A_ScriptDir%\Misc\Prescription_No_Search_Box.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 185
VarPosY := OutputVarY + 10
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
SendInput ^{End}
SendInput +{Home}
SendInput {Backspace}
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
SendInput {Backspace}
SendInput {Backspace}
SendInput {Backspace}
SendInput {Backspace}
Send *
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
MsgBox Could not find the Alchemy search box. Press F12 to exit 
BlockInput, MouseMoveOff
Return
}
}




alchemyClickOnSearchButtonInSearchBox()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 449, 316, 1066, 717, *150 %A_ScriptDir%\Misc\Alchemy_Search_Button_Search_Box.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 40
VarPosY := OutputVarY + 14
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else 
{
Sleep 100
}
MsgBox Could not find the Alchemy search box. Press F12 to exit 
BlockInput, MouseMoveOff
Return
}
}




alchemyClickOnPrescriptionNoInSearchBoxAndDeleteContents()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 501, 423, 734, 625, *150 %A_ScriptDir%\Misc\Prescription_No_Search_Box.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 185
VarPosY := OutputVarY + 10
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput +{Home}
Sleep 50
SendInput {Backspace}
ClipWait, 1
SetDefaultMouseSpeed, 2
Return
}
else 
{
Sleep 100
}
MsgBox Could not find the Alchemy search box. Press F12 to exit 
BlockInput, MouseMoveOff
Return
}
}




alchemyClickOnBatchNumberDownArrowInSearchBox()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 501, 423, 734, 625, *150 %A_ScriptDir%\Misc\Batch_Number_Search_Box.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 300
VarPosY := OutputVarY + 12
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
MouseMove 0, 17, 0, R
Sleep 50
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else 
{
Sleep 100
}
MsgBox Could not find the Alchemy search box. Press F12 to exit 
BlockInput, MouseMoveOff
Return
}
}
















	; ====================== SIEBEL FUNCTIONS ========================

	
	; === Activity Coordinates ===
	
	
siebelActivityTab()
{
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, 470, 498, 1884, 622, *60 %A_ScriptDir%\Misc\Activities_Tab.png
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
ImageSearch OutputVarX, OutputVarY, 565, 570, 613, 593, *100 %A_ScriptDir%\Misc\New_Activity_Button.png
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
ImageSearch OutputVarX, OutputVarY, 565, 570, 613, 593, *100 %A_ScriptDir%\Misc\New_Activity_Button.png
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
ImageSearch OutputVarX, OutputVarY, 492, 569, 1265, 720, *50 %A_ScriptDir%\Misc\New_Activity_Other.png
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
MouseMove 1276, 703 ; Clicks on OK
Sleep 100
MouseClick
MouseClick
Sleep 100
SetDefaultMouseSpeed, 2
}




selectsReturnToGpTemplate()
{
SetDefaultMouseSpeed, 0
MouseMove 1274, 657 ; Selects PX Return Template
MouseClick
SetDefaultMouseSpeed, 2
}



selectsShortfallTemplate()
{
SetDefaultMouseSpeed, 0
MouseMove 1274, 633 ; Selects PX Shortfall Template
MouseClick
SetDefaultMouseSpeed, 2
}




coreOptionCoordinates()
{
SetDefaultMouseSpeed, 0
MouseMove 711, 319 ; "Core" option coordinates	
MouseClick
SetDefaultMouseSpeed, 2
}




supportingOptionCoordinates()
{
SetDefaultMouseSpeed, 0
MouseMove 712, 357 ; "Supporting" option coordinates	
MouseClick
SetDefaultMouseSpeed, 2
}




sourceFieldDownArrowCoordinates()
{
SetDefaultMouseSpeed, 0
MouseMove 715, 326 ; "Source" field down arrow coordinates	
MouseClick
SetDefaultMouseSpeed, 2
}








	; === Duplicate Coordinates ===


siebelClickOnNewInNotes()
{
SetDefaultMouseSpeed, 0
MouseMove 1423, 899 ; Moves over New button in Active Notes on AP Order Lines  
MouseClick ; Clicks on New to create a New Active Note
SetDefaultMouseSpeed, 2
}




siebelClickOnDropDownArrowInNotes()
{
SetDefaultMouseSpeed, 0
MouseMove 1593, 841 ; Moves over Typ dropdown menu arrow in Active Notes on AP Order Lines  
SetDefaultMouseSpeed, 2
}




siebelSelectDupPxAlert()
{
SetDefaultMouseSpeed, 0
MouseClick ; Clicks on dropdown arrow in newly created Active Note (If Flag Contact collumn is before Type collumn in siebel then add another MouseClick to fix the error)
Sleep 50
MouseMove 1598, 882 ; Moves over Duplicate Perscription Alert
MouseClick ; Clicks on Duplicate Perscription Alert
Sleep 50
SetDefaultMouseSpeed, 2
}




siebelFlagContactTick()
{
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Misc\Flag_Contact_Label.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 14
VarPosY := OutputVarY + 30
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
Loop, 2
{
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Misc\Flag_Contact_Tick_Empty.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 7
VarPosY := OutputVarY + 7
MouseMove %VarPosX%, %VarPosY%
Sleep 100
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
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *120 %A_ScriptDir%\Misc\Flag_Contact_Ticked.png
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
ImageSearch OutputVarX, OutputVarY, 1260, 714, 1912, 1077, *120 %A_ScriptDir%\Misc\Description_Field_Active_Notes.png
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
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *100 %A_ScriptDir%\Misc\Type_Field_Active_Notes.png
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
ImageSearch OutputVarX, OutputVarY, 1260, 488, 1912, 1077, *100 %A_ScriptDir%\Misc\Type_Field_Active_Notes_Down_Arrow.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 6
VarPosY := OutputVarY + 6
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
Sleep 50
MouseMove 0, 40, 0, R
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
Sleep 50
Send {Ctrl Down}
SendInput {Raw}v
Send {Ctrl Up}
ClipWait 1
Sleep 200
}




siebelCheckPerscriptionFieldIfPXIsPastedIn()
{
MouseClick
SendInput ^{End}
SendInput +{Home}
Sleep 50
Send {Ctrl Down}
SendInput {Raw}c
Send {Ctrl Up}
ClipWait, 1
Sleep 200
if RegExMatch(Clipboard, "(EPS.{6}-.{6}-.{6})", OutputVar)
{
Return
}
else
{
SetDefaultMouseSpeed, 0
MouseMove 370, 484
MouseClick
SetDefaultMouseSpeed, 2
MsgBox, 4096, Error, "Script Failed - Please copy and paste the PX number manually. Press F12 to Exit the error message"
Reload
}
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
MouseMove 1700, 599 ; "Auto GAS Selected" button Coordinates
MouseClick
SetDefaultMouseSpeed, 2
}




clicksOnWhitespaceInSiebelForAutoGasSelected()
{
SetDefaultMouseSpeed, 0
MouseMove 1750, 469 ; Whitespace coordinates (Siebel)
Sleep 50
MouseClick
Sleep 100
SetDefaultMouseSpeed, 2
}








	; === Template Window Coordinates ===


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








	; === Stock % Check Coordinates ===
	
	
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
SendInput {Raw}Prescription - Paper
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




checkForSearchBoxToAppearAlchemy()
{
Sleep 100
	PixelGetColor, color, 967, 543 ; Gray field in search box coordinates
While color = 0xFFFFFF
{
	PixelGetColor, color, 967, 543 
Sleep 10
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



checkForWindowChangeStockCheck()
{
	PixelGetColor, color, 725, 565 ; "Team" field Coordinates (Siebel - gray color sample) - Loop looks for white color to appear at these coordinates before moving forward
While color = 0xEEEEEE
{
	PixelGetColor, color, 725, 565
Sleep 10
}
}








	; === Exemption Reason Functions ===


checkForExemptionReason()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\60-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Under-16-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\16-17-18.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw B
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Maternity-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Medical-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw E
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Prescription-Pre-Payment.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw F
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\War-Pension.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\HC2-Charges-Certificate.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw L
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Support.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw H
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Based.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw K
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Tax-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw M
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Partner-Pension-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw S
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Unknown.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Wales-Scot-Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Universal-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw U
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Exemption-Cert-Issued-By-MOD.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
MsgBox Error. Unknown Exemption Reason. Please F12 To Exit
Return
}
}
}








checkForExemptionReasonIsleOfMan()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\60-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Under-16-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\16-17-18.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw B
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Maternity-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw N
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Medical-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw K
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Prescription-Pre-Payment.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw H
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\War-Pension.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw L
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\HC2-Charges-Certificate.png
if (ErrorLevel = 0)
{
MsgBox This PX is not of Isle of Man type. Press F12 to exit
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Support.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Based.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Tax-Credit.png
if (ErrorLevel = 0)
{
MsgBox This PX is not of Isle of Man type. Press F12 to exit
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Partner-Pension-Credit.png
if (ErrorLevel = 0)
{
MsgBox This PX is not of Isle of Man type. Press F12 to exit
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Unknown.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Wales-Scot-Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Universal-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw U
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Exemption-Cert-Issued-By-MOD.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
MsgBox Error. Unknown Exemption Reason. Please F12 To Exit
Return
}
}
}








checkForExemptionReasonScottishStoma()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\60-years-of-age.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw C
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Under-16-years-of-age.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw A
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\16-17-18.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw B
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Maternity-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Medical-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Prescription-Pre-Payment.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw E
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\War-Pension.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw F
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\HC2-Charges-Certificate.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw K
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Support.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Based.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw I
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Tax-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw J
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Partner-Pension-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw H
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Unknown.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Wales-Scot-Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Universal-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw U
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Exemption-Cert-Issued-By-MOD.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw F
Return
}
else if (ErrorLevel != 0)
{
MsgBox Error. Unknown Exemption Reason. Please F12 To Exit
Return
}
}
}








checkForExemptionReasonScottishContinence()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\60-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Under-16-years-of-age.png
if (ErrorLevel = 0)
{
Break
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\16-17-18.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw B
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Maternity-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Medical-Exemption.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw D
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Prescription-Pre-Payment.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw E
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\War-Pension.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw F
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\HC2-Charges-Certificate.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw K
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Support.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw G
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Income-Based.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw I
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Tax-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw J
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Partner-Pension-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw H
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Unknown.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Wales-Scot-Not-Exempt.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw P
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Universal-Credit.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw U
Return
}
else if (ErrorLevel != 0)
{
;
}
ImageSearch OutputVarX, OutputVarY, 1313, 457, 1569, 525, *150 %A_ScriptDir%\Exemption Reasons\Exemption-Cert-Issued-By-MOD.png
if (ErrorLevel = 0)
{
alchemyCommentFieldClear()
SendRaw F
Return
}
else if (ErrorLevel != 0)
{
MsgBox Error. Unknown Exemption Reason. Please F12 To Exit
Return
}
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



checkIfScreenIsScrolledToTopInSearch()
{
Loop
{
ImageSearch OutputVarX, OutputVarY, 10, 7, 1915, 553, *100 %A_ScriptDir%\Misc\siebelPatientsSearchUpArrow.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 8
VarPosY := OutputVarY + 17
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
MouseClick
SetDefaultMouseSpeed, 2
Return
}
else
{
Break
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
ImageSearch OutputVarX, OutputVarY, 490, 518, 983, 574, *70 %A_ScriptDir%\Misc\AP_Order_Lines.png
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
ImageSearch OutputVarX, OutputVarY, 6, 114, 426, 156, *70 %A_ScriptDir%\Misc\Contacts.png
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


clearClipboard()
{
Clipboard :=
return
}




insertDelScottishPx()
{
WinActivate, Alchemy Index Station - \\Remote
Loop, 5
{
ImageSearch OutputVarX, OutputVarY, -927, -9, -5, 1063, *50 %A_ScriptDir%\Misc\Additional_Comments.png
if (ErrorLevel = 0)
{
SetDefaultMouseSpeed, 0
VarPosX := OutputVarX + 220
VarPosY := OutputVarY + 8
MouseMove %VarPosX%, %VarPosY%
Sleep 50
MouseClick
MouseClick
Sleep 50
SendInput ^{End}
Sleep 50
SendInput {Raw}//  DEL
Sleep 50
SendInput {Left}
Sleep 20
SendInput {Left}
Sleep 20
SendInput {Left}
Sleep 20
SendInput {Left}
Sleep 20
SetDefaultMouseSpeed, 2
Return
}
else
{
Sleep 100
}
}
MsgBox, 4096, Error, Cannot find Additional Comments field. Press F12 to Exit the error message.
Reload
}




alchemyGeneralPxListCoordinates()
{
SetDefaultMouseSpeed, 0
MouseMove -1663, 197
SetDefaultMouseSpeed, 2
}
















; Scripts created by PLBASIO & PLTOTO