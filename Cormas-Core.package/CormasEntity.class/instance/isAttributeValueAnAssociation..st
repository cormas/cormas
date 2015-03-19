as yet unclassified
isAttributeValueAnAssociation: aSymbol
	
	^self class environment includes: (self perform: aSymbol) class