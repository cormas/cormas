model entities
renameEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	(aClass notNil and: [self changeRequest])
		ifTrue: [self renameEntityClass: aClass type: aType].
	^aClass