private-buttons list
performButtonFor: att_Item
	
	att_Item isCollection
		ifTrue: [^(self entity perform: att_Item name asSymbol) inspect].
	att_Item isNumber
		ifTrue:
			[^HistogramsInterface
				openOnEntity: self entityClass
				attribute: att_Item name
				model: self linkedSI cormasModel].
	att_Item isBoolean
		ifTrue:
			[^HistogramsInterface
				openOnEntity: self entityClass
				nonNumericAttribute: att_Item name
				model: self linkedSI cormasModel].
	att_Item isAssociation
		ifTrue:
			[^EntityInspector
				inspect:
					(EntityReference on: (self entity perform: att_Item name asSymbol))
				spaceInterface: self linkedSI].	"cas o√π la valeur de l'attribut est du texte ou du symbole"
	^HistogramsInterface
		openOnEntity: self entityClass
		nonNumericAttribute: att_Item name
		model: self linkedSI cormasModel