menu-symbol
setDefaultColor
	
	| aCV green red blue |
	aCV := PovSetter colorChooser.
	aCV ifNil: [^nil].
	green := aCV green.
	red := aCV red.
	blue := aCV blue.
	selectedClass class
		compile:
			('defaultColor 
				\^ColorValue red: ' , red printString , ' green: ' , green printString
				, ' blue: ' , blue printString) withCRs
		classified: 'pov symbols'
		notifying: nil