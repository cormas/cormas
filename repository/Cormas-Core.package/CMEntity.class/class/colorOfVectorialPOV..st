+ utilities - colors
colorOfVectorialPOV: aPov
	"Returns a ColorValue, according to VectorialPOV. A VectorialPOV is an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices).
aPov = <Symbol>

self colorOfVectorialPOV: #VectorialPOV_A"
	
	| array |
	[array := self perform: aPov]
		on: Error
		do: [:ex | ^self cormas warn: 'There is no POV for : <1p>' with: aPov].
	^ColorValue
		red: (array at: 1)
		green: (array at: 2)
		blue: (array at: 3)