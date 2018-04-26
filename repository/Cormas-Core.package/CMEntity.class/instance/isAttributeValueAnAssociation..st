- utilities - attributes
isAttributeValueAnAssociation: aSymbol
	
	^ self class cmEnvironment includes: (self perform: aSymbol) class