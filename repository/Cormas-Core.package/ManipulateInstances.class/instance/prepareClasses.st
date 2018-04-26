initialize-release
prepareClasses
	
	| modelClassesUsed aList modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses
		addAll:
			(cormasModel class spatialClasses collect: [:cl | cl name]) sorted.
	modelClasses
		addAll: (cormasModel class socialClasses collect: [:cl | cl name]) sorted.
	modelClasses
		addAll:
			(cormasModel class passiveObjectClasses collect: [:cl | cl name]) sorted.
	modelClassesUsed := OrderedCollection new.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[modelClasses
				do:
					[:c | 
					(self linkedSpaceInterface siConfig
						manipWholePopFor: c class)
						ifTrue: [modelClassesUsed add: c]]]
		ifFalse: [modelClasses do: [:c | modelClassesUsed add: c]].
	entityChoices := (List withAll: modelClassesUsed) asValue.
	self entity onChangeSend: #changeEntity to: self.
	self class entitiesToCreateForSpaceView: nil.
	aList := List withAll: #(#' ' #= #> #>= #< #<=).
	operatorChoices := aList asValue