private
iconNameFor: aString
	
	| iconName |
	aString isNil ifTrue: [^nil].
	iconName := aString select: [:each | each isAlphaNumeric].
	iconName := iconName
		copyFrom: 1
		to: (iconName size - 4 max: 1).
	iconName
		at: 1
		put: iconName first asLowercase.
	^(iconName , 'Icon') asSymbol