getParameters
tryMethod: aMethod onClass: aClassOrInstance
	
	| result |
	^[result := aClassOrInstance perform: aMethod]
		on: GenericException
		do:
			[:ex | ex return: 'Non ca n a pas marche du tout. VA falloir traiter ca']