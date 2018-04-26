model entities
changeAbstractSocial
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [self changeAbstract: aClass]