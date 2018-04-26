save_private
saveCollectionWithLabel: aCollection onSheet: sheetNumber
	"Create the column (or a line) containing the label and the values
	aCollection = ('aString' 3 5 88 90)"
	
	| label |
	label := aCollection first asString.
	aCollection removeFirst.
	self excel saveLabel: label and: aCollection onSheet: sheetNumber