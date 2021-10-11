#include <Misc.au3>
_Singleton ( "05bg91Mw0e-D2GRABBER", 0 ) ;; Allow only one instance to run
AutoItSetOption ( "TrayAutoPause" , 0 ) ;; Prevent Tray Auto-Pause
Global $Enabled = False ;; Disabled at start
Global $hDll = DllOpen ( "user32.dll" )
HotKeySet ( "{F11}", "Toggle" )
Exit ( main() ) ;; Launch Main Func

Func main()
   While 1 ;; Main Loop
	  Sleep(1)
	  While $Enabled And AltDown()
		 Local $searchUnique = PixelSearch(683, 263, 1241, 686, 0xBFA969, 0)
		 If Not @error Then
			MouseClick("LEFT", $searchUnique[0], $searchUnique[1], 1, 0)
		 EndIf
		 Local $searchSet = PixelSearch(683, 263, 1241, 686, 0x00FD00, 0)
		 If Not @error Then
			MouseClick("LEFT", $searchSet[0], $searchSet[1], 1, 0)
		 EndIf
		 Local $searchRune = PixelSearch(683, 263, 1241, 686, 0xFD9D00, 0)
		 If Not @error Then
			MouseClick("LEFT", $searchRune[0], $searchRune[1], 1, 0)
		 EndIf
	  WEnd
   WEnd
   Return 0
EndFunc

Func AltDown() ;; Alt VKey 0x12 (18)
   Local $state = DllCall($hDll, "SHORT", "GetAsyncKeyState", "INT", 18)
   If $state[0] <> 0 Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func Toggle() ;; Toggles script on/off
   $Enabled = Not $Enabled
   If $Enabled Then
	  Beep(750, 250) ;; Higher pitched beep for enabled
   Else
	  Beep(150, 250) ;; Lower pitched beep for disabled
   EndIf
EndFunc