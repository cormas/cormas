- pov and info
allEntitiesFrom: aClass povAt: povSelector
	"return a collection of povs from all entities inheriting from aClass"
	
	^(self allTheEntities: aClass) collect: [:each | each povAt: povSelector]