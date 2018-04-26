+ update
updateEntities: aClass
	"Purpose: removes all the dead or destroyed intances from theClasss collection and adds the new entities stored into collector"
	
	(self theEntities: aClass) addAll: (self collector entitiesAt: aClass).
	self collector empty: aClass.	"removes all the dead or destroyed intances"
	self removeDeadEntities: aClass