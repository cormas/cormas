as yet unclassified
povId
"Purpose: Returns a ColorValue from the existing 31 constant names: #(#black #blue #brown #chartreuse #cyan #darkCyan #darkGray #darkGreen #darkMagenta #darkRed #gray #green #lightCyan #lightGray #lightYellow #magenta #navy #olive #orange #orchid #paleGreen #pink #purple #red #royalBlue #salmon #springGreen #veryDarkGray #veryLightGray #white #yellow). The id is used to determine the index at which the color name is picked in the array. 
Example: for an instance with id = 65, the returned color will be brown (65= 2*31+3)"
^self class colorOfNumber: self id