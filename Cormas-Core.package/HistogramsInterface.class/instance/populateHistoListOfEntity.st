initialize-release
populateHistoListOfEntity
	
	self histoList
		list:
			(List
				withAll:
					(DefaultAttributesSetter attributsFromClass: self activeEntity) sorted)