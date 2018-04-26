initialization
initializeBoxModels
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		authorName 			#TextInputFieldModel 
		authorEmail 			#TextInputFieldModel 
		ok 						#ButtonModel		
		removeButton 		#ButtonModel).