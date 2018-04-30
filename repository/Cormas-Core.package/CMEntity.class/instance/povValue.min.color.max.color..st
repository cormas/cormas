- utilities - color
povValue: aValue min: minValue color: startColor max: maxValue color: stopColor
	"Return a Color associated to aValue amongs a palette of colors.
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; startColor = <Color or Symbol> ; stopColor = <Color  or Symbol>
ECEC example : 
	povValue: 10 min: 0 color: #yellow max: 100 color: #red  or 
	povValue: (self energy) min: 0 color: (Color yellow) max: (self class K) color: Color red"
	
	| alpha rv gv bv value start_Color stop_Color |
	(aValue isNil or: [aValue cormasHelper isTypeNumber not])
		ifTrue: [^Color white].
	value := aValue <= minValue
		ifTrue: [minValue]
		ifFalse: [aValue].
	value := aValue >= maxValue
		ifTrue: [maxValue]
		ifFalse: [aValue].
	start_Color := Cormas colorFrom: startColor.
	stop_Color := Cormas colorFrom: stopColor.
	alpha := (value - minValue) / (maxValue - minValue).
	rv := (stop_Color red * alpha) rounded
		+ (start_Color red * (1 - alpha)) rounded.
	gv := (stop_Color green * alpha) rounded
		+ (start_Color green * (1 - alpha)) rounded.
	bv := (stop_Color blue * alpha) rounded
		+ (start_Color blue * (1 - alpha)) rounded.
	^Color red: rv green: gv blue: bv