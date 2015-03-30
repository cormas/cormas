actions
goToEntityType: aClassName
	
	aClassName = self entityClass name ifTrue: [^nil].
	self resetInstanceShow.
	object := EntityReference
		on:
			(self linkedSI cormasModel
				allTheEntities: (self linkedSI cormasModel classFromSymbol: aClassName))
				first.
	self updateValues.
	self updateInstanceShow