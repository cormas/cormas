Class {
	#name : #CMSpaceInterfaceConfig,
	#superclass : #CMSpecObject,
	#instVars : [
		'entitiesList',
		'observedEntitiesList',
		'manipEntitiesList',
		'createEntitiesList',
		'spaceInterface',
		'configName',
		'manipMethods',
		'manipMethodsList',
		'entitySelected',
		'entitiesToAddList',
		'methodsToAddList',
		'attributes',
		'attributesList',
		'povMethods',
		'povMethodsList',
		'infoMethods',
		'infoMethodsList',
		'probeMethods',
		'probeMethodsList',
		'defaultPov',
		'defaultInfo',
		'canBeMoved',
		'moveEntityCheckBox',
		'manipWholePop',
		'manipWholePopCheckBox',
		'canChangeValues',
		'canChangeValuesCheckBox',
		'delimiterSize',
		'trackLengthValue',
		'trackedAgents',
		'defaultTool',
		'isManipulateForTabletEnabled',
		'isUndoRedoEnabled',
		'isSingleDefaultPovShown',
		'isSingleDefaultInfoShown',
		'siMenuFormat'
	],
	#classInstVars : [
		'winAddEntities_title',
		'winAddMethods_title'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #'instance creation' }
CMSpaceInterfaceConfig class >> newFor: aSI [
	
	| x |
	x := super new.
	x spaceInterface: aSI.
	x prepareSettings.
	^x
]

{ #category : #'instance creation' }
CMSpaceInterfaceConfig class >> newFor: aSI withConfig: aConfigName [
	
	| x |
	x := super new.
	x spaceInterface: aSI.
	x prepareSettings.
	x configName value: aConfigName.
	x spaceInterface configName value: aConfigName.
	self
		loadSIconfig:
			(x spaceInterface cormasModelClass
				perform: ('SIconfig_' , aConfigName) asSymbol)
		in: x
		ofModel: aSI cormasModel.
	^x
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> plusIcon [
	
	^SpaceInterface createEntityIcon
]

{ #category : #'save-load' }
CMSpaceInterfaceConfig class >> saveSIconfig: aConfig intoClass: modedelClass name: aName [
	
	| selector aString |
	aString := 'configName:*' , aName ,
			'
observedEntitiesList:*'.
	aConfig observedEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aString := aString ,
			'
manipEntitiesList:*'.
	aConfig manipEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aString := aString ,
			'
createEntitiesList:*'.
	aConfig createEntitiesList list
		do: [:e | aString := aString , e name printString , ','].
	aConfig manipMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
manipMethods:*' , aClass name asString.
			(aConfig manipMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig povMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
povMethods:*' , aClass name asString.
			(aConfig povMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig attributes keys
		do:
			[:aClass | 
			aString := aString ,
					'
attributes:*' , aClass name asString.
			(aConfig attributes at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig infoMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
infoMethods:*' , aClass name asString.
			(aConfig infoMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig probeMethods keys
		do:
			[:aClass | 
			aString := aString ,
					'
probeMethods:*' , aClass name asString.
			(aConfig probeMethods at: aClass)
				do: [:aM | aString := aString , ',' , aM asString]].
	aConfig canBeMoved keys
		do:
			[:aClass | 
			(aConfig canBeMovedFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
canBeMoved:*' , aClass name asString , ','
						, (aConfig canBeMovedFor: aClass) asString]].
	aConfig manipWholePop keys
		do:
			[:aClass | 
			(aConfig manipWholePopFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
manipWholePop:*' , aClass name asString , ','
						, (aConfig manipWholePopFor: aClass) asString]].
	aConfig canChangeValues keys
		do:
			[:aClass | 
			(aConfig canChangeValuesFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
canChangeValues:*' , aClass name asString , ','
						, (aConfig canChangeValuesFor: aClass) asString]].
	aConfig defaultPov keys
		do:
			[:aClass | 
			(aConfig defaultPovFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
defaultPov:*' , aClass name asString , ','
						, (aConfig defaultPovFor: aClass) asString]].
	aConfig defaultInfo keys
		do:
			[:aClass | 
			(aConfig defaultInfoFor: aClass)
				ifNotNil:
					[aString := aString ,
							'
defaultInfo:*' , aClass name asString , ','
						, (aConfig defaultInfoFor: aClass) asString]].
	aString := aString ,
			'
delimiterSize:*' , 'ESE,' , aConfig delimiterSize value asString ,
			'
defaultTool:*' , aConfig defaultTool value asString ,
			'
siMenuFormat:*' , aConfig siMenuFormat value asString ,
			'
isUndoRedoEnabled:*' , aConfig isUndoRedoEnabled asString ,
			'
isManipulateForTabletEnabled:*'
		, aConfig isManipulateForTabletEnabled asString ,
			'
isSingleDefaultPovShown:*' , aConfig isSingleDefaultPovShown asString ,
			'
isSingleDefaultInfoShown:*' , aConfig isSingleDefaultInfoShown asString ,
			'
trackLengthValue:*' , 'All,' , aConfig trackLengthValue asString ,
			'
trackedAgents:*'.
	aConfig trackedAgents do: [:e | aString := aString , e asString , ','].
	selector := 'SIconfig_' , aName.
	modedelClass class
		compile:
			(selector ,
					'\"Returns an array containing the settings of the Spatial Interface configuration named '
				, aName , '"\^''' , aString , '''\') withCRs
		classified: 'SI_config'
		notifying: nil
]

{ #category : #accessing }
CMSpaceInterfaceConfig class >> winAddEntities_title [
	
	^winAddEntities_title ifNil: [winAddEntities_title := 'Entities']
]

{ #category : #accessing }
CMSpaceInterfaceConfig class >> winAddEntities_title: anObject [
	
	winAddEntities_title := anObject
]

{ #category : #accessing }
CMSpaceInterfaceConfig class >> winAddMethods_title [
	
	^winAddMethods_title ifNil: [winAddMethods_title := 'Methods']
]

{ #category : #accessing }
CMSpaceInterfaceConfig class >> winAddMethods_title: anObject [
	
	winAddMethods_title := anObject
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addAttribute [
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil: [ self alertMessage: self translator tMustSelectEntity.
			^ nil ].
	self entitySelected value: anEntity name asString.
	aList := ((OrderedCollection
		withAll: (DefaultAttributesSetter attributsFromClass: anEntity))
		- (self attributesFor: anEntity)) asList.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: 'No more attributes can be added to this list' ].
	methodsToAddList := self multiSelectionList with: aList sorted.
	self class winAddMethods_title: self translator tAttributes.
	(self openDialogInterface: #winAddMethods)
		ifFalse: [ ^ nil ].
	aList := self attributesList list copy.
	aList
		addAll: (methodsToAddList selections collect: [ :s | s asString ]).
	aList sort: [ :x :y | x < y ].
	self attributesList setList: aList selecting: Array new.
	self attributes
		at: self observedEntitiesList selection
		put: self attributesList list
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addCreateEntities [
	
	self addEntitiesListName: #createEntitiesList
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addEntitiesListName: aListName [
	| aList |
	aList := self entitiesList copy.
	aList removeAll: (self perform: aListName) list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMoreEntities ].
	entitiesToAddList := self multiSelectionList with: aList.
	aListName = #createEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tEntitiesToCreate ].
	aListName = #manipEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tManipulationEntities ].
	aListName = #observedEntitiesList
		ifTrue: [ self class winAddEntities_title: self translator tObservedEntities ].
	(self openDialogInterface: #winAddEntities)
		ifFalse: [ ^ nil ].
	(self perform: aListName) list addAll: entitiesToAddList selections.
	(self perform: aListName) list sort: [ :x :y | x name < y name ].
	(self perform: aListName) selection: entitiesToAddList selections first.
	aListName = #manipEntitiesList
		ifTrue: [ entitiesToAddList selections
				do: [ :aClass | 
					self canBeMoved at: aClass put: true.
					self manipWholePop at: aClass put: true.
					self canChangeValues at: aClass put: true ] ]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addInfoMethods [
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil: [ self alertMessage: self translator tMustSelectEntity.
			^ nil ].
	self entitySelected value: anEntity name asString.
	aList := anEntity availableInfo asList.
	(aList includes: #nil)
		ifTrue: [ aList remove: #nil ].
	aList removeAll: self infoMethodsList_WithoutDefaultSign list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMoreInfo ].
	methodsToAddList := self multiSelectionList with: aList.
	self class winAddMethods_title: 'Info Methods'.
	(self openDialogInterface: #winAddMethods)
		ifFalse: [ ^ nil ].
	aList := self infoMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [ :x :y | x < y ].
	self infoMethodsList setList: aList selecting: Array new.
	self infoMethods
		at: self observedEntitiesList selection
		put: self infoMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuInfo
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addManipEntities [
	
	self addEntitiesListName: #manipEntitiesList.
	self displayMethodsAndOptionsForManipEntity
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addManipMethods [
	
	| anEntity aList |
	(anEntity := self manipEntitiesList selection) 
		ifNil: [
			self alertMessage: self translator tSelectEntity.
			^ nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity methodsForControl asOrderedCollection.
	aList removeAll: self manipMethodsList list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMoreMethods ].
	methodsToAddList := self multiSelectionList with: aList.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self manipMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [:x :y | x < y].
	self manipMethodsList
		setList: aList
		selecting: Array new.
	self manipMethods
		at: self manipEntitiesList selection
		put: self manipMethodsList list
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addObservedEntities [
	
	| old new test |
	old := self observedEntitiesList list copy.
	self addEntitiesListName: #observedEntitiesList.
	new := self observedEntitiesList list.
	test := false.
	old size = new size
		ifTrue: [ 
			1
				to: old size
				do: [:i | (old at: i) ~= (new at: i) ifTrue: [test := true]]]
		ifFalse: [test := true].
	test
		ifTrue:
			[(self spaceInterface)
				initMenuPov;
				initMenuInfo;
				initMenuTrack]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addPovMethods [
	
	| anEntity aList |
	(anEntity := self observedEntitiesList selection) 
		ifNil: [ 
			self alertMessage: self translator tSelectEntity.
			^ nil].
	self entitySelected value: anEntity name asString.
	aList := anEntity availablePov asOrderedCollection.
	(aList includes: #nil) ifTrue: [aList remove: #nil].
	aList removeAll: self povMethodsList_WithoutDefaultSign list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMorPoV ].
	methodsToAddList := self multiSelectionList with: aList.
	self class winAddMethods_title: self translator tPoVMethods.
	(self openDialogInterface: #winAddMethods) ifFalse: [^nil].
	aList := self povMethodsList list copy.
	aList addAll: methodsToAddList selections.
	aList sort: [:x :y | x < y].
	self povMethodsList
		setList: aList
		selecting: Array new.
	self povMethods
		at: self observedEntitiesList selection
		put: self povMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuPov
]

{ #category : #actions }
CMSpaceInterfaceConfig >> addProbeMethods [
	| anEntity aList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil: [ self alertMessage: 'An entity must be selected'.
			^ nil ].
	self entitySelected value: anEntity name asString.
	aList := anEntity probes asList.
	aList removeAll: self probeMethodsList list.
	aList isEmpty
		ifTrue: [ ^ self alertMessage: 'No more probe can be added to this list' ].
	methodsToAddList := self multiSelectionList with: aList.
	self class winAddMethods_title: 'Probe Methods'.
	(self openDialogInterface: #winAddMethods)
		ifFalse: [ ^ nil ].
	aList := self probeMethodsList list copy.
	aList addAll: methodsToAddList selections.
	self probeMethodsList setList: aList selecting: Array new.
	self probeMethods
		at: self observedEntitiesList selection
		put: self probeMethodsList list
]

{ #category : #actions }
CMSpaceInterfaceConfig >> applyCurrentSettings [
	
	self spaceInterface initMenuPov.
	self spaceInterface initMenuInfo.
	self applyDefaultPovs.
	self applyDefaultInfos.
	self perform: self delimiterSize value
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> applyDefaultInfos [
	
	| cellClass CSCs occupantClassses dicoInfo |
	(self spaceInterface infoMethodDico select: [:v | v ~= #nil])
		keysDo:
			[:aClass | 
			self spaceInterface
				changeInfo: #nil
				ofEntity: aClass class].
	dicoInfo := self defaultInfo copy select: [:v | v isNil not].
	cellClass := self spaceInterface cormasModelClass cellClass.
	CSCs := self spaceInterface cormasModelClass compoundSpatialClasses.
	occupantClassses := self spaceInterface cormasModelClass occupantClasses.
	(self defaultInfoFor: cellClass) isNil not
		ifTrue:
			[self spaceInterface
				changeInfo: ((self defaultInfoFor: cellClass) ifNil: [#nil])
				ofEntity: cellClass.	"ifNotNil:[]"
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					((CSCs includes: aClass) and: [defInfo = #delimitors])
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]].
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]]]
		ifFalse:
			[dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					((CSCs includes: aClass) and: [defInfo isNil not])
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]].
			dicoInfo
				keysAndValuesDo:
					[:aClass :defInfo | 
					(occupantClassses includes: aClass)
						ifTrue: [self spaceInterface changeInfo: defInfo ofEntity: aClass]]]
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> applyDefaultPovs [
	| dicoPov cellClass cSCs occupantClassses |
	(self spaceInterface povMethodDico select: [ :v | v ~= #nil ])
		keysDo:
			[ :aClass | self spaceInterface changePov: #nil ofEntity: aClass class ].
	dicoPov := self defaultPov copy reject: [ :v | v isNil ].
	cellClass := self spaceInterface cormasModelClass cellClass.
	cSCs := self spaceInterface cormasModelClass compoundSpatialClasses.
	occupantClassses := self spaceInterface cormasModelClass
		occupantClasses.
	(self defaultPovFor: cellClass) isNil not
		ifTrue: [ self spaceInterface
				changePov: ((self defaultPovFor: cellClass) ifNil: [ #nil ])
				ofEntity: cellClass.
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass) and: [ defPov = #delimitors ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ] ]
		ifFalse: [ dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass)
						and: [ defPov isNil not and: [ defPov ~= #delimitors ] ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					((cSCs includes: aClass) and: [ defPov = #delimitors ])
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ].
			dicoPov
				keysAndValuesDo: [ :aClass :defPov | 
					(occupantClassses includes: aClass)
						ifTrue: [ self spaceInterface changePov: defPov ofEntity: aClass ] ] ]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> attributes [
	
	^attributes ifNil: [attributes := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> attributes: anObject [
	
	attributes := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> attributesFor: aClass [
	
	(self attributes keys includes: aClass)
		ifFalse:
			[self attributes
				at: aClass
				put: (DefaultAttributesSetter attributsFromClass: aClass) sorted].
	^self attributes at: aClass
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> attributesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributesList isNil
		ifTrue: [attributesList := self multiSelectionList new]
		ifFalse: [attributesList]
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> buildManipulationMenu: aMenuBuilder forEntity: aClass [
	" Add to the menu the set of methods defined into 'methodsForManipulation' method. 
	The key will appear as the menu item. The selected method will be executed by the agent if the item is selected."
	
	(self manipMethodsFor: aClass)
		do: [:aSymbol | aMenuBuilder add: aSymbol asString -> aSymbol].
	^aMenuBuilder
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> canBeMoved [
	
	^canBeMoved ifNil: [canBeMoved := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> canBeMoved: anObject [
	
	canBeMoved := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> canBeMovedFor: aClass [
	
	(self canBeMoved keys includes: aClass)
		ifFalse:
			[self canBeMoved
				at: aClass
				put: aClass isSituatedClass].
	^self canBeMoved at: aClass
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> canChangeValues [
	
	^canChangeValues ifNil: [canChangeValues := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> canChangeValues: anObject [
	
	canChangeValues := anObject
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> canChangeValuesCheckBox [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^canChangeValuesCheckBox isNil
		ifTrue: [canChangeValuesCheckBox := false asValue]
		ifFalse: [canChangeValuesCheckBox]
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> canChangeValuesFor: aClass [
	
	(self canChangeValues keys includes: aClass)
		ifFalse: [self canChangeValues at: aClass put: true].
	^self canChangeValues at: aClass
]

{ #category : #actions }
CMSpaceInterfaceConfig >> cancelDefaultInfo [
	
	self infoMethodsList
		setList: self infoMethodsList_WithoutDefaultSign copy
		selecting: Array new.
	self defaultInfo
		at: self observedEntitiesList selection
		put: nil.
	self displayMethodsForObservedEntity
]

{ #category : #actions }
CMSpaceInterfaceConfig >> cancelDefaultPov [
	
	self povMethodsList
		setList: self povMethodsList_WithoutDefaultSign copy
		selecting: Array new.
	self defaultPov
		at: self observedEntitiesList selection
		put: nil.
	self displayMethodsForObservedEntity
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> checkClassAndMethodsExist [
	
	self checkHabitusList: #observedEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'observed entities'.
	self checkHabitusList: #manipEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'manipulated entities'.
	self checkHabitusList: #createEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'created entities'.
	self checkMethods: #povMethods exists_dialogConfirmTypeName: 'pov methods'.
	self checkMethods: #manipMethods exists_dialogConfirmTypeName:
			'manip methods'.
	self checkMethods: #attributes exists_dialogConfirmTypeName: 'attributes'.
	self checkMethods: #infoMethods exists_dialogConfirmTypeName:
			'info methods'.
	self checkMethods: #probeMethods exists_dialogConfirmTypeName: 'probes'.
	self checkDefaultValue: #defaultPov exists_dialogConfirmTypeName:
			'default pov'.
	self checkDefaultValue: #defaultInfo exists_dialogConfirmTypeName:
			'default info'
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> checkDefaultValue: methodsList exists_dialogConfirmTypeName: defaultListName [
	| defValue |
	(self perform: methodsList)
		keysDo: [ :aClass | 
			defValue := (self perform: methodsList) at: aClass.
			defValue
				ifNil: [ (self perform: methodsList) removeKey: aClass ]
				ifNotNil: [ (aClass allInstanceSelectors includes: defValue)
						ifFalse: [ (self
								confirm: (self confirmRemove: defValue list: aClass class: defaultListName))
								ifTrue: [ (self perform: methodsList) remove: aClass ] ] ] ]
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> checkHabitusList: aHabitusMethodList existsIn: modelList dialogConfirmTypeName: typeName [
	| undefined |
	undefined := Set new.
	(self perform: aHabitusMethodList) list
		do: [ :e | 
			((self perform: modelList) includes: e)
				ifFalse: [ undefined add: e ] ].
	undefined isEmpty
		ifFalse: [ (self
				confirm: (self confirmRemoveType: typeName undefined: undefined))
				ifTrue: [ (self perform: aHabitusMethodList) removeAll: undefined ] ]
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> checkMethods: methodsList exists_dialogConfirmTypeName: methodsName [
	| undefined |
	methodsList = #defaultPov.
	(self perform: methodsList)
		keysDo: [ :aClass | 
			undefined := Set new.
			((self perform: methodsList) at: aClass)
				do: [ :aM | 
					(aClass allInstanceSelectors includes: aM asSymbol)
						ifFalse: [ undefined add: aM ] ].
			undefined isEmpty
				ifFalse: [ (self
						confirm:
							(self
								confirmRemoveMethods: methodsName
								inClass: aClass
								undefined: undefined))
						ifTrue: [ ((self perform: methodsList) at: aClass) removeAll: undefined ] ] ]
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> classesForDelimitorMenuInheritingFrom: aClass [
	
	^self observedEntitiesList list select: [:c | c inheritsFrom: aClass]
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> classesForInfoMenuInheritingFrom: aClass [
	
	| list infolist |
	list := OrderedCollection new.
	(self observedEntitiesList list select: [:c | c inheritsFrom: aClass])
		do:
			[:c | 
			infolist := self infoMethodsFor: c.
			infolist isEmpty
				ifFalse:
					[(self isSingleDefaultInfoShown not
						and:
							[infolist size = 1 and: [(infolist at: 1) = (self defaultInfoFor: c)]])
						ifFalse: [list add: c]]].
	^list
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> classesForPovMenuInheritingFrom: aClass [
	
	| list povlist |
	list := OrderedCollection new.
	(self observedEntitiesList list select: [:c | c inheritsFrom: aClass])
		do:
			[:c | 
			povlist := self povMethodsFor: c.
			povlist isEmpty
				ifFalse:
					[(self isSingleDefaultPovShown not
						and:
							[povlist size = 1 and: [(povlist at: 1) = (self defaultPovFor: c)]])
						ifFalse: [list add: c]]].
	^list
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> classesForTrackMenuInheritingFrom: aClass [
	
	^self observedEntitiesList list select: [:c | c inheritsFrom: aClass]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> configName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^configName isNil
		ifTrue: [configName := String new asValue]
		ifFalse: [configName]
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> confirmRemove: defValue list: aClass class: defaultListName [
	^ 'The ' , defaultListName , ' ' , defValue , ' of class '
		, aClass name
		,
			' defined in the Habitus does not exist in the model.
Do you want to remove it (recommended)?

If you accept, even if the obsolete ' , defaultListName
		, ' is removed, you need to re-display the ' , defaultListName
		, ' list, to see the changes appear'
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> confirmRemoveMethods: methodsName inClass: aClass undefined: undefined [
	^ 'The ' , methodsName , ' ' , undefined printString , ' of class '
		, aClass name
		,
			' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , methodsName
		, ' are removed, you need to re-display the ' , methodsName
		, ' list, to see the changes appear'
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> confirmRemoveType: typeName undefined: undefined [
	^ 'The ' , typeName , ' ' , undefined printString
		,
			' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , typeName
		,
			' are removed, you need to reopen the Habitus interface to see the changes appear'
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> cormas [
	
	^Cormas current
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> createEntitiesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^createEntitiesList isNil
		ifTrue: [createEntitiesList := SelectionInList new]
		ifFalse: [createEntitiesList]
]

{ #category : #debuging }
CMSpaceInterfaceConfig >> debugPovNameDefault [
	
	self povMethods values
		do:
			[:c | c do: [:v | ('* ->D' match: v ignoreCase: false) ifTrue: [self halt]]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> defaultInfo [
	
	^defaultInfo ifNil: [defaultInfo := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> defaultInfo: anObject [
	
	defaultInfo := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> defaultInfoFor: aClass [
	
	(self defaultInfo keys includes: aClass)
		ifFalse: [self defaultInfo at: aClass put: nil].
	^self defaultInfo at: aClass
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> defaultPov [
	
	^defaultPov ifNil: [defaultPov := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> defaultPov: anObject [
	
	defaultPov := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> defaultPovFor: aClass [
	
	(self defaultPov keys includes: aClass)
		ifFalse: [self defaultPov at: aClass put: nil].
	^self defaultPov at: aClass
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> defaultTool [
	
	^defaultTool isNil
		ifTrue: [defaultTool := #toolInspect asValue]
		ifFalse: [defaultTool]
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> delimiterSize [
	
	^delimiterSize isNil
		ifTrue:
			[delimiterSize := self spaceInterface
				ifNotNil: [:si | si delimiterSize]
				ifNil: [#pixel1 asValue]]
		ifFalse: [delimiterSize]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> displayOptionsValidation [
	
	^true
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> entitiesList [
	
	^entitiesList
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> entitiesList: anObject [
	
	entitiesList := anObject
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> entitiesToAddList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entitiesToAddList isNil
		ifTrue: [entitiesToAddList := self multiSelectionList new]
		ifFalse: [entitiesToAddList]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> entitySelected [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entitySelected isNil
		ifTrue: [entitySelected := String new asValue]
		ifFalse: [entitySelected]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> explainHabitus [
	
	LongMessageDialogWindow new 
		entryText: self translator tHabitusText;
		title: self translator tHabitusTitle;
		open

]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> forceSItrackAgents: aClass [
	
	| menuSI agentFigures |
	menuSI := (self spaceInterface menuHolder value atNameKey: #trackAgents)
		submenu
		menuItemLabeled: aClass name asString
		ifNone: [nil].
	(((self trackedAgents includes: aClass name) and: [menuSI isOn not])
		or:
			[(self trackedAgents includes: aClass name) not
				and: [menuSI isNil not and: [menuSI isOn]]])
		ifTrue:
			[agentFigures := #().
			(self spaceInterface drawing entityFigures
				at: aClass
				ifAbsent: [nil])
				ifNotNil:
					[agentFigures := (self spaceInterface drawing entityFigures at: aClass)
						values].
			menuSI isOn
				ifTrue:
					[menuSI beOff.
					self spaceInterface trackedFigureTypes
						remove: aClass name
						ifAbsent: [nil].
					agentFigures do: [:af | af untrack]]
				ifFalse:
					[menuSI beOn.
					(self spaceInterface trackedFigureTypes includes: aClass name)
						ifFalse: [self spaceInterface trackedFigureTypes add: aClass name].
					agentFigures do: [:af | af track]]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> infoMethods [
	
	^infoMethods ifNil: [infoMethods := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> infoMethods: anObject [
	
	infoMethods := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> infoMethodsFor: aClass [
	
	| aSet |
	(self infoMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass availableInfo.
			aSet remove: #nil.
			self infoMethods
				at: aClass
				put: aSet sorted].
	^self infoMethods at: aClass
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> infoMethodsForSIMenu: aClass [
	
	| infoList |
	infoList := (self infoMethodsFor: aClass) copy.
	infoList addFirst: #nil.
	^infoList
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> infoMethodsList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^infoMethodsList isNil
		ifTrue: [infoMethodsList := self multiSelectionList new]
		ifFalse: [infoMethodsList]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> infoMethodsList_WithoutDefaultSign [
	
	| aList aDefInfoWithSign |
	aList := self infoMethodsList list copy.
	aDefInfoWithSign := aList
		detect: [:m | self isItDefault: m]
		ifNone: [^self infoMethodsList copy].
	aList remove: aDefInfoWithSign.
	aList add: (self defaultInfo at: self observedEntitiesList selection).
	aList sort: [:x :y | x < y].
	^ self multiSelectionList with: aList
]

{ #category : #testing }
CMSpaceInterfaceConfig >> isItDefault: aSymbolOrString [
	
	^'* ->D' match: aSymbolOrString
]

{ #category : #actions }
CMSpaceInterfaceConfig >> loadConfig [
	
	| collec |
	collec := self spaceInterface cormasModel habitusNames.
	^ (self requestFrom: collec message: self translator tChooseConfig title: 'CORMAS')
		ifNotNil: [ : choice | self loadConfigName: choice ] 
		ifNil: [ nil ]
	
]

{ #category : #actions }
CMSpaceInterfaceConfig >> loadConfigName: aName [
	
	self configName value: aName.
	self spaceInterface configName value: aName.
	self class
		loadSIconfig:
			(self spaceInterface cormasModelClass
				perform: ('SIconfig_' , aName) asSymbol)
		in: self
		ofModel: self spaceInterface cormasModel.
	self applyCurrentSettings.
	self setCheckMarksForDisplayOptionsMenu.
	self forceSItoApplyConfigTrackAgents
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> manipChekboxValidation [
	
	^self manipEntitiesList selection isNil not
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> manipEntitiesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^manipEntitiesList isNil
		ifTrue: [manipEntitiesList := SelectionInList new]
		ifFalse: [manipEntitiesList]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> manipMethods [
	
	^manipMethods ifNil: [manipMethods := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> manipMethods: anObject [
	
	manipMethods := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> manipMethodsFor: aClass [
	
	(self manipMethods keys includes: aClass)
		ifFalse:
			[self manipMethods
				at: aClass
				put: aClass methodsForControl].
	^self manipMethods at: aClass
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> manipMethodsList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^manipMethodsList isNil
		ifTrue: [manipMethodsList := self multiSelectionList new]
		ifFalse: [manipMethodsList]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> manipWholePop [
	
	^manipWholePop ifNil: [manipWholePop := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> manipWholePop: anObject [
	
	manipWholePop := anObject
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> manipWholePopCheckBox [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^manipWholePopCheckBox isNil
		ifTrue: [manipWholePopCheckBox := false asValue]
		ifFalse: [manipWholePopCheckBox]
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> manipWholePopFor: aClass [
	
	(self manipWholePop keys includes: aClass)
		ifFalse: [self manipWholePop at: aClass put: true].
	^self manipWholePop at: aClass
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> manipulationMenuItemsForEntityType: aClass [
	" Returns the set of methods defined in the habitus for manipulating the selected entity"
	
	(self manipEntitiesList list includes: aClass)
		ifTrue:
			[^(self manipMethodsFor: aClass)
				collect: [:aSymbol | aSymbol asString -> (aClass -> aSymbol)]]
		ifFalse: [^Array new]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> methodsToAddList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^methodsToAddList isNil
		ifTrue: [methodsToAddList := self multiSelectionList new]
		ifFalse: [methodsToAddList]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> moveEntityCheckBox [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^moveEntityCheckBox isNil
		ifTrue: [moveEntityCheckBox := false asValue]
		ifFalse: [moveEntityCheckBox]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> observedEntitiesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^observedEntitiesList isNil
		ifTrue: [observedEntitiesList := SelectionInList new]
		ifFalse: [observedEntitiesList]
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> pixel0 [
	
	self delimiterSize value: #pixel0.
	self spaceInterface pixel0
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> pixel1 [
	
	self delimiterSize value: #pixel1.
	self spaceInterface pixel1
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> pixel2 [
	
	self delimiterSize value: #pixel2.
	self spaceInterface pixel2
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> pixel3 [
	
	self delimiterSize value: #pixel3.
	self spaceInterface pixel3
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> povMethods [
	
	^povMethods ifNil: [povMethods := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> povMethods: anObject [
	
	povMethods := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> povMethodsFor: aClass [
	
	| aSet |
	(self povMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass availablePov.
			aSet remove: #nil.
			self povMethods
				at: aClass
				put: aSet sorted].
	^self povMethods at: aClass
]

{ #category : #'overwrite spaceInterface' }
CMSpaceInterfaceConfig >> povMethodsForSIMenu: aClass [
	
	| povList |
	povList := (self povMethodsFor: aClass) copy.
	povList addFirst: #nil.
	^povList
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> povMethodsList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^povMethodsList isNil
		ifTrue: [povMethodsList := self multiSelectionList new]
		ifFalse: [povMethodsList]
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> povMethodsList_WithoutDefaultSign [
	
	| aList aDefPovWithSign |
	aList := self povMethodsList list copy.
	aDefPovWithSign := aList
		detect: [:m | self isItDefault: m]
		ifNone: [^self povMethodsList copy].
	aList remove: aDefPovWithSign.
	aList add: (self defaultPov at: self observedEntitiesList selection).
	aList sort: [:x :y | x < y].
	^ self multiSelectionList with: aList
]

{ #category : #'initialize-release' }
CMSpaceInterfaceConfig >> prepareSettings [
	
	self
		entitiesList:
			(self spaceInterface cormasModelClass visualizableClasses
				sort: [:x :y | x name < y name]) asList.
	self observedEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self manipEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self createEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self manipEntitiesList selectionHolder onChangeSend:
			#displayMethodsAndOptionsForManipEntity to: self.
	self observedEntitiesList selectionHolder onChangeSend:
			#displayMethodsForObservedEntity to: self
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> probeMethods [
	
	^probeMethods ifNil: [probeMethods := Dictionary new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> probeMethods: anObject [
	
	probeMethods := anObject
]

{ #category : #'access methods' }
CMSpaceInterfaceConfig >> probeMethodsFor: aClass [
	
	| aSet |
	(self probeMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass probes.
			self probeMethods at: aClass put: aSet].
	^self probeMethods at: aClass
]

{ #category : #aspects }
CMSpaceInterfaceConfig >> probeMethodsList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^probeMethodsList isNil
		ifTrue: [probeMethodsList := self multiSelectionList new]
		ifFalse: [probeMethodsList]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeAttribute [
	| aList |
	self attributesList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoAttribSelector ].
	aList := self attributesList list copy.
	aList removeAll: self attributesList selections.
	self attributesList setList: aList selecting: Array new.
	self attributes
		at: self observedEntitiesList selection
		put: self attributesList list	"	self spaceInterface initMenuInfo."
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeCreateEntity [
	
	self removeEntityListName: #createEntitiesList
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeEntityListName: aSymbol [

	| x |
	(self perform: aSymbol) selection
		ifNil: [ ^ self alertMessage: self translator tNoEntitySelected  ].
	x := (self perform: aSymbol) selectionIndex.
	(self perform: aSymbol) list
		remove: (self perform: aSymbol) selection.
	(self perform: aSymbol)
		selectionIndex: (x min: (self perform: aSymbol) list size)
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeInfoMethod [
	| aList |
	
	self infoMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	self infoMethodsList selections do: [ :m | 
		(self isItDefault: m)
			ifTrue: [ self defaultInfo at: self observedEntitiesList selection put: nil ] ].
	aList := self infoMethodsList list copy.
	aList removeAll: self infoMethodsList selections.
	self infoMethodsList setList: aList selecting: Array new.
	self infoMethods
		at: self observedEntitiesList selection
		put: self infoMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuInfo
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeManipEntity [
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	self removeEntityListName: #manipEntitiesList.
	(anEntity isNil not and: [self canBeMoved keys includes: anEntity])
		ifTrue: [self canBeMoved at: anEntity put: false].
	(anEntity isNil not and: [self manipWholePop keys includes: anEntity])
		ifTrue: [self manipWholePop at: anEntity put: false].
	(anEntity isNil not and: [self canChangeValues keys includes: anEntity])
		ifTrue: [self canChangeValues at: anEntity put: false]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeManipMethod [
	| aList |
	self manipMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	aList := self manipMethodsList list copy.
	aList removeAll: self manipMethodsList selections.
	self manipMethodsList setList: aList selecting: Array new.
	self manipMethods
		at: self manipEntitiesList selection
		put: self manipMethodsList list
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeObservedEntity [
	
	| old new test |
	old := self observedEntitiesList list copy.
	self removeEntityListName: #observedEntitiesList.
	new := self observedEntitiesList list.
	test := false.
	old
		do:
			[:aClass | 
			(new includes: aClass)
				ifFalse:
					[test := true.
					(self defaultPov keys includes: aClass)
						ifTrue: [self defaultPov removeKey: aClass]]].
	test
		ifTrue:
			[(self spaceInterface)
				initMenuPov;
				initMenuInfo;
				initMenuTrack]
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removePovMethod [
	| aList |
	self povMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	self povMethodsList selections
		do: [ :m | 
			(self isItDefault: m)
				ifTrue:
					[ self defaultPov at: self observedEntitiesList selection put: nil ] ].
	aList := self povMethodsList list copy.
	aList removeAll: self povMethodsList selections.
	self povMethodsList setList: aList selecting: Array new.
	self povMethods
		at: self observedEntitiesList selection
		put: self povMethodsList_WithoutDefaultSign list.
	self spaceInterface initMenuPov
]

{ #category : #actions }
CMSpaceInterfaceConfig >> removeProbeMethod [
	| aList |
	self probeMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	aList := self probeMethodsList list copy.
	aList removeAll: self probeMethodsList selections.
	self probeMethodsList setList: aList selecting: Array new.
	self probeMethods
		at: self observedEntitiesList selection
		put: self probeMethodsList list
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> reopenSI [
	
	| oldSI newSI |
	oldSI := self spaceInterface.
	newSI := self spaceInterface reopenWithSameHabitus.
	oldSI siConfig: nil.
	oldSI closeRequest.
	^newSI
]

{ #category : #actions }
CMSpaceInterfaceConfig >> saveConfig [
	self configName value isEmpty
		ifTrue: [ ^ self alertMessage: self translator tConfigTitle ].
	(self configName value includes: $ )
		ifTrue: [ (self confirm: self translator tSpaceNotAllowed)
				ifTrue: [ self configName
						value: (self configName value replaceAll: $  with: $_) ]
				ifFalse: [ ^ nil ] ].
	self checkClassAndMethodsExist.
	self class
		saveSIconfig: self
		intoClass: self spaceInterface cormasModelClass
		name: self configName value.
	self spaceInterface configName value: self configName value
]

{ #category : #actions }
CMSpaceInterfaceConfig >> setChangeValues [
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self canChangeValues
		at: anEntity
		put: self canChangeValuesCheckBox value
]

{ #category : #actions }
CMSpaceInterfaceConfig >> setManipWholePop [
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self manipWholePop
		at: anEntity
		put: self manipWholePopCheckBox value
]

{ #category : #actions }
CMSpaceInterfaceConfig >> setMoveEntity [
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity ifNil: [^nil].
	self canBeMoved
		at: anEntity
		put: self moveEntityCheckBox value
]

{ #category : #actions }
CMSpaceInterfaceConfig >> setSelectionAsDefaultInfo [
	| aList anEntity |
	self infoMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoInfoSelected ].
	anEntity := self observedEntitiesList selection.
	self infoMethodsList selections size > 1
		ifTrue: [ ^ self alertMessage: self translator tOneInfo ].
	(self isItDefault: self infoMethodsList selections first)
		ifTrue: [ ^ self alertMessage: self tInfoDefault ].
	aList := self infoMethodsList_WithoutDefaultSign list copy.
	self defaultInfo
		at: anEntity
		put: self infoMethodsList selections first.
	aList remove: (self defaultInfo at: anEntity).
	aList add: (self defaultInfo at: anEntity) , ' ->D'.
	aList sort: [ :x :y | x < y ].
	self infoMethodsList
		setList: aList
		selecting: (Array with: (self defaultInfo at: anEntity) , ' ->D')
]

{ #category : #actions }
CMSpaceInterfaceConfig >> setSelectionAsDefaultPov [
	| aList anEntity |
	self povMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoPoVSelected ].
	anEntity := self observedEntitiesList selection.
	self povMethodsList selections size > 1
		ifTrue: [ ^ self alertMessage: self translator tOnePoV ].
	(self isItDefault: self povMethodsList selections first)
		ifTrue: [ ^ self alertMessage: self translator tPoVDefault ].
	aList := self povMethodsList_WithoutDefaultSign list copy.
	self defaultPov
		at: anEntity
		put: self povMethodsList selections first.
	aList remove: (self defaultPov at: anEntity).
	aList add: (self defaultPov at: anEntity) , ' ->D'.
	aList sort: [ :x :y | x < y ].
	self povMethodsList
		setList: aList
		selecting: (Array with: (self defaultPov at: anEntity) , ' ->D')
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> setTrackLength [
	"set the maximum size of the figures' tracks"
	
	(self 
		requestFrom: #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
		message: self translator tAgentTracksSize
		title: 'CORMAS')
			ifNil: [ ^ self ]
			ifNotNil: [ : selectedItem |
				self trackLengthValue: selectedItem.
				self applyTrackLengthValue: selectedItem ]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> siMenuFormat [
	
	^siMenuFormat isNil
		ifTrue: [siMenuFormat := #siMenuFull asValue]
		ifFalse: [siMenuFormat]
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuFull [
	
	self siMenuFormat value: #siMenuFull
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimited [
	
	self siMenuFormat value: #siMenuLimited
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimited2 [
	
	self siMenuFormat value: #siMenuLimited2
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimited2WithHabitus [
	
	self siMenuFormat value: #siMenuLimited2WithHabitus
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimitedWithHabitus [
	
	self siMenuFormat value: #siMenuLimitedWithHabitus
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuNone [
	
	self siMenuFormat value: #siMenuNone
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> spaceInterface [
	
	^spaceInterface
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> spaceInterface: anObject [
	
	spaceInterface := anObject
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toggleShowSingleDefaultInfo [
	
	self isSingleDefaultInfoShown: self isSingleDefaultInfoShown not
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toggleShowSingleDefaultPov [
	
	self isSingleDefaultPovShown: self isSingleDefaultPovShown not
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toggleTouchpadMode [
	
	self isManipulateForTabletEnabled: self isManipulateForTabletEnabled not
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toggleUndoRedo [
	
	self isUndoRedoEnabled: self isUndoRedoEnabled not
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toolCreate [
	
	self defaultTool value: #toolCreate.
	self spaceInterface activateCreateEntityTool
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toolInspect [
	
	self defaultTool value: #toolInspect.
	self spaceInterface activateInspectTool
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toolManipulate [
	
	self defaultTool value: #toolManipulate.
	self spaceInterface activateManipulateTool
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> toolZoom [
	
	self defaultTool value: #toolZoom.
	self spaceInterface activateZoomTool
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> trackAgents: agentClass [
	
	| menu menuSubclass builder |
	menu := ((builder menuAt: #displayOptionsMenu) value atNameKey:
			#trackAgents) submenu menuItemLabeled: agentClass name asString.
	menu isOn
		ifTrue:
			[menu beOff.
			(self trackedAgents includes: agentClass name)
				ifTrue: [self trackedAgents remove: agentClass name]]
		ifFalse:
			[(self observedEntitiesList list includes: agentClass)
				ifFalse:
					[^ self alertMessage: 'The entity ' , agentClass name , ' can not be observed in the current configuration'].
			menu beOn.
			(self trackedAgents includes: agentClass name)
				ifFalse: [self trackedAgents add: agentClass name]].
	self forceSItrackAgents: agentClass.
	agentClass subclasses
		do:
			[:aClass | 
			menuSubclass := ((builder menuAt: #displayOptionsMenu) value atNameKey:
					#trackAgents) submenu menuItemLabeled: aClass name asString.
			menu isOn
				ifTrue:
					[menuSubclass beOn.
					(self trackedAgents includes: aClass name)
						ifFalse: [self trackedAgents add: aClass name]]
				ifFalse:
					[menuSubclass beOff.
					(self trackedAgents includes: aClass name)
						ifTrue: [self trackedAgents remove: aClass name]].
			self forceSItrackAgents: aClass]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> trackLengthValue [
	
	^trackLengthValue
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> trackLengthValue: anObject [
	
	trackLengthValue := anObject
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> trackedAgents [
	
	^trackedAgents ifNil: [trackedAgents := Set new]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> trackedAgents: anObject [
	
	trackedAgents := anObject
]
