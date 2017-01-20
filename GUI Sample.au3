; A simple GUI interface example using AWSDK for AutoIt
; For AWSDK 100/101
; Created by Locodarwin and released as a practical example of how to create GUI interfaces for AW bots using AWSDK for AutoIt

#cs

Instructions:

1. Place the aw.dll file that corresponds to the latest SDK in the same directory as this script
2. Place the AWSDK for AutoIt #include files in the same directory as this script as well
3. Modify the global variables in this script to suit your environment, i.e. world name, citnum, priv password, etc.
4. Press [F5] to run the script
5. Enter valid parameters for all universe and world login fields, and then click "Log Into Universe," followed by "Log Into World."

Assuming all fields are correct and the "bot" has the prileges to enter the specified universe & world, the "bot"
should show up in-world and begin logging all in-world chat it "hears" to its status window

6. Closing the window with the top right "X" will exit cleanly.

#ce

; Set up the script include files. The first three are standard AutoIt includes for working with GUIs, MS Windows, and Listbox controls. The last
; three are of course the AWSDK For AutoIt include files.
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <GuiListBox.au3>
#include <AWSDK4AU_Constants.au3>
#include <AWSDK4AU_ReturnCodes.au3>
#include <AWSDK4AU_UDF.au3>

; Global variables for universe and world login
; We'll set some defaults here, but the GUI will let us alter these at runtime before we log into the universe/world if we wish
Global $sLoginHost = "auth.activeworlds.com" 	; The universe host, in this case the standard Activeworlds host
Global $iLoginPort = 6670 						; The universe login port, in this case the standard Activeworlds host port 6670
Global $sLoginName = "GUIBot" 					; The name of the bot (will show up in the user list in world chat)
Global $iLoginNumber = 654321 					; Citizen number of the bot's owner (citizen must have bot privs in the universe and world)
Global $sLoginPassword = "privpassword"			; Privilege password of the bot owner
Global $sLoginDescription = "GUIBot Rocks" 		; Bot description - can be read by universe admins only, but is still required
Global $sLoginWorld = "aw" 						; The world that the bot will enter and interact with
Global $iLoginX = 5000							; When bot enters world, it will move to this x coordinate (east/west, in centimeters)
Global $iLoginY = 0								; When bot enters world, it will move to this y coordinate (up/down, in centimeters)
Global $iLoginZ = 5000 							; When bot enters world, it will move to this z coordinate (north/south, in centimeters)
Global $iLoginYaw = 0 							; When bot enters world, it will face this direction (in tenths of a degree, i.e. 0=north, 900=west)

; Globals for the aw.dll handle and some state flags
Global $hAW, $fInWorld = 0, $fInUniv = 0

; Draw a simple but functional GUI
Global $Form1 = GUICreate("Active Worlds SDK GUI", 615, 317)
Global $Status = GUICtrlCreateList("", 276, 8, 337, 258, 0x00201000, $WS_EX_CLIENTEDGE)  ; We use this listbox control to keep a running "status" log
Global $bUnivLogin = GUICtrlCreateButton("Log Into Universe", 24, 280, 99, 25, 0)
Global $bWorldLogin = GUICtrlCreateButton("Log Into World", 144, 280, 99, 25, 0)
Global $bSay = GUICtrlCreateButton("Say", 376, 280, 75, 25, 0)
Global $bLogout = GUICtrlCreateButton("Log Out", 272, 280, 75, 25, 0)
Global $inSay = GUICtrlCreateInput("what_to_say", 456, 282, 145, 21)
GUICtrlCreateLabel("Login Host:", 8, 40, 58, 17)
GUICtrlCreateLabel("Login Port:", 8, 64, 55, 17)
GUICtrlCreateLabel("Bot Name:", 8, 88, 54, 17)
GUICtrlCreateLabel("CitNum:", 8, 112, 41, 17)
GUICtrlCreateLabel("Priv Pass:", 112, 112, 51, 17)
GUICtrlCreateLabel("World:", 8, 192, 35, 17)
GUICtrlCreateLabel("X Position:", 8, 216, 54, 17)
GUICtrlCreateLabel("Y Position:", 136, 216, 54, 17)
GUICtrlCreateLabel("Z Position:", 8, 240, 54, 17)
GUICtrlCreateLabel("Facing:", 144, 240, 39, 17)
GUICtrlCreateLabel("Bot Desc:", 141, 88, 51, 17)
Global $inLoginHost = GUICtrlCreateInput($sLoginHost, 64, 36, 153, 21)
Global $inLoginPort = GUICtrlCreateInput($iLoginPort, 64, 61, 73, 21)
Global $inLoginName = GUICtrlCreateInput($sLoginName, 64, 85, 73, 21)
Global $inLoginNumber = GUICtrlCreateInput($iLoginNumber, 51, 109, 57, 21)
Global $inLoginPassword = GUICtrlCreateInput($sLoginPassword, 163, 109, 94, 21)
Global $inLoginWorld = GUICtrlCreateInput($sLoginWorld, 48, 189, 81, 21)
Global $inLoginX = GUICtrlCreateInput($iLoginX, 64, 213, 57, 21)
Global $inLoginY = GUICtrlCreateInput($iLoginY, 192, 213, 65, 21)
Global $inLoginZ = GUICtrlCreateInput($iLoginZ, 64, 237, 57, 21)
Global $inLoginYaw = GUICtrlCreateInput($iLoginYaw, 192, 237, 65, 21)
Global $inLoginDescription = GUICtrlCreateInput($sLoginDescription, 192, 85, 65, 21)
Global $Group1 = GUICtrlCreateGroup("Universe Login", 3, 8, 266, 137)
Global $Group2 = GUICtrlCreateGroup("World Login", 3, 160, 265, 112)

; Once we've drawn the GUI, update the status listbox with a message lettting the user know we're ready to log in
SetStatus($Status, "Ready to log into universe.")

; Drawing the GUI doesn't make it visible - we have to explicitly tell AutoIt to do so
GUISetState(@SW_SHOW)

; Now begins our "message pump," the endless loop that makes the script run perpetually, waiting for commands and events
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE			; In the case where the user clicks the X...
			BotDisconnect()				; ...we kill the bot cleanly
			Exit

		Case $bUnivLogin				; In the case where the user clicks the "Log Into Universe" button
			UnivLogin()

		Case $bWorldLogin				; In the case where the user clicks the "Log Into World" button
			WorldLogin()

		Case $bSay						; In the case where the user clicks the "Say" button.
			BotSay()

		Case $bLogout					; In the case where the user clicks the "Log Out" button.
			BotDisconnect()


	EndSwitch
	Sleep(20)
	If $fInWorld Then _AWWait($hAW, 0)	; If the bot is currently in a world (flag is set), process the aw_wait() method to keep the world server aware of it.

WEnd
Exit


; The function for logging into the universe. This is the first step before logging into a world. It is not necessary to separate the two actions normally,
; but I've done so here to illustrate a good API practice. There are commands in the API that allow the bot to do things while logged into the universe
; and yet not in a world, and so the separation of the two actions can be useful down the road in your scripting.
Func UnivLogin()

	; Grab the current content of the controls (in case the user changed the defaults at runtime) and put them into our login variables.
	; Here, I'm only grabbing the things we need to log into the universe.
	$LoginHost = GUICtrlRead($inLoginHost)
	$LoginPort = GUICtrlRead($inLoginPort)
	$LoginName = GUICtrlRead($inLoginName)
	$LoginNumber = GUICtrlRead($inLoginNumber)
	$LoginPassword = GUICtrlRead($inLoginPassword)
	$LoginDescription = GUICtrlRead($inLoginDescription)

	; Check to see if we're already logged into the universe - abort the login if so
	If $fInUniv Then
		SetStatus($Status, "Already logged into universe")
		Return
	EndIf


	; Load the AW DLL and assign a handle
	$hAW = _AWStartup(@ScriptDir & "\aw.dll")

	; Initialize the DLL
	SetStatus($Status, "Initializing module...")		; Good practice to let the user know what's going on in the application
	$iRC = _AWInit($hAW, 100)
	If $iRC Then
		SetStatus($Status, "Unable to initialize API: " & _AWReturnReason($iRC))
		Return
	EndIf

	; Install any events and callbacks
	SetStatus($Status, "Installing events and callbacks...")
	$iRC = _AWEventSet($hAW, $AW_EVENT_CHAT, "_AW_EVENT_CHAT")		; For this example we just have the one event we're listening for ("chat")
	SetStatus($Status, "Event 'Chat:' " & _AWReturnReason($iRC))

	; Create the bot instance and pass it some universe parameters (the host address and the host port)
	SetStatus($Status, "Attempting to create bot instance...")
	$iRC = _AWCreate($hAW, $sLoginHost, $iLoginPort)
	If $iRC Then
		SetStatus($Status, "Instance creation error: " &  _AWReturnReason($iRC))
		SetStatus($Status, "Login aborted.")
		$hAW = ""	; null out the handle so the "Log Into World" button won't work, since we'll be unable to log into universe
		Return
	Else
		SetStatus($Status, "Instance creation: Success!")
	EndIf

	; Set the login parameters and let the user know we're logging in
	SetStatus($Status, "Attempting to log into universe: " & $sLoginHost & "...")
	_AWStringSet($hAW, $AW_LOGIN_NAME, $sLoginName)
	_AWIntSet($hAW, $AW_LOGIN_OWNER, $iLoginNumber)
	_AWStringSet($hAW, $AW_LOGIN_PRIVILEGE_PASSWORD, $sLoginPassword)
	_AWStringSet($hAW, $AW_LOGIN_APPLICATION, $sLoginDescription)

	; Perform the universe login
	$iRC = _AWLogin($hAW)
	If $iRC Then
		SetStatus($Status, "Universe login error: " & _AWReturnReason($iRC))
		SetStatus($Status, "Login aborted.")
		$hAW = ""   ; null out the handle so the "Log Into World" button won't work, since we were unable to log into universe
	Else
		SetStatus($Status, "Universe Login: Success!")
		$fInUniv = 1
	EndIf

EndFunc


; The function for logging into a world, which will only proceed if the DLL handle isn't null. In other words, the bot has to already have logged into a
; universe.
Func WorldLogin()

	; Grab the content of the world login controls and put them into our login variables (in case the user changed the defaults at runtime)
	$LoginWorld = GUICtrlRead($inLoginWorld)
	$LoginX = GUICtrlRead($inLoginX)
	$LoginY = GUICtrlRead($inLoginY)
	$LoginZ = GUICtrlRead($inLoginZ)
	$LoginYaw = GUICtrlRead($inLoginYaw)

	; Check to see if we're logged into the universe - abort the world login if not
	If NOT $fInUniv Then
		SetStatus($Status, "Log into universe first!")
		Return
	EndIf

	; Check to see if we're already logged into a world - abort if so
	If $fInWorld Then
		SetStatus($Status, "Already logged into world")
		Return
	EndIf

	; Inform the user of our attempt to log into world
	SetStatus($Status, "Attempting to log into world: " & $LoginWorld & "...")

	; Set caretaker mode prior to login - this is not required, but here's how & when to do it. Comment out if not needed or not allowed by world.
	$iRC = _AWBoolSet($hAW, $AW_ENTER_GLOBAL, 1)
	SetStatus($Status, "Set caretaker flag to 1: " & _AWReturnReason($iRC))

	; Enter the world
	$iRC = _AWEnter($hAW, $sLoginWorld)
	If $iRC Then
		SetStatus($Status, "World Login: " & _AWReturnReason($iRC))
		SetStatus($Status, "Login aborted.")
		$hAW = ""
		$fInWorld = 0
		Return
	Else
		SetStatus($Status, "World Login: Success!")
		$fInWorld = 1
	EndIf

	; Set position and becomes visible
	SetStatus($Status, "Attempting to move to specified location...")
	_AWIntSet($hAW, $AW_MY_X, $iLoginX)
	_AWIntSet($hAW, $AW_MY_Y, $iLoginY)
	_AWIntSet($hAW, $AW_MY_Z, $iLoginZ)
	_AWIntSet($hAW, $AW_MY_YAW, $iLoginYaw)
	_AWIntSet($hAW, $AW_MY_TYPE, 1)
	$iRC = _AWStateChange($hAW)
	If $iRC Then
		SetStatus($Status, "Move: " & _AWReturnReason($iRC))
		SetStatus($Status, "Move aborted.")
		$oAW = ""
	Else
		SetStatus($Status, "Move: Success!")
	EndIf

EndFunc


; When the user clicks the "Say" button, read the say input field and "say" that to the world chat
Func BotSay()
	Local $sSay = GUICtrlRead($inSay)
	SetStatus($Status, "Speaking: " & $sSay)
	_AWSay($hAW, $sSay)
EndFunc


; To exit cleanly from the API, call this when exiting the script or the universe/world
Func BotDisconnect()
	If NOT $fInUniv Then Return
	_AWDestroy($hAW)
	_AWTerm($hAW)
	$fInUniv = 0
	$fInWorld = 0
	SetStatus($Status, "Disconnected.")
EndFunc



; The function for the AW EVENT CHAT event, called by the API whenever the bot "hears" chat in the world
; In this example, we'll echo all chat the bot "hears" to the bot's status area - this allows the user to monitor in-world chat without the AW browser
; The bot will also whisper back to anyone who whispers to it
Func _AW_EVENT_CHAT()

	Local $sName = _AWString($hAW, $AW_AVATAR_NAME)  	; Name of the person who spoke
	Local $iType = _AWInt($hAW, $AW_CHAT_TYPE) 			; Type of speak (whisper, chat, broadcast)
	Local $iSession = _AWInt($hAW, $AW_CHAT_SESSION) 	; Session ID of who spoke
	Local $sMsg = _AWString($hAW, $AW_CHAT_MESSAGE)		; What was spoken
	If $iType = $AW_CHAT_WHISPER Then
		_AWWhisper($hAW, $iSession, "Hello, " & $sName & "!")
		SetStatus($Status, "Whispered: Hello, " & $sName & "!")
	Else
		SetStatus($Status, $sName & ": " & $sMsg)
	EndIf
EndFunc

; Standard multi-line status update function - handy in GUI scripts for providing log-style continuous feedback to the user through a
; listview/listbox control
; WARNING: this version of the SetStatus function does not trim the contents of the listbox/listview, so status data continues to pile up
; over time and eat up memory. This is therefore only suitable for testing and learning and not for a script that will be left running for a long
; period of time. Please take heed. :)
Func SetStatus($tctrl, $stat_data)
	GUICtrlSetData($tctrl, $stat_data & "|")
	$items = _GUICtrlListBox_GetCount($tctrl)
	_GUICtrlListBox_SetTopIndex($tctrl, $items - 1)
	Return 1
EndFunc

