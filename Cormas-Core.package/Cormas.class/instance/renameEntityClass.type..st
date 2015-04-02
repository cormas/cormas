model entities
renameEntityClass: aClass type: aType
	
	| newName oldName result |
	oldName := aClass name.
	result := self renameClass: aClass.
	result isNil ifTrue: [^nil].
	newName := result name.
	newName isEmpty ifTrue: [^nil].	"Change attribute znd its accessors names at the level of CormasModel (ex: theCells by theLandUnits)"
	(self alert_ChangeAccessors: oldName by: newName)
		ifTrue:
			[self cormasModelClass
				renameAttribute: 'the' , oldName , 's'
				by: 'the' , newName , 's'.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's'
				by: 'the' , newName , 's'
				inputParametersNumber: 0.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's:'
				by: 'the' , newName , 's:'
				inputParametersNumber: 1].
	(self perform: ('list' , aType , 'Entities') asSymbol)
		list: (self getSortedListEntityClassType: aType).
	(self perform: ('list' , aType , 'Entities') asSymbol) selectionIndex: 0.
	self warnCormasModelThat: oldName changeTo: aClass.
	^aClass