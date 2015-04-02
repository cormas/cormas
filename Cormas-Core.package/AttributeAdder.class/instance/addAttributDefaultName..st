actions_butons
addAttributDefaultName: defaultName
	"Compile class adding the defaultName attribute, after having verifying that defaultName is a valid name.
defaultName =<String>"
	
	| newAttributName wrongCharactPlace |
	"Name verification"
	newAttributName := Cormas current request:
			'Enter an attribute name (without white space, number nor symbol)'
		initialAnswer: defaultName.
	newAttributName isNil ifTrue: [^nil].
	newAttributName isEmpty ifTrue: [^nil].
	(newAttributName at: 1) isUppercase
		ifTrue:
			[newAttributName
				at: 1
				put: (newAttributName at: 1) asLowercase].
	wrongCharactPlace := OrderedCollection new.
	1
		to: newAttributName size
		do:
			[:i | 
			| char |
			char := newAttributName at: i.
			char isDigit ifTrue: [wrongCharactPlace add: i].
			(char isAlphaNumeric or: [char = $_])
				ifFalse: [wrongCharactPlace add: i]].
	wrongCharactPlace isEmpty
		ifFalse:
			[self cormas warn: '<1s> is not a valid name. Please, enter a valid name'
				with: newAttributName.
			wrongCharactPlace do: [:n | newAttributName at: n put: $_].
			^self addAttributDefaultName: newAttributName].
	targetClass withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: newAttributName)
				ifTrue:
					[self cormas
						warn:
							'The class <1s> already defines the attribute <2s> ! <n> Only a new reader accessor will be redefined for new default value.'
						with: targetClass name asString
						with: newAttributName]].
	^newAttributName	"Compile class adding the attribute"	"	aRefactoring := Refactory.Browser.AddInstanceVariableRefactoring variable:
			newAttributName class: targetClass.
	aRefactoring execute.
	^newAttributName"