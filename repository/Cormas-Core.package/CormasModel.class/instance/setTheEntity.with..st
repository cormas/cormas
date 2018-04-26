accessing - entities
setTheEntity: aClass with: aSet
	
	^self
		perform: (self setterForEntityClass: aClass)
		with: aSet