accessing
getNewClassNameFromGUI
	
	| aName |
	aName := self newClassName value.
	aName isEmpty
		ifFalse:
			[aName beMutable.
			aName first isAlphabetic ifFalse: [aName := 'X_' , aName].
			aName
				at: 1
				put: aName first asUppercase.
			(self cormas verifyClassExist: aName)
				ifTrue:
					[self cormas alert_NameAlreadyExist.
					^nil]]
		ifTrue: [^nil].
	^aName