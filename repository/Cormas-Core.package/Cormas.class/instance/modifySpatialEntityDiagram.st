model entities
modifySpatialEntityDiagram
	"Set target class as Abstract or Concret class. "
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil ifFalse: [aClass chooseActivityDiagramEditorToOpen]