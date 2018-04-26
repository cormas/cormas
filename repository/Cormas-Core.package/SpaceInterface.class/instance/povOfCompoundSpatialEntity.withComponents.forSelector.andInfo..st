accessing - entities pov
povOfCompoundSpatialEntity: aSpatialEntityRef withComponents: componentsRef forSelector: povSelector andInfo: aInfoName
	"creating the pov of a spatialEntity"
	
	| aPov componentsPovs defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	componentsPovs := OrderedCollection new.
	componentsRef
		do:
			[:ref | 
			componentsPovs
				add: (self spaceModel elementaryEntitiesDefaultPovs at: ref entityId)].
	aPov := aClass createEntityPOVwithSpec: povSpec componentsPovs:
			componentsPovs.
	aPov entityReference: aSpatialEntityRef.
	^aPov