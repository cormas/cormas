private
selectCharacters: characters
	
	| newSelections charsLeft |
	newSelections := self characterList list
		reject:
			[:each | each value contains: [:char | (characters includes: char) not]].
	self characterList selections: newSelections.
	self charactersHolder value: ''.
	charsLeft := characters asOrderedCollection.
	self charactersForType
		do:
			[:each | 
			charsLeft
				remove: each
				ifAbsent: []].
	self charactersHolder
		value: (String withAll: (charsLeft reject: [:each | each isSymbol]))