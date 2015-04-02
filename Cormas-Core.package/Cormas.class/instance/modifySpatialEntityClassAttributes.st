model entities
modifySpatialEntityClassAttributes
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]