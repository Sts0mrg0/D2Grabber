AutoItSetOption ( "TrayAutoPause" , 0 )
Global $hDll = DllOpen ( "user32.dll" )
Exit ( main() ) ;; Launch Main Func

Func main()
   While 1 ;; Main Loop
	  Sleep(1)
	  While AltDown()
		 Local $searchUnique = PixelSearch(683, 263, 1241, 686, 0xBFA969, 1)
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