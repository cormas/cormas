model entities
getSelectedEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aName selectionInList |
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
	aName := (Cormas dropBlanksFromString: selectionInList selection) asSymbol.
	^aName notNil
		ifTrue: [self cormasModelClass environment at: aName]
		ifFalse: [nil]