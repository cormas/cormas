actions
closeAllInstances
	
	Cormas allInstances
		do:
			[:aCormas | 
			aCormas closeModel.
			aCormas requestForWindowClose]