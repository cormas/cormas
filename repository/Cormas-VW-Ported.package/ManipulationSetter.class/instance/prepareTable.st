initialize-release
prepareTable
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses addAll: (cormasModel spatialClasses collect: [:cl | cl name]).
	modelClasses addAll: (cormasModel socialClasses collect: [:cl | cl name]).
	modelClasses
		addAll: (cormasModel passiveObjectClasses collect: [:cl | cl name]).
	entityChoices := (List withAll: modelClasses) asValue.
	self entity onChangeSend: #changeEntity to: self.	"self setDefaultValues."
	super initialize