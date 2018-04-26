display
displayOccupant: anOccupantReference on: aESEreference
	
	| aSelector aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	newPov entityReference: anOccupantReference.
	self drawing addFigureForOccupantPov: newPov on: aESEreference