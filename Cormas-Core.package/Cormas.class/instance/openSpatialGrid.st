visualisation
openSpatialGrid
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModelClass spatialClasses isEmpty
		ifTrue: [^self alert_NoSpatialEntity].
	self spaceModel ifNil: [self cormasModel initializeSpaceModel].	"^self spaceInterfaces add: (SpaceInterface openAndDisplay: self currentSimulation spaceModel)"	"removing spaceInterfaces from Cormas (event are now propagated by spacemodel changes)"
	^SpaceInterface openAndDisplay: self cormasModel spaceModel