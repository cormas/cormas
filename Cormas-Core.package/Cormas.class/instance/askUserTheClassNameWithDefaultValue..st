user messages
askUserTheClassNameWithDefaultValue: defaultString
	
	| aName |
	(aName := self
		request:
			'*** Create a new kind of Entity ***\         Enter the entity''s name '
				withCRs
		initialAnswer: defaultString) isEmpty
		ifFalse:
			[aName beMutable.
			aName first isAlphabetic ifFalse: [aName := 'X_' , aName].
			aName
				at: 1
				put: aName first asUppercase.
			(self verifyClassExist: aName)
				ifTrue:
					[self alert_NameAlreadyExist.
					^self askUserTheClassNameWithDefaultValue: defaultString]]
		ifTrue: [^nil].
	^aName