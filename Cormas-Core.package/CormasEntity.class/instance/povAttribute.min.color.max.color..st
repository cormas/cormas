+ pov
povAttribute: aSymbol min: minValue color: startColor max: maxValue color: stopColor
	"Purpose: returns a color among a palette of colors correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			startColor = <ColorValue  or Symbol>, the color associated to the minimum value of the attribute
			stopColor = <ColorValue  or Symbol>, the color associated to the maximum value of the attribute
Return value: a colorValue
Example : self povAttribute: #energy min: 0 color: (ColorValue yellow) max: (self class K) color: ColorValue red
Example : self povAttribute: #energy min: 0 color: #yellow max: (self class K) color: #red"
	
	^self
		povValue: (self perform: aSymbol)
		min: minValue
		color: startColor
		max: maxValue
		color: stopColor