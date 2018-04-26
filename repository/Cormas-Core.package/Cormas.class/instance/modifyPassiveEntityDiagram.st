model entities
modifyPassiveEntityDiagram
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]