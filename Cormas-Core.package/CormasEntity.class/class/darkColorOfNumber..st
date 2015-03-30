+ utilities - colors
darkColorOfNumber: aNumber
	"Purpose: Returns a dark ColorValue from the existing 25 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray).
Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 25.
Example: CormasNS.Kernel.Entity darkColorOfNumber:  30 -> ColorValue cyan  "
	
	| colors |
	colors := self darkColors.
	^ColorValue
		perform:
			(colors
				at:
					(Cormas
						number: aNumber
						onCycle: colors size))