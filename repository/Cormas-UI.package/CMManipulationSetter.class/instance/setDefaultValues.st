actions
setDefaultValues
	
	| aList |
	aList := OrderedCollection new.
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #init).
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #control).
	aList
		addAll:
			(self
				defaultValuesForClass: self entityClass
				category: #testing).
	self methodsForManip_List list: aList