as yet unclassified
isAttributeValueASymbol: aSymbol
	| aClass |
	aClass := (self perform: aSymbol) class.
	^aClass = Symbol or: [aClass inheritsFrom: Symbol]