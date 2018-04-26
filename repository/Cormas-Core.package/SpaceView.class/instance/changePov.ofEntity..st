displaying
changePov: selectorName ofEntity: aClass
	"Called from spaceInterface, when a PoV has changed"
	"removing the EntityFigures of an Occupant Class if selectorName = #nil"
	
	(selectorName = #nil and: [aClass isSpatialClass not])
		ifTrue: [^self removeAllFiguresOf: aClass].
	aClass isSpatialClass
		ifTrue:
			["removing the other spatialEntityFigures, (do not remove the agregates figures which POV = delimitors)"
			selectorName = #delimitors | (selectorName = #nil)
				ifFalse: [self removeAllSpatialFiguresBut: aClass]].
	self removeAllFiguresOf: aClass.	"il se peut que le nouveau PoV demande des images diff√©rentes"
	selectorName = #nil ifTrue: [^nil].
	self loadFiguresFrom: aClass povSelector: selectorName