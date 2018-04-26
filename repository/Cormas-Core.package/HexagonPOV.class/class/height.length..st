instance creation
height: heigth length: length
	"Return an irregular HexagonFigure, calculated from the heigth radius and length radius.
test: (HexagonPOV height: 80 length: 50) asFigure    "
	
	| radius |
	heigth < length
		ifTrue: [radius := heigth]
		ifFalse: [radius := length].
	^(self fromRadius: radius) scaledBy: (length / radius) @ (heigth / radius)