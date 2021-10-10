AutoItSetOption ( "TrayAutoPause" , 0 )
Global $hDll = DllOpen ( "user32.dll" )
Global $TopLeft[2] ;; Top Left Corner of Rectangle
$TopLeft[0] = 683 ;; x
$TopLeft[1] = 263 ;; y
Global $BottomRight[2] ;; Bottom Right Corner of Rectangle
$BottomRight[0] = 1241 ;; x
$BottomRight[1] = 686 ;; y
Exit ( main() ) ;; Launch Main Func

Func main()
   While 1
	  Sleep(1)
	  While AltDown()
		 Local $searchUnique = PixelSearch($TopLeft[0], $TopLeft[1], $BottomRight[0], $BottomRight[1], 0xC8B47A, 1)
		 If Not @error Then
			MouseClick("LEFT", $searchUnique[0], $searchUnique[1], 1, 0)
		 EndIf
		 Local $searchSet = PixelSearch($TopLeft[0], $TopLeft[1], $BottomRight[0], $BottomRight[1], 0x00FE00, 2)
		 If Not @error Then
			MouseClick("LEFT", $searchSet[0], $searchSet[1], 1, 0)
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