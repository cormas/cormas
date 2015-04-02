model entities
modifySocialEntityDiagram
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]