initialization
initializePresenter
	" Private - See superimplementor's comment "
	" SimManager>>initScenarioWindow "
	
	self initMethodList items: self projectManager modelInitMethods.
	self controlMethodList items: self projectManager modelControlInitMethods.

	self initMethodList isEmpty 
		ifTrue: [ self alertMessage: self tMissingInitMethods ].
	self controlMethodList isEmpty 
		ifTrue: [ self alertMessage: self tMissingControlMethods ].
		
	self initializeActiveInit.
	self initializeActiveControl.