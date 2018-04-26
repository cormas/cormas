- utilities - attributes
isAttributeValueANumber: aSymbol
	
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Number or: [aClass inheritsFrom: Number]	"or:[(aValue contains: [:char | char isDigit not and:[char ~= $.]]) not]"