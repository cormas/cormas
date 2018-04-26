polyline
polylineFromHeight: length length: heigth
	"Return a hexagonal Polyline.
test:  (HexagonPOV polylineFromHeight: 30 length: 50)    "
	
	^(self height: heigth length: length) asGeometric