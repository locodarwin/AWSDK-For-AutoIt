; A simple greeter bot example using AWSDK for AutoIt
; For AWSDK 100/101
; Modified by Locodarwin from the original "Greeter Bot" script posted to the Activeworlds ActiveWiki
; at http://wiki.activeworlds.com/index.php?title=SDK_Sample_Program_1

#cs

Instructions:

1. Place the aw.dll file that corresponds to the latest SDK in the same directory as this script
2. Place the AWSDK for AutoIt #include files in the same directory as this script as well
3. Modify the global variables in this script to suit your environment, i.e. world name, citnum, priv password, etc.
4. Press [F5] to run the script

Assuming all globals are correct and the "bot" has the prileges to enter the universe & world, the "bot" should show up in-world and begin greeting all who enter

5. Press hotkeys [SHIFT][ALT][Q] to stop the "bot" and exit the program, or just say in chat "bot, please leave"

#ce

; Include files
#include <AWSDK4AU_Constants.au3>			; The AW constants file, with constants pulled from the aw.h header file
#include <AWSDK4AU_UDF.au3>				; The User Defined Functions (UDF), aka the SDK wrapper functions
#include <AWSDK4AU_ReturnCodes.au3>		; Optional Reason/Return Codes, to identify the SDK Reason Codes (rc) returned by the SDK after method calls

; Set the exit/quit hotkey as [SHIFT][ALT][Q] - press this key combination to properly shut down the bot and the application
HotKeySet("+!q", "Quit")

; Global variables for defining the parameters the bot will use to log into the universe and world
Global $sLoginHost = "auth.activeworlds.com" 	; the universe host, in this case the standard Activeworlds host
Global $sLoginPort = 6670 						; the universe login port, in this case the standard Activeworlds host port 6670
Global $sLoginAppName = "RowBot - The App"		; the application name for the bot
Global $sLoginName = "RowBot" 					; The name of the bot (will show up in the user list in world chat)
Global $sLoginNumber = 654321 					; Citizen number of the bot's owner (citizen must have bot privs in the universe and world)
Global $sLoginPassword = "privpassword" 		; Privilege password of the bot owner
Global $sLoginDescription = "RowBot Rocks"		; Bot description - can be read by universe admins only, but is still required
Global $sLoginWorld = "aw"			 			; The world that the bot will enter and interact with
Global $iLoginX = 5000 							; When bot enters world, it will move to this x coordinate (east/west, in centimeters)
Global $iLoginY = 0 							; When bot enters world, it will move to this y coordinate (up/down, in centimeters)
Global $iLoginZ = 5000 							; When bot enters world, it will move to this z coordinate (north/south, in centimeters)
Global $iLoginYaw = 0 							; When bot enters world, it will face this direction (in tenths of a degree, i.e. 0=north, 900=west)
Global $iLoginAV = 3 							; When bot enters world, it will "wear" this avatar number (as indexed from the world's AVATARS.DAT file)

; Begin by loading up the aw.dll SDK file located in the script's directory and creating a "handle" for it that will be used in subsequent SDK calls
$hAW = _AWStartup(@ScriptDir & "\aw.dll")

; Initialize the Activeworlds API (required by the API) - this call, like all other SDK wrapper calls, requires passing the "handle" as the first parameter
; The second paramter is the SDK version number, which is required by the aw_init method
; After making the call, check the success status of the call. If it's not successful, write out the reason to the AutoIt console and exit
$iRC = _AWInit($hAW, 100)
If $iRC Then
	ConsoleWrite("Unable to initialize API: " & _AWReturnReason($iRC))
	Exit
EndIf

; Now install the event handler for the avatar add event (AW_EVENT_AVATAR_ADD). This event handler is an AutoIt function that will be called whenever
; a new user enters the same world the bot is located. It's a good idea (though not *always* desirable) to install event handlers right after initializing the API
; In this case, the AutoIt function the event will call is "Event_Avatar_Add()." We check the success of the event install call and report to console if the call fails.
$iRC = _AWEventSet($hAW, $AW_EVENT_AVATAR_ADD, "Event_Avatar_Add")
If $iRC Then
	ConsoleWrite("Unable to install event AW_EVENT_AVATAR_ADD: " & _AWReturnReason($iRC))
	Exit
EndIf

; Because we also want the bot to quit when someone in world chat tells it to leave, we need to be able to listen and react to what is said in chat,
; so we install an event handler for that too. This event is called AW_EVENT_CHAT in the SDK. In this case, whenever the bot "hears" something said in chat,
; it will call function "Event_Chat()." Also notice here we do not check for errors making the call like we did for the previous event handler call - for many
; calls like this, you can skip error checking unless the script is not working and you would like to troubleshoot.
_AWEventSet($hAW, $AW_EVENT_CHAT, "Event_Chat")

; Now we're ready to create the bot instance in the API, and pass it some universe parameters (the host address and the host port). If the instance can't be created
; for some reason, we'll report that to console and exit.
$iRC = _AWCreate($hAW, $sLoginHost, $sLoginPort)
If $iRC Then
	ConsoleWrite("Unable to create instance: " & _AWReturnReason($iRC))
	Exit
EndIf

; Now that the instance is created, we need to set some API parameters for the bot before we log it into the universe - specifically, the bot owner's citnum, the
; owner's priv password, the application name, and the bot name. We won't bother to check for errors in these calls, although we certainly could.
_AWIntSet($hAW, $AW_LOGIN_OWNER, $sLoginNumber)
_AWStringSet($hAW, $AW_LOGIN_PRIVILEGE_PASSWORD, $sLoginPassword)
_AWStringSet($hAW, $AW_LOGIN_APPLICATION, $sLoginAppName)
_AWStringSet($hAW, $AW_LOGIN_NAME, $sLoginName)

; Now that all necessary parameters are set, we log the bot into the universe and check to make sure we're successful (report to console and exit if not)
$iRC = _AWLogin($hAW)
If $iRC Then
	ConsoleWrite("Unable to log into universe: " & _AWReturnReason($iRC))
	Exit
EndIf

; Assuming a successful universe login, let's log into the world and test that for success.
$iRC = _AWEnter($hAW, $sLoginWorld)
If $iRC Then
	ConsoleWrite("Unable to log into world: " & _AWReturnReason($iRC))
	Exit
EndIf

; Now we want to set the bot's position, have it face a particular direction, and have it "wear" a particular avatar. We'd already set the specifics up
; in the global variable declarations section earlier. We won't error-check these calls.
_AWIntSet($hAW, $AW_MY_X, $iLoginX)
_AWIntSet($hAW, $AW_MY_Y, $iLoginY)
_AWIntSet($hAW, $AW_MY_Z, $iLoginZ)
_AWIntSet($hAW, $AW_MY_YAW, $iLoginYaw)
_AWIntSet($hAW, $AW_MY_TYPE, $iLoginAV)

; Anytime we log the bot in or move it around, etc, we should tell the world server that we've changed the bot's state. If that fails, report to console and exit.
$iRC = _AWStateChange($hAW)
If $iRC Then
	ConsoleWrite("Unable to change state: " & _AWReturnReason($iRC))
	Exit
EndIf

; Now that we're in the world and we've announced our state to the world server, let's tell everyone within listening distance that we're here!
_AWSay($hAW, "Hello, world!")


; The bot has done all it needs to do at login. Now how do we keep the bot running? The script itself need to keep running & processing API work in order to
; keep the instance going and keep the bot in the universe & world. We make this happen by initiating an endless loop that encapsulates continuous calls to the
; aw_wait method. The bot will now sit there waiting endlessly until it receives an event that it has been programmed to handle, i.e. until it is told to exit.
While 1

	; The aw_wait method is necessary in this loop to process the packet queue and callbacks/events. In this case we set it up to process every 100 milliseconds. We
	; could also have AutoIt set a timer and call the aw_wait method with 0 milliseconds as the parameter. This strategy is simpler for our purposes here.
	_AWWait($hAW, 100)

WEnd



; From here on we just add the functions that handle the events we registered for, as well as the function to handle a "clean exit" from the API.



; Event handler for AW_EVENT_AVATAR_ADD
; This event handler function is called whenever a new avatar enters the world, whether that be a citizen or another bot. There are lots of fun things we could do
; when this happens, but we stick with a simple greeting. The first thing we do is get the name of the avatar that entered so we can respond with a more personal touch.
; To get the name, we call the aw_string method with parameter AW_AVATAR_NAME. This returns the avatar name into the $sRet variable, which we can then use however
; we wish.
Func Event_Avatar_Add()
	Local $sRet = _AWString($hAW, $AW_AVATAR_NAME)			; Get the name of the avatar that caused the event from the API
	_AWSay($hAW, "Welcome, " & $sRet & "!")					; The bot greets the avatar publicly
EndFunc


; Event handler for AW_EVENT_CHAT
; This event handler function is called whenever someone within the bot's listening distance says something in world, either outloud (publicly) or whispered directly
; to the bot. Again, there are lots of fun things we could do when this happens, but if we plan on being able to respond to what is said or whispered, and by whom,
; we need to have the API return some important information. We can then act on that information however we wish. This gives the bot author some very poweful capability.
; We could, for example, have the bot respond to specific commands with specific actions such as follow another avatar, change an object, change worn avatar, etc.
; In this example, we keep it simple: 1) if someone whispers anything to the bot, we whisper back with a simple personalized greeting, and 2) if anyone says
; "bot, please leave" publicly, the bot acknowledges the request, leaves the world & universe cleanly, and the script ends.
Func Event_Chat()
	Local $sName = _AWString($hAW, $AW_AVATAR_NAME)  		; Who did the chatting
	Local $sMessage = _AWString($hAW, $AW_CHAT_MESSAGE)		; What was said
	Local $iChatType = _AWInt($hAW, $AW_CHAT_TYPE) 			; Type of chat (whispered, said, broadcast)
	Local $iSession = _AWInt($hAW, $AW_CHAT_SESSION)		; The session number of the chatter

	If $iChatType = $AW_CHAT_SAID or $iChatType = $AW_CHAT_BROADCAST Then
		If $sMessage = "bot, please leave" Then
			_AWSay($hAW, "Ok, " & $sName & ", I'm leaving.")
			Quit()
		EndIf
	EndIf

	If $iChatType = $AW_CHAT_WHISPER Then
		$iStat = _AWWhisper($hAW, $iSession, "Hello, " & $sName & "!")
	EndIf
EndFunc


; For a proper, "clean" exit from the API, we need to call the aw_destroy and aw_term methods in succession before we exit the application. Let's have the bot announce
; its leave openly to everyone within listening distance before it dies.
Func Quit()
	_AWSay($hAW, "Goodbye, cruel world!")
	_AWDestroy($hAW)
	_AWTerm($hAW)
	Exit
EndFunc