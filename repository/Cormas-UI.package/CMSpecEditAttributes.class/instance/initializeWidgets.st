initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			superclassesAttributesTable 	SpcFastTable 
			sAttributesLabel 					LabelModel 
			targetAttributesTable 			SpcFastTable 
			tAttributesLabel 					LabelModel
			toolbarAttributeActions 			CMSpecAttributesToolbar
			toolbar 								SpcTwoButtonToolbar).

	self initializeAttributeTables.
	self sAttributesLabel label: self translator tAttributesSuperLabel.
	self tAttributesLabel label: self translator tAttributesTargetLabel.
	self toolbar 
		firstButtonLabel: self translator tReset;
		secondButtonLabel: self translator tApply.
	self focusOrder
		add: superclassesAttributesTable;
		add: targetAttributesTable