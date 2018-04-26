display
displayCompoundSpatialEntityClass: aClass
	"Called when 
	- the grid size has been modified 
	- a new instance of SpaceInterface is opened
	- the compoundSpatialEntities of aClass are created"
	
	| selectorName |
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing loadFiguresFrom: aClass povSelector: selectorName