instance creation
newColor: color lineColor: linecolor lineWidth: linewidth sizeRatio: sizeR position: position vertices: vertices
	" Ex:
(VectorialElementaryPOV newColor: ColorValue green lineColor: ColorValue red lineWidth: 1 sizeRatio: 1 position: #center vertices: ((Polyline fromRectangle: (Rectangle origin: 0@0 corner: 35@35)) vertices)  ) asFigure "
	
	| inst |
	inst := self new.
	inst color: color.
	inst lineColor: linecolor.
	inst lineWidth: linewidth.
	inst sizeRatio: sizeR.
	inst position: position.
	inst outline: (Polyline vertices: vertices).
	^inst