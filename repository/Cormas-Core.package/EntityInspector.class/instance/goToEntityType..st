actions
goToEntityType: aClassName
	
	aClassName = self entityClass name ifTrue: [^nil].
	self resetInstanceShow.
	object := EntityReference
		on:
			(self linkedSI cormasModel
				allTheEntities: aClassName class)
				first.
	self updateValues.
	self updateInstanceShow