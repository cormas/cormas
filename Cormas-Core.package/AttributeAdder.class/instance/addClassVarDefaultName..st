actions_butons
addClassVarDefaultName: defaultName
	"Compile class adding the defaultName attribute, after having verifying that defaultName is a valid name.
defaultName =<String>"
	
	| newAttributName wrongCharactPlace |
	"Name verification"
	newAttributName := self cormas request:
			'Enter a class variable name (without white space, number nor symbol)'
		initialAnswer: defaultName.
	newAttributName isNil ifTrue: [^nil].
	newAttributName isEmpty ifTrue: [^nil].
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
			^self addClassVarDefaultName: newAttributName].
	targetClass class withAllSuperclasses
		do:
			[:cl | 
			(cl instVarNames includes: newAttributName)
				ifTrue:
					[self cormas
						warn:
							'The class <1s> already defines the attribute <2s> ! <n> Only a new reader accessor will be redefined for new default value.'
						with: targetClass name asString
						with: newAttributName]].
	^newAttributName