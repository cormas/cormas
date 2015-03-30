save
saveValue: aValue
	"Copy aValue on the right Excel cell then increase the current line."
	
	self sheet
		setRange: self currentCell
		to: aValue.
	self dataSavedByLine
		ifTrue: [self incrColumn]
		ifFalse: [self incrLine]