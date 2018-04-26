+ utilities - colors
darkColors
	"Purpose: Returns the dark ColorValues from the existing constant color values.
Example: CormasNS.Kernel.Entity darkColors -> OrderedCollection (#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray)"
	
	| colors |
	colors := ColorValue constantNames asOrderedCollection.
	colors
		removeAllSuchThat:
			[:symb | 
			(symb indexOfSubCollection: 'light' startingAt: 1) ~= 0
				or: [(symb indexOfSubCollection: 'Light' startingAt: 1) ~= 0]].
	colors remove: #white.
	colors remove: #yellow.
	^colors