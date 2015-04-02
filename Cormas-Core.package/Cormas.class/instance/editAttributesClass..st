model entities
editAttributesClass: aClass
	"Ouvrir fen√™tre √©quivalente √† la fen√™tre Param√®tre du menu simulation mais uniquement sur cette classe.  Avec boutons pour ajouter une ligne (donc un nouvel attribut) , niveau instance et classe. A chaque fois il y a la colonne de la valeur par d√©faut et l‚Äôutilisateur la rempli √† la main. Quand il valide, √ßa cr√©e les accesseurs et √ßa inscrit en dur la valeur par d√©faut (comme d‚Äôhab)"
	
	| das |
	das := AttributeAdder
		newAttributWindowOn: aClass
		model: self cormasModel.
	das openInterface: #oneClassAttributSetter