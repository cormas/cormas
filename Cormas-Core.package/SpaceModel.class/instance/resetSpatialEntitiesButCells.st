private - init
resetSpatialEntitiesButCells
	
	| theCells |
	self spatialEntities isEmpty ifTrue: [^nil].
	theCells := self elementaryEntities.
	self aggregatesEntities
		do:
			[:agg | 
			agg
				reset;
				destroyed: true].
	self changed: #removeAllCompoundSpatialEntityFigures.
	self spatialEntities: Dictionary new.
	self cormasModel class spatialClasses
		do:
			[:se | 
			se name = self cormasModel class cellClass name
				ifTrue:
					[self spatialEntities
						at: se name
						put: theCells]
				ifFalse:
					[self spatialEntities
						at: se name
						put: RemotableOrderedCollection new.
					self cormasModel initializeTheEntity: se]]