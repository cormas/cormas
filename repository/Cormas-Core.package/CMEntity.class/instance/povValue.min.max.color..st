- utilities - color
povValue: aValue min: minValue max: maxValue color: baseColor
	"Return a ColorValue for aValue, in the interval of minValue and maxValue. 
Works even if this value is less or up to minValue or maxValue
aValue = <Number> ; minValue = <Integer> ; maxValue = <Integer> ; baseColor = <ColorValue  or Symbol>
ECEC example : 
	povAttribute: #energy min: 0 max: self class K color: ColorValue green"
	
	| index value color |
	(aValue isNil or: [aValue cormasHelper isTypeNumber not])
		ifTrue: [^Color white].
	value := aValue.
	value <= minValue ifTrue: [value := minValue].
	value >= maxValue ifTrue: [value := maxValue].
	maxValue = minValue
		ifTrue: [index := 0.8]
		ifFalse: [index := (maxValue - value) / (maxValue - minValue)].	"ifFalse: [index := 0.8 + (0.2 * (performResult - minValue) / (maxValue - minValue))]."
	color := Cormas colorFrom: baseColor.
	^Color
		setHue: color hue
		saturation: color saturation * (1 - (index raisedTo: 10))
		brightness: color brightness * index