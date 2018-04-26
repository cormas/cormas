menu - actions
reopenWithSameHabitus
	"Open a new spatial grid with same properties and same Habitus"
	
	| interface |
	self spaceModel cormas
		ifNil: [^self cormas warn: 'The model should be initialized'].
	interface := SpaceInterface new.
	interface copyPovFrom: self.
	interface configName value: self configName value.
	interface siConfig: self siConfig.
	interface siConfig spaceInterface: interface.
	interface open.
	interface drawing fillColor: self drawing fillColor.
	interface siConfig applyCurrentSettings.
	interface siConfig isUndoRedoEnabled: self siConfig isUndoRedoEnabled.
	interface siConfig
		isManipulateForTabletEnabled: self siConfig isManipulateForTabletEnabled.
	interface siConfig
		isSingleDefaultPovShown: self siConfig isSingleDefaultPovShown.
	interface siConfig
		isSingleDefaultInfoShown: self siConfig isSingleDefaultInfoShown.
	interface siConfig perform: interface siConfig defaultTool value.
	interface siConfig perform: interface siConfig siMenuFormat value.
	^interface