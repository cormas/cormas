instance creation
fromSideLength: aLength
	"Return a regular hexagonal HexagonFigure  calculated from the length of a side.
test:  (HexagonPOV fromSideLength: 30) asFigure"
	
	^self fromRadius: aLength