initialize-release
buildCharacterList
	
	| characters |
	characters := OrderedCollection new.
	self symbolKeys
		do: [:each | characters add: each asString -> (Array with: each)].
	self specialCharacters
		do: [:each | characters add: each printString -> (Array with: each)].
	characters add: 'Printable' -> self printableCharacters.
	self characterList list: characters