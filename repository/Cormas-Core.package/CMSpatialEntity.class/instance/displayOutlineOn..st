- obsolete
displayOutlineOn: aGC
	
	self halt	"last version"	"self spaceModel gridCellShape = #irregular ifTrue: 
			[aGC paint: ColorValue black.
			image asStroker displayOn: aGC	]"	"even older version"	"self spaceModel gridCellShape = #irregular ifTrue: 
			[aGC paint: ColorValue black.
			image asStroker displayOn: aGC	ifFalse: [self image displayOn: aGC at: self center]]"