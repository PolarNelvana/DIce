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
DetectHiddenWindows, On

; Stores which type of mode we are in
Global currentMode
Global switch

; Retrieve the first parameter (which is the mode)
StringLeft, switch, % A_Args[1], 5

; Retrieve the second parameter (which is the HWND of the parent)
; We need to trim the slash
StringTrimLeft, parentHWND, % A_Args[2], 1

If (switch = "/Bubb")
	Goto, BUBBLESPAGE
Else If (switch = "/Myst")
	Goto, MYSTIFYPAGE
Else If (switch = "/Ribb")
	Goto, RIBBONSPAGE
Else If (switch = "/Auro")
	Goto, AURORAPAGE

MsgBox, 0x40, %A_ScriptName%, No argument was passed.`n`nPlease run this program under /Bubb, /Myst, /Ribb, or /Auro.`n`nThe program will now exit.
ExitApp

BUBBLESPAGE:
; Describes the current mode (used for registry access)
currentMode := "Bubbles"
; Contains the names of the individual registry entries we are dealing with
varArray := ["MaterialGlass", "ShowBubbles", "ShowShadows", "SpanMultiMon", "Radius", "SphereDensity", "TurbulenceForce", "TurbulenceNumOctaves", "TurbulenceSpeed"]
; Contains the text for each section of the GUI
textArray := ["Style:", "Background:", "Shadows:", "Span Multiple Monitors:", "Size:", "Density:", "Turbulence Force:", "Turbulence Octaves:", "Color Cycle Speed"]
; 0 = DropDownList, !0 = ComboBox (the number indicates which position a custom value will be located)
elementArray := [0, 0, 0, 0, 7, 5, 6, 5, 5]
; Contains the list for each individual DDL/Combo
listArray := ["Default|Transparent|Solid", "Default|Transparent|Black", "Default|On|Off", "Default|On|Off", "Default|Tiny|Small|Medium|Large|Huge", "Default|Low|Medium|High", "Default|None|Low|Medium|High", "Default|Low|Medium|High", "Default|Low|Medium|High"]
; Each of these arrays serves multiple purposes
; The last value is the maximum allowed value, and the second is the minimum
; Each value also corresponds to a value in listArray above, for example, "Medium" pairs to the 4th value of allow5
allow1 := ["", 1, 0]
allow2 := ["", 1, 0]
allow3 := ["", 1, 0]
allow4 := ["", 1, 0]
allow5 := ["", 1090000000, 1100000000, 1110000000, 1120000000, 1130000000]
allow6 := ["", 991000000, 1545500000, 2100000000]
allow7 := ["", 1000000000, 1100000000, 1150000000, 2000000000]
allow8 := ["", 1, 128, 255]
allow9 := ["", 1000000000, 1500000000, 2000000000]
; Sets the positions of the bottom elements of the GUI
yBottButtons = 321
; Sets the height of the entire GUI
guiHeight = 370
Goto, PAGEMAKER

MYSTIFYPAGE:
currentMode := "Mystify"
varArray := ["Blur", "SpanMultiMon", "CameraFOV", "LineWidth", "NumLines"]
textArray := ["Blur:", "Span Multiple Monitors:", "Field of View:", "Line Width:", "Density:"]
elementArray := [0, 0, 5, 5, 5]
listArray := ["Default|On|Off", "Default|On|Off", "Default|Zoomed|Medium|Distant", "Default|Thin|Medium|Thick", "Default|Low|Medium|High"]
allow1 := ["", 1, 0]
allow2 := ["", 1, 0]
allow3 := ["", 1000000000, 1500000000, 2000000000]
allow4 := ["", 1000000000, 1040000000, 1080000000]
allow5 := ["", 1, 50, 100]
yBottButtons = 189
guiHeight = 238
Goto, PAGEMAKER

RIBBONSPAGE:
currentMode := "Ribbons"
varArray := ["Blur", "SpanMultiMon", "CameraFOV", "RibbonWidth", "NumRibbons"]
textArray := ["Blur:", "Span Multiple Monitors:", "Field of View:", "Ribbon Width:", "# of Ribbons:"]
elementArray := [0, 0, 5, 5, 5]
listArray := ["Default|On|Off", "Default|On|Off", "Default|Zoomed|Medium|Distant", "Default|Thin|Medium|Thick", "Default|Low|Medium|High"]
allow1 := ["", 1, 0]
allow2 := ["", 1, 0]
allow3 := ["", 1000000000, 1500000000, 2000000000]
allow4 := ["", 1000000000, 1040000000, 1080000000]
allow5 := ["", 1, 50, 100]
yBottButtons = 189
guiHeight = 238
Goto, PAGEMAKER

AURORAPAGE:
currentMode := "Aurora"
varArray := ["SpanMultiMon", "Amplitude", "Brightness", "NumLayers", "Speed"]
textArray := ["Span Multiple Monitors:", "Effect:", "Brightness:", "Number of Layers:", "Speed:"]
elementArray := [0, 5, 5, 5, 5]
listArray := ["Default|On|Off", "Default|Effect 1|Effect 2|Effect 3", "Default|Low|Medium|High", "Default|Low|Medium|High", "Default|Low|Medium|High"]
allow1 := ["", 1, 0]
allow2 := ["", 500000000, 1250000000, 2000000000]
allow3 := ["", 1000000000, 1025000000, 1050000000]
allow4 := ["", 1, 8, 15]
allow5 := ["", 1000000000, 1550000000, 2100000000]
yBottButtons = 189
guiHeight = 238
Goto, PAGEMAKER

; Each screensaver has a similar template, and we are reducing code to the extremes here by creating a GUI via a loop
PAGEMAKER:
; Read the registry and populate variables
Loop, % varArray.Length()
{
	RegRead, reg%A_Index%, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Screensavers\%currentMode%, % varArray[A_Index]
	If (ErrorLevel = 1)
		reg%A_Index% := ""
}

; These are the initial y coordinates for certain elements
coord1 = 10
coord2 = 12

Loop, % varArray.Length()
{
	; Determine if the current registry entries are valid, and determine which DDL element to select
	currentChoose := checkEntry(allow%A_Index%, reg%A_Index%, varArray[A_Index], elementArray[A_Index])
	Gui, Add, Text, x14 y%coord1% w120 h23 Hwndt%A_Index% +0x200, % textArray[A_Index]
	If (elementArray[A_Index] = 0)
		Gui, Add, DropDownList, x189 y%coord2% w120 Hwndd%A_Index% Choose%currentChoose% Vbox%A_Index%, % listArray[A_Index]
	Else
	{
		; currentChoose is set to -1 when we have a custom entry
		If (currentChoose = -1)
		{
			currentChoose := elementArray[A_Index]
			appendVal := reg%A_Index%
		}
		Else
			appendVal := ""
		Gui, Add, ComboBox, x189 y%coord2% w120 Hwndd%A_Index% Choose%currentChoose% +Limit Vbox%A_Index%, % listArray[A_Index] . "|" . appendVal
	}
	coord1 += 33
	coord2 += 33
}

Gui, Add, Button, x21 y%yBottButtons% w78 h30, Reset
Gui, Add, Button, x122 y%yBottButtons% w78 h30, OK
Gui, Add, Button, x222 y%yBottButtons% w78 h30, Cancel

Gui, -MaximizeBox -MinimizeBox +E0x00000400

If parentHWND is integer
	Gui, +Owner%parentHWND%
Else
	Gui, +Owner

Gui, +LastFound
DllCall("uxtheme\SetWindowThemeAttribute", "ptr", WinExist(), "int", 1, "int64*", 6 | 6<<32, "uint", 8)
OnMessage(0x53, "WM_HELP")

Gui, Show, xCenter yCenter w320 h%guiHeight%, %currentMode% Screensaver Options
Return

BUTTONOK:
Gui, Submit, NoHide
Loop, % varArray.Length()
{
	; If we are dealing with a ComoBox in this position (which would allow custom values)
	If (elementArray[A_Index] != 0)
	{
		If box%A_Index% is integer
		{
			; Check if the value is out of bounds
			If ((box%A_Index% < allow%A_Index%[2]) || (box%A_Index% > allow%A_Index%[allow%A_Index%.Length()]))
				incorrectValues()
		}
		Else
		{
			found = 0
			outIndex := A_Index

			; Check if this is one of the values in the DDL list
			Loop, Parse, % listArray[A_Index], |
			{
				If (box%outIndex% = A_LoopField)
				{
					found = 1
					Break
				}
			}
			If (found = 0)
				incorrectValues()
		}
	}
}

; All values are good
; So now before destroying the GUI, we have to enable the owner (if it exists)
; If we don't do this, then the owner will become the bottom-most window
If parentHWND is integer
	WinSet, Enable,, ahk_id %parentHWND% 
Gui, Destroy

Loop, % varArray.Length()
{
	outIndex := A_Index
	Loop, Parse, % listArray[A_Index], |
	{
		found = 0
		If (box%outIndex% = A_LoopField)
		{
			found = 1
			regWriteFunc(varArray[outIndex], allow%outIndex%[A_Index])
			Break
		}
	}
	If (found = 0)
		regWriteFunc(varArray[outIndex], box%outIndex%)
}
ExitApp

BUTTONRESET:
Loop, % varArray.Length()
	GuiControl, Choose, box%A_Index%, 1
Return

GUIESCAPE:
GUICLOSE:
BUTTONCANCEL:
If parentHWND is integer
	WinSet, Enable,, ahk_id %parentHWND% 
ExitApp

; Checks if the registry entries are valid and returns which DDL element to select in the GUI
; allowedArr = array of allowed values
; var = the variable we are checking
; entry = the registry entry we are looking at
; custAllowed = if we are allowed to have custom values or not
checkEntry(allowedArr, var, entry, custAllowed)
{

	Loop, % allowedArr.Length()
	{
		If (var = allowedArr[A_Index])
			Return A_Index
	}

	; If we are not allowed to have custom values, throw an error
	If (custAllowed = 0)
	{
		throwErr(entry)
		Return 1
	}
	Else
	{
		; We return -1 to signify that we have detected a custom value
		Return -1
	}
}

incorrectValues()
{
	Gui, +OwnDialogs
	MsgBox, 0x10, Error, Cannot save the settings because invalid data has been detected.
	Exit
}

WM_HELP(null1, param, null2, null3)
{
	Global
	itemHandle := getInteger(param, 12)
	
	If (currentMode = "Bubbles")
	{
		If ((itemHandle = t1) || (itemHandle = d1))
			ToolTip, This setting controls the look of the bubbles`nYou can choose to have the bubbles appear as transparent glass-like balls or solid metallic balls
		Else If ((itemHandle = t2) || (itemHandle = d2))
			ToolTip, This setting controls the background behind the bubbles`nYou can choose to have the bubbles float on your desktop with a transparent background or float on a black background
		Else If ((itemHandle = t3) || (itemHandle = d3))
			ToolTip, This setting controls the shadows underneath the bubbles`nYou can choose to have shadows appear behind the bubbles or not
		Else If ((itemHandle = t4) || (itemHandle = d4))
			ToolTip, This setting controls how the screensaver behaves in the presence of multiple monitors`nYou can choose to have the screensaver float across multiple monitors or appear on each monitor individually
		Else If ((itemHandle = t5) || (itemHandle = d5))
			ToolTip, This setting controls the size of the bubbles`nYou can choose either tiny`, small`, medium`, large`, or huge bubbles`nYou can also type in a custom numerical value`nMinimum size`: 1090000000`nMaximum size`: 1130000000
		Else If ((itemHandle = t6) || (itemHandle = d6))
			ToolTip, This setting controls how many bubbles will appear`nYou can choose to have a low`, medium`, or high amount of bubbles`nYou can also type in a custom numerical value`nMinimum density`: 991000000`nMaximum density`: 2100000000
		Else If ((itemHandle = t7) || (itemHandle = d7))
			ToolTip, This setting controls the force of the `"wind`" on your screen`nYou can choose to have a low`, medium`, or high amount of turbulence as well as none`nYou can also type in a custom numerical value`nMinimum force`: 1000000000`nMaximum force`: 2000000000
		Else If ((itemHandle = t8) || (itemHandle = d8))
			ToolTip, This setting controls the speed of the distribution of bubble colors`nYou can choose to have a low`, medium`, or high amount of color distribution speed`nYou can also type in a custom numerical value`nMinimum speed`: 1`nMaximum speed`: 255
		Else If ((itemHandle = t9) || (itemHandle = d9))
			ToolTip, This setting controls how fast the colors will change of each individual bubble in regards to the bubble's current speed`nYou can choose to have a low`, medium`, or high amount of color cycle speed`nYou can also type in a custom numerical value`nMinimum speed`: 1000000000`nMaximum speed`: 2000000000`nIf the value is low`, bubbles that are moving slowly will have a low color change speed`nIf the value is high`, bubbles that are moving slowly will have a high color change speed 
		Else
			ToolTip
	}
	Else If (currentMode = "Mystify")
	{
		If ((itemHandle = t1) || (itemHandle = d1))
			ToolTip, This setting controls the fade effect of the lines`nYou can choose to have the lines have a fade effect when they move or you can disable the fade and have lines appear on top of each other
		Else If ((itemHandle = t2) || (itemHandle = d2))
			ToolTip, This setting controls how the screensaver behaves in the presence of multiple monitors`nYou can choose to have the screensaver float across multiple monitors or appear on each monitor individually
		Else If ((itemHandle = t3) || (itemHandle = d3))
			ToolTip, This setting controls the field of view of the lines`nYou can choose to make the lines appear zoomed`, at a medium distance`, or distant`nYou can also type in a custom numerical value`nMinimum distance`: 1000000000`nMaximum distance`: 2000000000
		Else If ((itemHandle = t4) || (itemHandle = d4))
			ToolTip, This setting controls the width of the lines`nYou can choose to have thin`, medium`, or thick lines`nYou can also type in a custom numerical value`nMinimum width`: 1000000000`nMaximum width`: 1080000000
		Else If ((itemHandle = t5) || (itemHandle = d5))
			ToolTip, This setting controls how many lines will appear`nYou can choose to have a low`, medium`, or high amount of lines`nYou can also type in a custom numerical value`nMinimum density`: 1`nMaximum density`: 100
		Else
			ToolTip
	}
	Else If (currentMode = "Ribbons")
	{
		If ((itemHandle = t1) || (itemHandle = d1))
			ToolTip, This setting controls the fade effect of the ribbons`nYou can choose to have the ribbons have a fade effect when they move or you can disable the fade and have ribbons appear on top of each other
		Else If ((itemHandle = t2) || (itemHandle = d2))
			ToolTip, This setting controls how the screensaver behaves in the presence of multiple monitors`nYou can choose to have the screensaver float across multiple monitors or appear on each monitor individually
		Else If ((itemHandle = t3) || (itemHandle = d3))
			ToolTip, This setting controls the field of view of the ribbons`nYou can choose to make the ribbons appear zoomed`, at a medium distance`, or distant`nYou can also type in a custom numerical value`nMinimum distance`: 1000000000`nMaximum distance`: 2000000000
		Else If ((itemHandle = t4) || (itemHandle = d4))
			ToolTip, This setting controls the width of the ribbons`nYou can choose to have thin`, medium`, or thick ribbons`nYou can also type in a custom numerical value`nMinimum width`: 1000000000`nMaximum width`: 1080000000
		Else If ((itemHandle = t5) || (itemHandle = d5))
			ToolTip, This setting controls how many ribbons will appear`nYou can choose to have a low`, medium`, or high amount of ribbons`nYou can also type in a custom numerical value`nMinimum density`: 1`nMaximum density`: 100
		Else
			ToolTip
	}
	Else If (currentMode = "Aurora")
	{
		If ((itemHandle = t1) || (itemHandle = d1))
			ToolTip, This setting controls how the screensaver behaves in the presence of multiple monitors`nYou can choose to have the screensaver float across multiple monitors or appear on each monitor individually
		Else If ((itemHandle = t2) || (itemHandle = d2))
			ToolTip, This setting controls the aurora effect`nYou can choose three different effects`nYou can also type in a custom numerical value`nMinimum value`: 500000000`nMaximum value`: 2000000000`nThis is a poorly documented setting`, so not much is known about it`nDifferent things happen with different numbers`, so have fun`!
		Else If ((itemHandle = t3) || (itemHandle = d3))
			ToolTip, This setting controls the brightness of the aurora`nYou can choose to have a low`, medium`, or high amount of brightness`nYou can also type in a custom numerical value`nMinimum brightness`: 1000000000`nMaximum brightness`: 1050000000
		Else If ((itemHandle = t4) || (itemHandle = d4))
			ToolTip, This setting controls the amount of transparent aurora layers`nYou can choose the have a low`, medium`, or high amount of layers`nYou can also type in a custom numerical value`nMinimum amount of layers`: 1`nMaximum amount of layers`: 15`nThe more layers you add`, the less transparent it becomes
		Else If ((itemHandle = t5) || (itemHandle = d5))
			ToolTip, This setting controls the cycle speed of the aurora`nYou can choose to have a low`, medium`, or high speed`nYou can also type in a custom numerical value`nMinimum speed`: 1000000000`nMaximum speed`: 2100000000
		Else
			ToolTip
	}

	OnMessage(0x201, "Down")
	OnMessage(0x204, "Down")
	OnMessage(0x207, "Down")
	OnMessage(0x100, "Down")
	OnMessage(0x111, "Down")
	Return
}

Down()
{
	ToolTip
	Return
}

getInteger(source, offset = 0, size = 4, isSigned = false)
{
	Local result
	Loop, %size%
		result += *(source + offset + A_Index - 1) << 8 * (A_Index - 1)
	If (!isSigned || size > 4 || result < 0x80000000)
		Return result
	Return -(0xFFFFFFFF - result + 1)
}

throwErr(key)
{
	MsgBox, 0x10, %A_ScriptName%, An error occurred while attempting to read the data of the %currentMode% screensaver.`n`nYour settings have been corrupted and will be reset as an attempt to resolve the issue.
	regWriteFunc(key, "")
	temp := A_ScriptFullPath . " " . switch . "/restart"
	Run, %temp%
	ExitApp
}

regWriteFunc(key, value)
{
	; If the value is blank, we are going to just delete this registry entry
	If (value = "")
	{
		; We check if the value exists, if it doesn't, we return
		; We do this because RegDelete will fail if the value doesn't exist
		Try
			RegRead, temp, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Screensavers\%currentMode%, %key%
		Catch
			Return

		; Now we know the value exists, so we attempt to delete it
		Try
			RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Screensavers\%currentMode%, %key%
		Catch
			regErrCatcher(key, "del")
		Return
	}
	Else
	{
		Try
			RegWrite, REG_DWORD, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Screensavers\%currentMode%, %key%, %value%
		Catch
			regErrCatcher(key, value)
		Return
	}
}

regErrCatcher(key, value)
{
	If (value = "del")
		lastVal =
	Else
		lastVal = `, %value%

	MsgBox, 0x10, %A_ScriptName%, The program could not access the resource.`n`nEnsure that you have proper permissions and read/write access to the registry.`n`n[HKCU\Software\Microsoft\Windows\CurrentVersion\Screensavers\%currentMode%, %key%%lastVal%]
	Return
}