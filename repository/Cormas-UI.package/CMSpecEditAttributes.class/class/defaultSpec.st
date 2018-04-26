initialization
defaultSpec
	<spec>
	^ SpecLayout composed
			newColumn: [ : r |
				r
					add: #sAttributesLabel height: self toolbarHeight;
					add: #superclassesAttributesTable;
					add: #tAttributesLabel height: self toolbarHeight;
					add: #targetAttributesTable;
					add: #toolbarAttributeActions height: self toolbarHeight;
					add: #toolbar height: self toolbarHeight ]
