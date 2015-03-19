as yet unclassified
isAttributeValueABoolean: aSymbol
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Boolean or: [aClass inheritsFrom: Boolean]