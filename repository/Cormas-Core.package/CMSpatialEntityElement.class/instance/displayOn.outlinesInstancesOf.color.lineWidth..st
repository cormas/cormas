- displaying - obsolete
displayOn: aGC outlinesInstancesOf: aClassName color: aColorName lineWidth: anInteger

	self halt.
	(self id = self spaceModel elementaryEntities size
		and: [ (self spaceModel spatialEntities includesKey: aClassName)
				and: [ (self spaceModel spatialEntities at: aClassName) isNil not
						and: [ (self spaceModel spatialEntities at: aClassName) isNotEmpty ] ] ])
		ifTrue: [ aGC paint: (Color perform: aColorName).
			aGC lineWidth: anInteger.
			(self spaceModel spatialEntities at: aClassName)
				do: [ :a | 
					a image notNil
						ifTrue: [ a image component asStroker displayOn: aGC ] ] ]