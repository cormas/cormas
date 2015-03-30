+ utilities - colors
colorWithout: aColorName OfNumber: aNumber
	"Purpose: Returns a ColorValue from the existing constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow) except the one given as the first argument.
Arguments: aColorName : <Symbol>
			aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 31.
Example: CormasNS.Kernel.Entity colorWithout: #white OfNumber: 30  -> ColorValue yellow  (30 is the index of #white in the array of the constant names)"
	
	| colors |
	colors := ColorValue constantNames asOrderedCollection.
	colors
		remove: aColorName
		ifAbsent: [nil].
	^ColorValue
		perform:
			(colors
				at:
					(Cormas
						number: aNumber
						onCycle: colors size))