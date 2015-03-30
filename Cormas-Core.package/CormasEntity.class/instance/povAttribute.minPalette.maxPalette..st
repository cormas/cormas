+ pov
povAttribute: aSymbol minPalette: startArray maxPalette: stopArray
	"Purpose: returns a color among a palette of colors correlatively to the value of the attribute.
Arguments: aSymbol = <Symbol>, the name of the attribute
			minPalette = <Array(Nuimber Symbol)> (minimum value of the attribute; name of color) 
		 	maxPalette = <Array(Number Symbol)> (maximum value of the attribute; name of color)
			color = <ColorValue  or Symbol>, the color itself or its name
Return value: a colorValue
Example : self povAttribute: #boisMort minPalette:#(1 #red) maxPalette: #(15 #green)"
	
	^self
		povValue: (self perform: aSymbol)
		min: startArray first
		color: startArray last
		max: stopArray first
		color: stopArray last