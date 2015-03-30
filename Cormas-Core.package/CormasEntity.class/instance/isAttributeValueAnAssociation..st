- utilities - attributes
isAttributeValueAnAssociation: aSymbol
	
	^self class environment includes: (self perform: aSymbol) class