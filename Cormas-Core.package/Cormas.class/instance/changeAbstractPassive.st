model entities
changeAbstractPassive
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [self changeAbstract: aClass]