action
addSymbolPov
	
	| aString |
	selectedClass isNil ifTrue: [^nil].
	aString := Cormas current
		request:
			(UserMessage defaultString: 'Enter a new symbol' key: #enterNewSymbol)
				asString.
	aString = '' ifTrue: [^nil].
	[aString first = $#]
		whileTrue:
			[aString := Cormas removeFirstCharacterOfString: aString.
			aString = '' ifTrue: [^nil]].
	^self addSymbolPov: aString