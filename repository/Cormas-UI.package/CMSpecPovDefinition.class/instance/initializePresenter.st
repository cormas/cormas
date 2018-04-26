initialization
initializePresenter
	" Private - See superimplementor's comment "

	self methodsList
		editActionBlock: [ 
			Smalltalk tools browser 
				openOnClass: self projectManager cormasModelClass 
				selector: self methodsList selectedItem ].

	self symbolsList

	