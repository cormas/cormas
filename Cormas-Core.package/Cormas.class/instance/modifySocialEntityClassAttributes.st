model entities
modifySocialEntityClassAttributes
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]