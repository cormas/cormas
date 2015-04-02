model entities
modifyPassiveEntityClassAttributes
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [self editAttributesClass: aClass]