+ utilities - colors
colorOfNumber: aNumber
	"Purpose: Returns a ColorValue from the existing 31 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow).
Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 31.
Example: CormasNS.Kernel.Entity colorOfNumber: 65  -> ColorValue brown"
	
	^ColorValue
		perform:
			(ColorValue constantNames reverse
				at:
					(Cormas
						number: aNumber
						onCycle: ColorValue constantNames size))