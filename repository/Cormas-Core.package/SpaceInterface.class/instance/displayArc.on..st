display
displayArc: anOccupantReference on: parameter
	
	| aSelector startCellReference stopCellReference aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	startCellReference := parameter key.
	stopCellReference := parameter value.
	newPov entityReference: anOccupantReference.
	self drawing addFigureForArcPov: newPov start: startCellReference end:
			stopCellReference