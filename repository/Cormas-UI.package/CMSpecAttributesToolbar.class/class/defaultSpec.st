specs
defaultSpec
	<spec>

	^ SpecLayout composed
		newRow: [ : r | 
			r
				add: #attributeLabel;
				add: #attributeAddButton;
				add: #attributeRemoveButton ;
				addSplitter;
				add: #classVarLabel;
				add: #classVarAddButton;
				add: #classVarRemoveButton  ]
			height: 25;			
			yourself			
