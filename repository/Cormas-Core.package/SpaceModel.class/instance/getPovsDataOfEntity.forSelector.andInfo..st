accessing povs
getPovsDataOfEntity: aClass forSelector: povSelector andInfo: infoName
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := (aClass inheritsFrom: CMSpatialEntity)
		ifTrue: [self spatialEntitiesAt: aClass name]
		ifFalse: [self cormasModel allTheSituatedEntities: aClass].
	aClass isSpatialEntitySetClass
		ifTrue:
			[^entities
				collect:
					[:e | 
					(EntityReference on: e)
						->
							(e getPovSpecWithComponentsForSelector: povSelector andInfo: infoName)]]
		ifFalse:
			[^entities
				collect:
					[:e | 
					(EntityReference on: e)
						-> (e getPovSpecForSelector: povSelector andInfo: infoName)]]