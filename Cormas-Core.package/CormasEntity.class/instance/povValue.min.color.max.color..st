- utilities - color
povValue: aValue min: minValue color: startColor max: maxValue color: stopColor
	"Return a Color associated to aValue amongs a palette of colors.
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; startColor = <ColorValue  or Symbol> ; stopColor = <ColorValue  or Symbol>
ECEC example : 
	povValue: 10 min: 0 color: #yellow max: 100 color: #red  or 
	povValue: (self energy) min: 0 color: (ColorValue yellow) max: (self class K) color: ColorValue red"
	
	| alpha rv gv bv value start_Color stop_Color |
	(aValue isNil or: [aValue cormasHelper isTypeNumber not])
		ifTrue: [^ColorValue white].
	value := aValue <= minValue
		ifTrue: [minValue]
		ifFalse: [aValue].
	value := aValue >= maxValue
		ifTrue: [maxValue]
		ifFalse: [aValue].
	start_Color := Cormas colorFrom: startColor.
	stop_Color := Cormas colorFrom: stopColor.
	alpha := (value - minValue) / (maxValue - minValue).
	rv := (stop_Color scaledRed * alpha) rounded
		+ (start_Color scaledRed * (1 - alpha)) rounded.
	gv := (stop_Color scaledGreen * alpha) rounded
		+ (start_Color scaledGreen * (1 - alpha)) rounded.
	bv := (stop_Color scaledBlue * alpha) rounded
		+ (start_Color scaledBlue * (1 - alpha)) rounded.
	^ColorValue scaledRed: rv scaledGreen: gv scaledBlue: bv