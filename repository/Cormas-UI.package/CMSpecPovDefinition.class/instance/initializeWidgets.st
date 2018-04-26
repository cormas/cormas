initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		methodsList		SpcEditableList		
		symbolsList		SpcEditableList).
				
	self methodsList 
		label: self translator tPoVListMethods;
		layoutSpecSelector: #buttonsOnTopSpec.
	self symbolsList 
		label: self translator tPoVListSymbols;
		layoutSpecSelector: #buttonsOnTopSpec.
				
	self initializeFocus.