- binary storage
setCurrentID_from: arrayOfEntities
	
	| lastId |
	(Set withAll: (arrayOfEntities collect: [:inst | inst class]))
		do:
			[:aClass | 
			lastId := (arrayOfEntities select: [:inst | inst class = aClass]) size.
			aClass CurrentId: lastId]