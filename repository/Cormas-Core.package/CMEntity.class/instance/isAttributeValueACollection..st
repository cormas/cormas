- utilities - attributes
isAttributeValueACollection: aSymbol
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^(aClass = Collection or: [aClass inheritsFrom: Collection])
		and: [(aClass inheritsFrom: CharacterArray) not]