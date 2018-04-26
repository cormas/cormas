model entities
specializeEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	(aClass notNil and: [self changeRequest])
		ifTrue: [self specializeEntityClass: aClass type: aType]