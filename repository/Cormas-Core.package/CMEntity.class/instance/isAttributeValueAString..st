- utilities - attributes
isAttributeValueAString: aSymbol
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^(aClass = CharacterArray or: [aClass inheritsFrom: CharacterArray])
		and: [(aClass inheritsFrom: Symbol) not]