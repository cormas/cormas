+ utilities - colors
lightColorOfNumber: aNumber
	"Purpose: Returns a light ColorValue from the existing 24 constant names: #(#blue #brown #chartreuse #cyan #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryLightGray #white #yellow).
Argument: aNumber = <Integer> is the index at which the color name is picked in the array. It can be greater than 24.
Example: CormasNS.Kernel.Entity lightColorOfNumber:  30  -> ColorValue green"
	
	| colors |
	colors := self lightColors.
	^ColorValue
		perform:
			(colors
				at:
					(Cormas
						number: aNumber
						onCycle: colors size))