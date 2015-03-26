initialize-release
prepareClasses
	
	| modelClasses |
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[modelClasses := self linkedSpaceInterface siConfig createEntitiesList list
				collect: [:cl | cl name]]
		ifFalse:
			[modelClasses := SortedCollection new.
			modelClasses
				addAll:
					((cormasModel class socialClasses
						select: [:c | c isAbstract not and: [c isSituatedClass]])
						collect: [:cl | cl name]).
			modelClasses
				addAll:
					((cormasModel class passiveObjectClasses
						select: [:c | c isAbstract not and: [c isSituatedClass]])
						collect: [:cl | cl name])].
	modelClasses isEmpty
		ifTrue: [^nil]
		ifFalse: [entity := modelClasses first asValue].
	entityChoices := (List withAll: modelClasses) asValue.
	self entity onChangeSend: #changeEntity to: self