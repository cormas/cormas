accessing
spatialEntitiesClassNames
	
	| collec |
	collec := IndexedSet new.
	self environment allClasses
		do:
			[:aClass | 
			(aClass inheritsFrom: SpatialEntity)
				ifTrue: [collec add: aClass name asString]].
	^collec