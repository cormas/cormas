initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(povInfoList	SpcLabeledActionsList).
	self povInfoList 
		label: self translator tPoVListInfo;
		layoutSpecSelector: #buttonsOnTopSpec.
	self initializeFocus.