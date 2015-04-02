model entities
renameEntityClass: aClass entitiesList: listSymbol
	
	| newName oldName result |
	"get the new name"
	oldName := aClass name.
	result := self renameClass: aClass.
	result isNil ifTrue: [^nil].
	newName := result name.
	newName isEmpty ifTrue: [^nil].	"Change attribut name at the level of CormasModel (ex: theCells by theLandUnits)"
	(self alert_ChangeAccessors: oldName by: newName)
		ifTrue:
			[self cormasModelClass
				renameAttribute: 'the' , oldName , 's'
				by: 'the' , newName , 's'.	"Change accessors name at the level of CormasModel (ex: theCells by theLandUnits)"
			self cormasModelClass
				renameSelector: 'the' , oldName , 's'
				by: 'the' , newName , 's'
				inputParametersNumber: 0.
			self cormasModelClass
				renameSelector: 'the' , oldName , 's:'
				by: 'the' , newName , 's:'
				inputParametersNumber: 1].	"change the lists (ex: listSymbol = #listSpatialEntities)"
	(self perform: listSymbol) list add: newName.
	(self perform: listSymbol) list remove: oldName.
	(self perform: listSymbol) selectionIndex: 0.
	listSymbol = #listPassiveEntities
		ifTrue: [self listEntitesPassivesChanged].
	listSymbol = #listSocialEntities ifTrue: [self listAgentsChanged].
	listSymbol = #listSpatialEntities
		ifTrue:
			[self listEntitesSpatialesChanged.
			self warnCormasModelThat: oldName changeTo: aClass].
	^aClass