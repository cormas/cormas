+ pov
povAttribute: aSymbol min: minValue max: maxValue color: baseColor
	"Purpose: returns a color among a gradient correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minValue = <Integer>, the minimum value of the attribute
		 	maxValue = <Integer>, the maximum value of the attribute
			color = <ColorValue  or Symbol>, the color itself or its name
Return value: a colorValue
Example : self povAttribute: #energy min: 0 max: self class K color: ColorValue green
Or : 	    self povAttribute: #energy min: 0 max: 10 color: #green"
	
	^self
		povValue: (self perform: aSymbol)
		min: minValue
		max: maxValue
		color: baseColor