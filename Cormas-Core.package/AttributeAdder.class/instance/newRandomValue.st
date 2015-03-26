actions_menu
newRandomValue
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	self openValueChooserInterfaceOfCAV: aCAV.
	self addCAV: aCAV