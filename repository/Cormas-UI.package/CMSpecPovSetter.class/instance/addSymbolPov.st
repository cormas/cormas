action
addSymbolPov
	
	| aString |
	selectedClass isNil ifTrue: [^nil].
	(aString := (self requestMessage: self translator tNewSymbol) asString)
		ifEmpty: [ ^ nil ].
	[ aString first = $# ]
		whileTrue: [
			(aString := aString allButFirst) 
			 	ifEmpty: [ ^ nil] ].
	^ self addSymbolPov: aString