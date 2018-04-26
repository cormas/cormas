model entities
modifyEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aClass |
	aClass := self getSelectedEntityClassType: aType.
	aClass isNil ifFalse: [self edit: aClass onProtocol: #control]