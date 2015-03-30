+ utilities - colors
lightColors
	"Purpose: Returns the light ColorValues from the existing constant color values.
Example: CormasNS.Kernel.Entity lightColors -> OrderedCollection (#blue #brown #chartreuse #cyan #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryLightGray #white #yellow)"
	
	| colors |
	colors := ColorValue constantNames asOrderedCollection.
	colors
		removeAllSuchThat:
			[:symb | 
			(symb indexOfSubCollection: 'dark' startingAt: 1) ~= 0
				or: [(symb indexOfSubCollection: 'Dark' startingAt: 1) ~= 0]].
	colors remove: #black.
	^colors