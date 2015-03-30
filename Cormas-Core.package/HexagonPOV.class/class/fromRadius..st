instance creation
fromRadius: radius
	"Return a regular hexagonal HexagonFigure  calculated from radius.
test:  (HexagonPOV fromRadius: 30) asFigure   "
	
	^self new: (self polylineFromRadius: radius)