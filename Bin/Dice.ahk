/*
	Copyright (C) 2018-2020 Lucas Jaramillo
	
	This file is part of Dice.

	Dice is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Dice is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Dice. If not, see <https://www.gnu.org/licenses/>.
*/

#Persistent
#NoTrayIcon
#SingleInstance, Ignore
#Warn All, Off

SetBatchLines -1
SetWinDelay 0
SetControlDelay 0

; If argument = /c, /c #, or no arguments at all, the saver should pop up its configuration (settings) dialog
; If argument = /s, the script should run normally
; If argument = /p #, or /l #, the saver should treat the #### as the decimal representation of an HWND, and make child window to run in preview mode inside that window
; If argument = /a #, (this argument should only used in 95 and Plus) the saver should pop up a password-configuration dialog

; Parse through each part of the argument and append it to a single string
For n, param in A_Args
	Global argument .= param . " "

; Retrieve the first 2 characters from the argument
StringLeft, switch, % A_Args[1], 2

; Here we keep track of what mode we will be running in - either settings mode or screensaver mode
; /R is a switch used internally by AutoHotkey to signal that a restart has occurred
If switch in ,/c,/C,/r,/R
	mode = 1
Else
	mode = 0

; We need to check if all directories exist
Global workingDir := A_AppData . "\Dice"
dirArr := [workingDir, workingDir . "\Win98", workingDir . "\WinXP", workingDir . "\WinVista", workingDir . "\Linux"]
Loop, % dirArr.Length()
{
	temp := dirArr[A_Index]
	IfNotExist, %temp%
	{
		Try
			FileCreateDir, %temp%
		Catch
			severeError(1)
	}
}

If A_OSVersion in WIN_2000,WIN_2003,WIN_XP
	oStatus = 1
Else If ((A_OSVersion in WIN_VISTA,WIN_7,WIN_8,WIN_8.1) || (SubStr(A_OSVersion, 1, 2) = 10))
	oStatus = 2
Else
{
	IniRead, temp, %workingDir%\Settings.ini, Control, warnOSVersion
	If (temp != 1)
	{
		MsgBox, 0x34, %A_ScriptName%, Your current operating system is unknown or unsupported.`n`nThe program has detected '%A_OSVersion%'.`n`nAre you sure that you want to continue?
		IfMsgBox, Yes
		{
			Try
				IniWrite, 1, %workingDir%\Settings.ini, Control, warnOSVersion
			Catch
				severeError(1)
			oStatus = 2
		}
		Else
			ExitApp
	}
}

; Creates arrays that store info about the screensavers
#Include ListArrays.ahk

scrnsvAvail := {}
If (oStatus >= 1)
{
	For x,y in scrnsvWin98
		scrnsvAvail[x] := y
	For x,y in scrnsvWinXP
		scrnsvAvail[x] := y
}
If (oStatus >= 2)
{
	For x,y in scrnsvWinVista
		scrnsvAvail[x] := y
	For x,y in scrnsvLinux
		scrnsvAvail[x] := y
}

IfNotExist, %workingDir%\Settings.ini
{
	Gui, Font, s15 Bold Italic, Lucida Console
	Gui, Add, Text, x0 y0 w355 h40 +0x200 +Center, Preparing for first use...
	Gui, -Caption +Owner
	Gui, Show, xCenter yCenter w355 h40, Window
	Gosub, INIWRITER

	; Install all files to their respective locations, and do not overwrite if they already exist
	#Include FileList.ahk
}

If (mode = 1) ; Settings mode
{
	; Stores enable status of screensavers
	Global enabledScrnsv := {}
}
Else
{
	; Stores file locations of all enabled screensavers
	chooseScrnsvs := []
}
; Parses through the INI to determine which screensavers have been enabled
For key in super
{
	IniRead, temp, %workingDir%\Settings.ini, Boxes, scr%A_Index%
	If (temp = "ERROR")
		settingsError()
	Else If ((temp != 0) && (temp != 1))
		settingsError()
	Else
	{
		If (mode = 1) ; Settings mode
			enabledScrnsv[key] := temp
		Else ; Screensaver mode
		{
			If ((scrnsvAvail.HasKey(key)) && (temp = 1))
			{
				tempLocal := workingdir . super[key]
				chooseScrnsvs.push(tempLocal)
			}
		}
	}
}

; The user might uninstall or relocate their custom screensavers, and we need to keep track if a file is no longer available
fixCustSettings = 0
; Helps us keep track of any missing values, e.g. it skips from path7 to path253
trackBlanks = 0
; We need to keep track of how many custom screensavers we have for the GUI
custSize = 0
; Holds a map of names to locations of all of the custom screensavers for the GUI
custScrnsv := {}
; Now we need to parse through the custom screensavers
Loop, 500
{
	IniRead, temp, %workingDir%\Settings.ini, Custom, path%A_Index%
	If (temp != "ERROR")
	{
		IfNotExist, %temp%
		{
			; If the custom screensaver no longer exists, quietly delete its entry in the background, unless there is an error doing so
			Try
				IniDelete, %workingDir%\Settings.ini, Custom, path%A_Index%
			Catch
				severeError(1)

			; We need to track that we deleted a value
			fixCustSettings = 1
		}
		; We need to check to make sure the script doesn't run itself or we'll have an infinite loop
		Else If (temp = A_ScriptFullPath)
		{
			Try
				IniDelete, %workingDir%\Settings.ini, Custom, path%A_Index%
			Catch
				severeError(1)

			fixCustSettings = 1
		}
		Else
		{
			; We will append the custom screensaver to the arrays as long as it's not a duplicate
			tempKey := retrieveName(temp, 1)
			If ((!(custScrnsv.HasKey(tempKey))) || ((custScrnsv.HasKey(tempKey)) && (custScrnsv[tempKey] != temp)))
			{
				If (mode = 1) ; Settings mode
				{
					; Append to the map of name to file location
					custScrnsv[tempKey] := retrieveName(temp, 2)
					custListTemp .= tempKey . "|"
					custSize++
				}
				Else ; Screensaver mode
					chooseScrnsvs.Push(temp)
			}
			Else
			{
				fixCustSettings = 1

				Try
					IniDelete, %workingDir%\Settings.ini, Custom, path%A_Index%
				Catch
					severeError(1)
			}
		}

		; If trackBlanks = 1, this means there is a missing value that comes before this index
		; For example, if value 4 is missing, it sets trackBlanks to 1
		; So, if value 5 is present, we will go into this section of the loop and realize the previous was not present
		; Therefore, we now know there is a missing value and will have to re-index the INI file later on
		If (trackBlanks = 1)
			fixCustSettings = 1
	}
	Else
		trackBlanks = 1
}

; If a screensaver entry has been removed from the INI file, we have to re-index everything
If (fixCustSettings = 1)
{
	; By writing this value to the INI file, we will warn the user the next time they open the Settings that some custom screensavers have been removed
	Try
		IniWrite, 1, %workingDir%\Settings.ini, Control, warnFilesChanged
	Catch
		severeError(1)

	; We are going to re-use this variable to keep track of where we have to re-index things
	fixCustSettings = 0

	Loop, 500
	{
		IniRead, temp, %workingDir%\Settings.ini, Custom, path%A_Index%
		If (temp = "ERROR")
		{
			If (fixCustSettings != 1)
			{
				failedPosition := A_Index
				; Once we find our first corrupted value, we no longer want to go this block of code since we have to shift everything up below it
				fixCustSettings = 1	
			}
		}
		Else
		{
			If (fixCustSettings != 0)
			{
				Try
				{
					; Delete current entry
					IniDelete, %workingDir%\Settings.ini, Custom, path%A_Index%
					; Write the current entry back into the INI file, in the position that comes before it
					IniWrite, %temp%, %workingDir%\Settings.ini, Custom, path%failedPosition%
				}
				Catch
					severeError(1)

				; Go to next position
				failedPosition++
			}
		}
	}
}

; Destroy the GUI that says "Preparing for first use..."
Gui, Destroy

If (mode = 1)
	Goto, SETTINGSZONE
Else If (mode = 0)
	Goto, SCRNSVRUN
ExitApp

SCRNSVRUN:
; If no screensavers are enabled for some reason, don't do anything from now on
If (chooseScrnsvs.Length() = 0)
	ExitApp

Random, temp, 1, chooseScrnsvs.Length()
scrnsvCurr := chooseScrnsvs[temp] . " " . argument

; If for some reason we fail, we will try a maximum of 10 times before giving an error
attempt++

Try
	Run, %scrnsvCurr%
Catch
{
	If (attempt <= 10)
		Goto, SCRNSVRUN
	Else
		Msgbox, 0x10, %A_ScriptName%, Failed to launch the random screensaver.`n`n[%scrnsvCurr%]
}
ExitApp

SETTINGSZONE:
If (oStatus = 2)
	ddlFill = All||Windows 98|Windows XP|Windows Vista|Linux
Else
	ddlFill = All||Windows 98|Windows XP

; Setting up some important arrays for the Settings button
; We do this up here so we don't have to re-create these arrays each time we press the button
specialScrSet := ["Bubbles (Vista)", "Mystify", "Ribbons", "Aurora"]
hidSwitch := ["/Bubb", "/Myst", "/Ribb", "/Auro"]

; If there has been a change to the Custom section of the configuration data since last visit to settings
IniRead, warnFilesChanged, %workingDir%\Settings.ini, Control, warnFilesChanged

Gui, Add, Button, x42 y277 w100 h30, OK
Gui, Add, Button, x151 y277 w100 h30, Cancel
Gui, Add, Tab3, x7 y7 w280 h260 +AltSubmit VmainTab gWARN, General|Custom|About

Gui, Tab, General
Gui, Add, ListView, x16 y35 w262 h192 +AltSubmit +Checked +Grid +LV0x10000 VbuiltList gLISTSELECT, Name
Gui, Add, DropDownList, x162 y234 w115 +AltSubmit HwndsysDDL vDDL gDDLHANDLER, %ddlFill%
PostMessage, 0x153, -1, 17,, ahk_id %sysDDL%
Gui, Add, Button, x15 y233 w67 h25 +Disabled VbuiltSett, Settings
Gui, Add, Button, x88 y233 w67 h25 +Disabled VbuiltPrev, Preview

Gui, Tab, Custom
Gui, Add, ListView, x16 y35 w262 h160 +AltSubmit +Grid +LV0x10000 VcustList gCUSTLISTSELECT, Name
Gui, Add, Button, x15 y202 w67 h25 VcustAdd, Add
Gui, Add, Button, x88 y202 w67 h25 +Disabled VcustRemove, Remove
Gui, Add, Button, x161 y202 w117 h25 +Disabled VopenF, Open File Location
Gui, Add, Button, x15 y233 w67 h25 +Disabled VcustSett gCUSTSETTINGS, Settings
Gui, Add, Button, x88 y233 w67 h25 +Disabled VcustPrev gCUSTPREVIEW, Preview
Gui, Add, Text, x162 y234 w115 h23 +Border +0x200 VamountUsed, %custSize% / 500 used

Gui, Tab, About
Gui, Add, Edit, x16 y35 w262 h192 +ReadOnly, Description: Dice is a screensaver randomizer program that contains a collection of various screensavers from different operating systems`n`nAuthor: Lucas Jaramillo`n`nVersion: 8.0`n`nLicense: GNU GPLv3, MIT/X11 (XScreenSaver)`n`nCredits:`n         XScreenSaver - for Linux screensavers`n         Katahiromz - for porting XScreenSaver`n         Microsoft - for Windows screensavers`n         Freepik - for program icon`n`nDisclaimer: Certain screensavers bundled with this program may not be subject to the same terms and conditions and are property of their respective owners
Gui, Add, Button, x15 y233 w100 h25, Reset Settings
Gui, Add, Text, x122 y234 w100 h23 +0x200, Only applies to Dice

Menu, lvRightClick, Add, Enable, CONTEXTENAB
Menu, lvRightClick, Add, Disable, CONTEXTDISAB
Menu, lvRightClick, Add, Install to System, CONTEXTIS

; Add the items to the ListView that we stored when reading INI way above in the code
Loop, Parse, custListTemp, |
{
	If (A_LoopField = "")
		Continue
	LV_Add("", A_LoopField)
}
If (custSize = 500)
	GuiControl, Disable, custAdd
; Set the list on the first tab to be the default (the second was the default since it was most recently created)
Gui, ListView, builtList
; Determine what values should appear in the ListView on first tab
Gosub, DDLHANDLER

Gui, +HWNDmainUI
HotKey, IfWinActive, ahk_id %mainUI%
HotKey, ^A, SELECTALL
Gui, Show, xCenter yCenter w292 h318, Dice
Return

; Warn user if the custom values have been changed behind the scenes
WARN:
If (warnFilesChanged = 1)
{
	GuiControlGet, temp,, mainTab
	If (temp != 2)
		Return

	Gui, +OwnDialogs
	MsgBox, 0x30, Warning, It appears that files have changed since the last time you've opened these settings.`n`nCertain custom screensavers have been removed since they no longer exist in their specified locations.

	warnFilesChanged = 0

	Try
		IniDelete, %workingDir%\Settings.ini, Control, warnFilesChanged
	Catch
		severeError(1)
}
Return

; This routine disables or enables buttons in the General tab and keeps track of selected items
LISTSELECT:
Gui, ListView, builtList

; We only want to focus on events in which the user selects a row or clicks on a checkbox
If ((A_GuiEvent != "I") && (ErrorLevel != "c"))
	Return

; If the user has clicked on the checkboxes
If (ErrorLevel = "c")
{
	; Get the text at the current checked/unchecked item
	LV_GetText(theChecked, A_EventInfo)

	; This is a strange hack to get the checkbox status
	; Basically, we go to the previous item and go to the next value (which is the value we want to look at to begin with)
	; We see if this item is checked or not and store the boolean status in the array
	; We have to do this because ListView only supports retrieval of the NEXT selected item (not current)
	enabledScrnsv[theChecked] := (A_EventInfo = (LV_GetNext(A_EventInfo - 1 , "Checked")))
	Return
}

; This section is for when the user actually selects items
num = 0
; Keep track of how many items have been selected total
successCount = 0
Loop
{
	num := LV_GetNext(num)

	; If the above returns 0, we don't need to parse through this anymore
	If (num = 0)
		Break

	successCount++
	LV_GetText(theSelect, num)
}

If ((successCount = 0) || (successCount > 1))
{
	; If more than one item is selected (or if no items are selected), disable the 2 buttons
	GuiControl, Disable, builtSett
	GuiControl, Disable, builtPrev
	Menu, lvRightClick, Disable, Install to System
}
Else If (successCount = 1)
{
	GuiControl, Enable, builtSett
	GuiControl, Enable, builtPrev
	Menu, lvRightClick, Enable, Install to System
}
Return

; Changes the items in the listbox depending on the value of the DDL
DDLHANDLER:
GuiControlGet, whichDDL,, DDL
If (whichDDL = 1)
	scrnsvType := scrnsvAvail
Else If (whichDDL = 2)
	scrnsvType := scrnsvWin98
Else If (whichDDL = 3)
	scrnsvType := scrnsvWinXP
Else If (whichDDL = 4)
	scrnsvType := scrnsvWinVista
Else
	scrnsvType := scrnsvLinux
LV_Delete()
GuiControl, Disable, builtSett
GuiControl, Disable, builtPrev
For key in scrnsvType
{
	If (enabledScrnsv[key] = 1)
		LV_Add("Check", key)
	Else
		LV_Add("", key)
	LV_ModifyCol(1, "AutoHDR") ; Auto-resize on add
}
Return

BUTTONSETTINGS:
Loop, 4
{
	If (theSelect = specialScrSet[A_Index])
	{
		specialSwitch := hidSwitch[A_Index] . " /" . mainUI
		Try
			Run, %workingDir%\DiceHiddenSettings.exe %specialSwitch%,,, currentPID
		Catch
		{
			scrnSvErr(workingDir . "\DiceHiddenSettings.exe" . " " . specialSwitch)
			Return
		}
		Gui, +Disabled
		Process, WaitClose, %currentPID%
		Gui, -Disabled
		Return
	}
}

whatScreen := workingDir . super[theSelect]
Try
	Run, %whatScreen% /C
Catch
	scrnSvErr(whatScreen)
Return

BUTTONPREVIEW:
whatScreen := workingDir . super[theSelect]
Try
	Run, %whatScreen% /S
Catch
	scrnSvErr(whatScreen)
Return

; This routine disables or enables buttons in the Custom tab
CUSTLISTSELECT:
Gui, ListView, custList

If ((A_GuiEvent != "I") && (ErrorLevel != "c"))
	Return

; This section is for when the user actually selects items
num = 0
; Keep track of how many items have been selected total
successCount = 0
Loop
{
	num := LV_GetNext(num)

	; If the above returns 0, we don't need to parse through this anymore
	If (num = 0)
		Break

	successCount++
	LV_GetText(theSelectCust, num)
}

If (successCount = 0)
{
	; If nothing has been selected, disable all buttons
	GuiControl, Disable, custRemove
	GuiControl, Disable, openF
	GuiControl, Disable, custSett
	GuiControl, Disable, custPrev
}
Else If (successCount = 1)
{
	; If only one item has been selected, enable all buttons
	GuiControl, Enable, custRemove
	GuiControl, Enable, openF
	GuiControl, Enable, custSett
	GuiControl, Enable, custPrev
}
Else
{
	; If multiple items have been selected, enable only the remove button, and disable all others
	GuiControl, Enable, custRemove
	GuiControl, Disable, openF
	GuiControl, Disable, custSett
	GuiControl, Disable, custPrev
}
Return

CUSTSETTINGS:
whatScreen :=  custScrnsv[theSelectCust] . "\" . theSelectCust
Try
	Run, %whatScreen% /C
Catch
	scrnSvErr(whatScreen)
Return

CUSTPREVIEW:
whatScreen := custScrnsv[theSelectCust] . "\" . theSelectCust
Try
	Run, %whatScreen% /S
Catch
	scrnSvErr(whatScreen)
Return

BUTTONADD:
; We need to keep track of how many values we have left
maxSelectAmount := 500 - custSize

Gui, +OwnDialogs
FileSelectFile, theFile, m12, c:, Select a Screensaver, *.scr
If (theFile = "")
	Return

successAmount = 0
Loop, Parse, theFile, `n
{
	; The first value we parse will be the file location, and all others after are the individual file names
	If (A_Index != 1)
	{
		If (successAmount = maxSelectAmount)
		{
			; We disable the button here because we want it to be disabled before the message appears
			; We also do it below once we exit the loop in case we never made it to this section
			GuiControl, Disable, custAdd
			Gui, +OwnDialogs
			MsgBox, 0x30, Warning, Could not add all of the screensavers that were selected because the list is now full.
			Break
		}
		If (A_ScriptFullPath = tempCustPath . A_LoopField)
		{
			; Check if the user selected Dice itself as a custom value
			; We will not allow this, because then we will have an infinite loop of the program calling itself
			skippedVal = 1
			Continue
		}
		If (custScrnsv.HasKey(A_LoopField))
		{
			; If we found a duplicate entry, we will not add it
			If (custScrnsv[A_LoopField] = tempCustPath)
			{
				skippedVal = 1
				Continue
			}
		}

		custScrnsv[A_LoopField] := tempCustPath
		LV_Add("", A_LoopField)
		LV_ModifyCol(1, "AutoHDR") ; Auto-resize on add
		custSize++
		successAmount++
		GuiControl,, amountUsed, %custSize% / 500 used
	}
	Else
		tempCustPath := A_LoopField . "\"
}

; If we reached the max size, disable the Add button
If (custSize = 500)
	GuiControl, Disable, custAdd
Gui, Submit, NoHide

If (skippedVal = 1)
{
	skippedVal = 0
	Gui, +OwnDialogs
	Msgbox, 0x30, Warning, Some screensavers were skipped because they were found to be duplicates.
}
Return

BUTTONREMOVE:
num = 0
deleteList := ""
deleteAmount = 0

Loop
{
    num := LV_GetNext(num)
    If not num
    	Break
    deleteList .= num . "|"
    deleteAmount++
}

; Get rid of last pipe
StringTrimRight, deleteList, deleteList, 1
; Reverse the list - we want to delete the last item, then the first, etc. because if we DON'T go in reverse order, it screws up the index
Sort, deleteList, N R D|
Loop, Parse, deleteList, |
{
	If (A_LoopField = "")
		Continue
	LV_GetText(deleteVal, A_LoopField)
	custScrnsv.Delete(deleteVal)
	LV_Delete(A_LoopField)
}

custSize -= deleteAmount
; If we are no longer the max size, enable the Add button (in case it was disabled prior)
If (custSize < 500)
	GuiControl, Enable, custAdd
GuiControl, Disable, custRemove
GuiControl, Disable, openF
GuiControl, Disable, custSett
GuiControl, Disable, custPrev
GuiControl,, amountUsed, %custSize% / 500 used
Return

BUTTONOPENFILELOCATION:
; We want to extract the part of the file path that comes before the file name (aka the part up to and including the last "\")
; So we use SubStr to retrieve this portion of the string, starting at 1, up to the position of the last "\"
; The last "\" was found by InStr by starting at the back of the string (in which the last index was retrieved by StrLen)
fileLoc := retrieveName(custScrnsv[theSelectCust], 2)
Try
	Run, explore %fileLoc%
Catch
{
	Gui, 1:+OwnDialogs
	MsgBox, 0x10, Error, Failed to open the file location of the screensaver.`n`n[%fileLoc%]
}
Return

BUTTONRESETSETTINGS:
Gui, +OwnDialogs
MsgBox, 0x34, Warning, Are you sure you want to reset the settings?`n`nThis action cannot be undone.
IfMsgBox, Yes
{
	resetSettings()
	ExitApp
}
Return

GUICONTEXTMENU:
If ((A_GuiControl != "builtList") || (LV_GetCount("S") = 0))
	Return
checkedCount = 0
selectedCount = 0
checkedPos = 0
selectedPos = 0
Loop
{
	selectedPos := LV_GetNext(selectedPos)
	If (selectedPos != 0)
	{
		checkedPos := LV_GetNext(selectedPos - 1, "C")
		If (checkedPos = selectedPos)
			checkedCount++
		Else
			selectedCount++
	}
	Else
		Break
}

If (selectedCount = 0)
{
	; Disable the enable button
	Menu, lvRightClick, Disable, Enable
	; Enable the disable button
	Menu, lvRightClick, Enable, Disable
}
Else If (checkedCount = 0)
{
	; Enable the enable button
	Menu, lvRightClick, Enable, Enable
	; Disable the disable button
	Menu, lvRightClick, Disable, Disable
}
Else
{
	; Enable the enable button
	Menu, lvRightClick, Enable, Enable
	; Enable the disable button
	Menu, lvRightClick, Enable, Disable
}

Menu, lvRightClick, Show
Return

CONTEXTENAB:
enabDisab = 1
Goto, CONTEXTPARSE

CONTEXTDISAB:
enabDisab = 0

CONTEXTPARSE:
Loop
{
	selectedPos := LV_GetNext(selectedPos)
	If (selectedPos != 0)
	{
		LV_GetText(currentVal, selectedPos)
		If (enabDisab = 1)
			LV_Modify(selectedPos, "Check")
		Else
			LV_Modify(selectedPos, "-Check")
		enabledScrnsv[currentVal] := enabDisab
	}
	Else
		Break
}
Return

CONTEXTIS:
whatScreen := workingDir . super[theSelect]
Try
	Run, rundll32.exe desk.cpl`, InstallScreenSaver %whatScreen%
Catch
{
	Gui, +OwnDialogs
	Msgbox, 0x10, Error, Failed to install the screensaver to the system.
}
Return

; Allows users to press Ctrl + A to select all in the ListViews
SELECTALL:
GuiControlGet, currFocus, FocusV
If ((currFocus != "builtList") && (currFocus != "custList"))
	Return
Loop, % LV_GetCount()
    LV_Modify(A_Index, "Select")
Return

BUTTONOK:
For key in super
{
		Try
			IniWrite, % enabledScrnsv[key], %workingDir%\Settings.ini, Boxes, scr%A_Index%
		Catch
			severeError(1)
}

; We will delete this entire section to remove any dirty values and re-write in accordance to the values in the ListView
Try
	IniDelete, %workingDir%\Settings.ini, Custom
Catch
	severeError(1)
For key in custScrnsv
{
	Try
		IniWrite, % custScrnsv[key] . key, %workingDir%\Settings.ini, Custom, path%A_Index%
	Catch
		severeError(1)
}
ExitApp

BUTTONCANCEL:
GUICLOSE:
GUIESCAPE:
ExitApp

; Sets up the INI file for first use
INIWRITER:
For key in super
{
	If (scrnsvAvail.HasKey(key))
		temp = 1
	Else
		temp = 0

	Try
		IniWrite, %temp%, %workingDir%\Settings.ini, Boxes, scr%A_Index%
	Catch
		severeError(1)
}
Return

GUISIZE:
; This functions as an easter egg if you attempt to maximize the GUI via Task Manager or some other method
if (A_EventInfo = 2)
{
	Gui, +OwnDialogs
	WinRestore
	randIcon += 10
	
	If (randIcon > 30)
	{
		MsgBox, % "0x" . randIcon, RUUUUDE!!!!, I AM LEAVING NOW BECAUSE I AM SICK AND TIRED OF YOU.`n`nGOODBYE.`n`nFORGET ALL YOUR SETTINGS.
		ExitApp
	}
	Else If (randIcon = 30)
		MsgBox, % "0x" . randIcon, Ouch!, LISTEN I'm a tiny little box and it HURTS to get stretched.`n`nLEAVE ME ALONE.
	Else
		MsgBox, % "0x" . randIcon, STOP!!!, STOP MAXIMIZING ME!!!!`n`nUGH!
}
Return

listBuilder(array)
{
	For key in array
		temp .= key . ","
	Return temp
}

; Mode determines if we return the folder or the file name
retrieveName(path, mode)
{
	If (mode = 1)
	{
		; Retrieve the file
		string := SubStr(path, InStr(path, "\", CaseSensitive := false, StartingPos = 0) + 1, StrLen(path))
	}
	Else
	{
		; Retrieve the folder
		string := SubStr(path, 1, InStr(path, "\", CaseSensitive := false, StartingPos := 0))
	}
	Return string
}

resetSettings()
{
	Try
		FileDelete, %workingDir%\Settings.ini
	Catch
	{
		IfExist, %workingDir%\Settings.ini
			severeError(1)
	}

	temp := A_ScriptFullPath . " " . argument . "/restart"
	Run, %temp%
	ExitApp
}

severeError(errorCode)
{
	Gui, Destroy
	MsgBox, 0x10, %A_ScriptName%, Catastrophic failure!`n`n[%errorCode%]
	ExitApp
}

scrnSvErr(fileLocation)
{
	Gui, +OwnDialogs
	Msgbox, 0x10, Error, Failed to launch the screensaver.`n`n[%fileLocation%]
	Return
}

settingsError()
{
	Gui, Destroy
	MsgBox, 0x10, %A_ScriptName%, An error occurred while attempting to read the configuration data.`n`nYour settings have been corrupted and will be reset as an attempt to resolve the issue.
	resetSettings()
	ExitApp
}