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



	;Waits for a new window to open

	WinGet, id, list,,, ProgramManager
	setId := id

	while(id == setId) {
		WinGet, id, list,,, ProgramManager
		Sleep, 2000
	}



	Sleep, 30000 ; Wait 30 seconds for game to load in.


	MouseMove, 1482*xMult, 528*yMult 
	Send, {LButton}; Select god power

	Sleep, 500 ; Make sure cursor stays on god power long enough to register click

	MouseMove, 1030*xMult, 932*yMult
	Send, {LButton}; Confirm god power

	Sleep, 500

	MouseMove, 1030*xMult, 450*yMult ; Unpause the game (No idea why this happens, this is just a temp fix).
	Send, {LButton}

	Sleep, 5000 ; Sleep for 5 seconds to load mulligan and let opponent choose GP


	MouseMove, 1030*xMult, 932*yMult
	Send, {LButton}; Confirm mulligan. Note that if opponent takes longer than you for GP,
		       ; they will have to wait the entire mulligan timer. Might fix if this is an issue.

	Sleep, 500



	;Loops while game window is open, setId is original number of windows

	WinGet, id, list,,, ProgramManager

	;counter := 0

	while(id != setId) {
		

		; Try to End turn

		MouseMove, 1734*xMult, 530*yMult
		Send, {LButton}
		Sleep, 1000


		; Try to close window if game is done

		; Click Continue if game has ended and no error

		MouseMove 1019*xMult, 1038*yMult
		Send, {LButton}
		Sleep, 250
	
		; Click ok on error message if game has ended
	
		MouseMove 1019*xMult, 618*yMult
		Send, {LButton}
		Sleep, 250



		; Use God power and go face (Assuming use of Slayer)
		MouseMove 1150*xMult, 800*yMult
		Send, {LButton}
		Sleep, 1000


		MouseMove, 885*xMult, 800*yMult
		Send {Click, down}
		Sleep, 500
		MouseMove, 1025*xMult, 115*yMult
		Sleep, 500
		Send {Click, up}


		Sleep, 250

		;counter++

		WinGet, id, list,,, ProgramManager
	}

	


	Sleep, 8000	; Wait for rewards screen to come up


	MouseMove, 1029*xMult, 959*yMult
	Send, {LButton}; Click on Continue after Exp Screen

	Sleep, 1000

	MouseMove, 1029*xMult, 959*yMult
	Send, {LButton}; Click on Continue after Rank Screen

	Sleep, 3000
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
