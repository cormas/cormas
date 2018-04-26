initialization
initializeAttributeTables

	{ 'Class' . 'Attribute' . 'Value' } do: [ : attName | 
		self superclassesAttributesTable addColumn: (FTColumn id: attName).
		self targetAttributesTable addColumn: (FTColumn id: attName) ].
	"numberOfColumns: 3 withWidths: #(250 250 50);"

	self superclassesAttributesTable
		display: [ : attItem | self wrapItem: attItem ];
		menu: [ self menuMorphForSelectedItems ].
	
	self targetAttributesTable
		display: [ : attItem | self morphForItemAt: attItem ];
		menu: [ self menuMorphForSelectedItems ].
