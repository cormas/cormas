accessing povs
getPovsDataOfOccupantEntity: aClass forSelector: povSelector andInfo: infoName
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := (aClass inheritsFrom: CMSpatialEntity)
		ifTrue: [self spatialEntitiesAt: aClass name]
		ifFalse: [self cormasModel allTheSituatedEntities: aClass].
	^entities
		collect:
			[:e | 
			Array
				with: (EntityReference on: e)
				with: (e getPovSpecForSelector: povSelector andInfo: infoName)
				with: (EntityReference on: e patch)]