initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(povInfoList	SpcActionList).
	self povInfoList 
		label: self translator tPoVListInfo;
		layoutSpecSelector: #buttonsOnTopSpec.
	self initializeFocus.