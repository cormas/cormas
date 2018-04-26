accessing povs
getPovsDataOfArcEntity: aClass forSelector: povSelector andInfo: infoName
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := self cormasModel allTheSituatedEntities: aClass.
	^entities
		collect:
			[:e | 
			Array
				with: (EntityReference on: e)
				with: (e getPovSpecForSelector: povSelector andInfo: infoName)
				with: (EntityReference on: e startNode patch)
				with: (EntityReference on: e stopNode patch)]