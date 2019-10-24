#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



^+LButton::












;**CHANGE THESE NUMBER TO MATCH YOUR SCREEN RESOLUTION**
xDim := 2560
yDim := 1440
;**DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING**












xMult := 5/4 * xDim/2560 ; Sets the correct scaling for x
yMult := 5/4 * yDim/1440 ; sets the correct scaling for y 

CoordMode, Mouse, Screen


Loop
{
	MouseMove, 1100*xMult, 680*yMult
	Send, {LButton} ; Start Queue

	Sleep, 45000	; Sleep for 45 seconds for Queue + Game launch

	MouseMove, 937*xMult, 528*yMult 
	Send, {LButton}; Select god power

	Sleep, 500 ; Make sure cursor stays on god power long enough to register click

	MouseMove, 1030*xMult, 932*yMult
	Send, {LButton}; Confirm god power


	Sleep, 5000 ; Sleep for 5 seconds to load mulligan and let opponent choose GP


	MouseMove, 1030*xMult, 932*yMult
	Send, {LButton}; Confirm mulligan

	Sleep, 500



	MouseMove, 1734*xMult, 530*yMult

	Loop, 45 ; End turn for 45 seconds
	{
		Send, {LButton}
		Sleep, 1000
	}




	MouseMove, 1030*xMult, 932*yMult
	Send, {LButton}; Confirm mulligan if the opponent took longer than 5 second for GP choice

	Sleep, 500


	MouseMove, 1734*xMult, 530*yMult

	Loop, 165 ; End turn for 165 more seconds (Should be enough to get a minimum of 5 turns)
	{
		Send, {LButton}
		Sleep, 1000
	}


	; Concede game if it still progressing

	MouseMove, 2016*xMult, 31*yMult ; Click settings
	Send, {LButton}
	Sleep, 500

	MouseMove, 1030*xMult, 750*yMult ; Click "Concede Game"
	Send, {LButton}
	Sleep, 500

	MouseMove, 895*xMult, 645*yMult ; Click "Yes"
	Send, {LButton}
	Sleep, 500



	; Click Continue if game has ended and no error

	MouseMove 1019*xMult, 834*yMult
	Send, {LButton}




	; Click ok on error message if game has ended

	MouseMove 1019*xMult, 618*yMult
	Send, {LButton}
	Sleep, 500




	


	Sleep, 15000	; Wait for rewards screen to come up


	MouseMove, 1029*xMult, 959*yMult
	Send, {LButton}; Click on Continue after Exp Screen

	Sleep, 2000

	MouseMove, 1029*xMult, 959*yMult
	Send, {LButton}; Click on Continue after Exp Screen

	Sleep, 5000
}
return



^+RButton::		; Use this to find the correct multiplier for your screen. 
			; When run, this should move your cursor to roughly the center of the
			; "Start" Button for Ranked Constructed when the launcher is maximized.














;**CHANGE THESE NUMBER TO MATCH YOUR SCREEN RESOLUTION**
xDim := 2560
yDim := 1440
;**DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING**















xMult := 5/4 * xDim/2560 ; Sets the correct scaling for x
yMult := 5/4 * yDim/1440 ; sets the correct scaling for y 


CoordMode, Mouse, Screen
MouseMove, 1100*xMult, 680*yMult

return

Esc::
ExitApp
return
