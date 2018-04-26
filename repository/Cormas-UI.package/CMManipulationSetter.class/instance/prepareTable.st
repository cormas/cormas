initialize-release
prepareTable
	
	| modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses addAll: (cormasModel spatialClasses collect: #name).
	modelClasses addAll: (cormasModel socialClasses collect: #name).
	modelClasses addAll: (cormasModel passiveObjectClasses collect: #name).
	entityChoices := (OrderedCollection withAll: modelClasses) asValueHolder.
	self entity onChangeSend: #changeEntity to: self.	"self setDefaultValues."
	self initialize