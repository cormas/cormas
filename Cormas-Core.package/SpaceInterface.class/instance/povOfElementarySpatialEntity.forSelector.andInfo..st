accessing - entities pov
povOfElementarySpatialEntity: aSpatialEntityRef forSelector: povSelector andInfo: aInfoName
	"creating the pov of a spatialEntity"
	
	| aPov defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	aPov := aClass createEntityPOVwithSpec: povSpec defaultPov: defaultPov.
	aPov entityReference: aSpatialEntityRef.
	^aPov