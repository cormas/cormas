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

{ #category : #resources }
CMSpaceInterfaceConfig class >> apply [
	
	^ToolbarIconLibrary visualFor: #modificationApply
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> attributesMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #manipEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeAttribute)) #(1) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> createEntityMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #createEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeCreateEntity)) #(1) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> displayOptionsMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #displayOptionsMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Delimitors size' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: '0 pixel' 
			#nameKey: #pixel0 
			#value: #pixel0 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '1 pixel' 
			#nameKey: #pixel1 
			#value: #pixel1 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '2 pixels' 
			#nameKey: #pixel2 
			#value: #pixel2 
			#indication: true 
			#indicationSelector: #delimiterSize) #(MenuItem 
			#rawLabel: '3 pixels' 
			#nameKey: #pixel3 
			#value: #pixel3 
			#indication: true 
			#indicationSelector: #delimiterSize)) #(4) nil)) #(MenuItem 
		#rawLabel: 'Track agents' 
		#nameKey: #trackAgents 
		#indication: false) #(MenuItem 
		#rawLabel: 'Set track length' 
		#value: #setTrackLength) #(MenuItem 
		#rawLabel: 'Default interface tool' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Inspect' 
			#nameKey: #toolInspect 
			#value: #toolInspect 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Manipulate' 
			#nameKey: #toolManipulate 
			#value: #toolManipulate 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Create' 
			#nameKey: #toolCreate 
			#value: #toolCreate 
			#indication: true 
			#indicationSelector: #defaultTool) #(MenuItem 
			#rawLabel: 'Zoom' 
			#nameKey: #toolZoom 
			#value: #toolZoom 
			#indication: true 
			#indicationSelector: #defaultTool)) #(4) nil) 
		#helpText: 'Default tool used when clicking entities in the space interface') #(MenuItem 
		#rawLabel: 'Enable touchpad mode' 
		#nameKey: #toggleTouchpadMode 
		#value: #toggleTouchpadMode 
		#indication: false) #(MenuItem 
		#rawLabel: 'Enable Undo/Redo' 
		#nameKey: #toggleUndoRedo 
		#value: #toggleUndoRedo 
		#indication: true) #(MenuItem 
		#rawLabel: 'Space interface menu bar' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'full menu' 
			#nameKey: #siMenuFull 
			#value: #siMenuFull_apply 
			#indication: true 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, track, Habitus' 
			#nameKey: #siMenuLimitedWithHabitus 
			#value: #siMenuLimitedWithHabitus_apply 
			#indication: false 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, track' 
			#nameKey: #siMenuLimited 
			#value: #siMenuLimited_apply 
			#indication: false 
			#indicationSelector: #siMenuFormat) #(MenuItem 
			#rawLabel: 'pov, info, Habitus' 
			#nameKey: #siMenuLimited2WithHabitus 
			#value: #siMenuLimited2WithHabitus_apply) #(MenuItem 
			#rawLabel: 'pov, info' 
			#nameKey: #siMenuLimited2 
			#value: #siMenuLimited2_apply) #(MenuItem 
			#rawLabel: 'none' 
			#nameKey: #siMenuNone 
			#value: #siMenuNone_apply)) #(6) nil)) #(MenuItem 
		#rawLabel: 'Show single default pov in menu' 
		#nameKey: #toggleShowSingleDefaultPov 
		#value: #toggleShowSingleDefaultPov 
		#indication: true) #(MenuItem 
		#rawLabel: 'Show single default info in menu' 
		#nameKey: #toggleShowSingleDefaultInfo 
		#value: #toggleShowSingleDefaultInfo 
		#indication: true)) #(9) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> infoMethodsMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #infoMethodsMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeInfoMethod) #(MenuItem 
		#rawLabel: 'set as default' 
		#value: #setSelectionAsDefaultInfo) #(MenuItem 
		#rawLabel: 'no default info' 
		#value: #cancelDefaultInfo)) #(2 1) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> load [
	
	^ToolbarIconLibrary visualFor: #fileOpen
]

{ #category : #'save-load' }
CMSpaceInterfaceConfig class >> loadSIconfig: aConfigSpec in: aSIConfig ofModel: aModel [
	
	| stream line aL data collec aClass configElement |
	aSIConfig manipMethods: Dictionary new.
	aSIConfig defaultPov: nil.
	aSIConfig defaultInfo: nil.
	stream := aConfigSpec readStream.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: $*.
			configElement := (line first
				copyFrom: 1
				to: line first size - 1) asSymbol.
			configElement = #configName
				ifTrue: [aSIConfig configName value: line last].
			(#(#observedEntitiesList #manipEntitiesList #createEntitiesList)
				refersToLiteral: configElement)
				ifTrue:
					[aL := List new.
					(Cormas
						splitLine: line last readStream
						sep: $,)
						do:
							[:i | 
							aClass := (Cormas stringAsObjectType: i) class.
							aClass ifNotNil: [aL add: aClass]].
					(aSIConfig perform: configElement) setList: aL selecting: ''].
			(#(#manipMethods #povMethods #attributes #infoMethods #probeMethods)
				refersToLiteral: configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: (data collect: [:m | m asSymbol])]].
			(#(#canBeMoved #manipWholePop #canChangeValues) refersToLiteral:
					configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: (Cormas stringAsObjectType: data first)]].
			(#(#defaultPov #defaultInfo) refersToLiteral: configElement)
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aClass := (Cormas stringAsObjectType: data removeFirst) class.
					aClass
						ifNotNil:
							[(aSIConfig perform: configElement)
								at: aClass
								put: data first asSymbol]].
			configElement = #delimiterSize
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					data removeFirst.
					aSIConfig perform: data first asSymbol].
			configElement = #defaultTool
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aSIConfig perform: data first asSymbol].
			configElement = #siMenuFormat
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					aSIConfig perform: data first asSymbol].
			configElement = #isUndoRedoEnabled
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isUndoRedoEnabled: (Cormas stringAsObjectType: data)].
			configElement = #isManipulateForTabletEnabled
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig
						isManipulateForTabletEnabled: (Cormas stringAsObjectType: data)].
			configElement = #isSingleDefaultPovShown
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isSingleDefaultPovShown: (Cormas stringAsObjectType: data)].
			configElement = #isSingleDefaultInfoShown
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection first.
					aSIConfig isSingleDefaultInfoShown: (Cormas stringAsObjectType: data)].
			configElement = #trackLengthValue
				ifTrue:
					[data := (Cormas
						splitLine: line last readStream
						sep: $,) asOrderedCollection.
					data removeFirst.
					aSIConfig
						applyTrackLengthValue: (Cormas stringAsObjectType: data first)].
			configElement = #trackedAgents
				ifTrue:
					[collec := Set new.
					line size = 1
						ifFalse:
							[(Cormas
								splitLine: line last readStream
								sep: $,)
								do: [:i | collec add: (Cormas stringAsObjectType: i) asSymbol]].
					aSIConfig trackedAgents: collec]].
	stream close
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> manipEntityMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #manipEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeManipEntity)) #(1) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> manipMethodsMenu [
	"Tools.MenuEditor new openOnClass: self andSelector: #manipEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'remove' 
		#value: #removeManipMethod)) #(1) nil) decodeAsLiteralArray
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> minusIcon [
	
	^OpaqueImage
		figure: self removeEntityIconImage
		shape: self removeEntityIconMask
]

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

{ #category : #resources }
CMSpaceInterfaceConfig class >> question [
	
	^ToolbarIconLibrary visualFor: #unknownWidget
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> removeEntityIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 96 0 0 37 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 69 85 85 69 85 0 0 85 112 0 0 53 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0 85 85 85 85 85 85 0 0])
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> removeEntityIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #removeEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 24 @ 14
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 255 192 0 7 255 192 0 7 255 192 0 7 255 192 0 7 255 192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
CMSpaceInterfaceConfig class >> save [
	
	^ToolbarIconLibrary visualFor: #fileSave
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

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> applyTrackLengthValue: value [
	
	| aClass |
	value = 'nil' ifTrue: [^nil].
	TrackFigure maxSize: value.
	self spaceInterface trackedFigureTypes
		do:
			[:symbol | 
			aClass := symbol class.
			(self spaceInterface drawing entityFiguresAt: aClass)
				do:
					[:fig | 
					(fig dependents select: [:tf | tf isKindOf: TrackFigure])
						do:
							[:track | 
							track testAndRemoveOrigine.
							track invalidate]]]
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

{ #category : #'refresh display methods' }
CMSpaceInterfaceConfig >> displayMethodsAndOptionsForManipEntity [
	
	| anEntity |
	anEntity := self manipEntitiesList selection.
	anEntity
		ifNil:
			[self moveEntityCheckBox value: false.
			self manipWholePopCheckBox value: false.
			self canChangeValuesCheckBox value: false.
			^self manipMethodsList
				setList: List new
				selecting: Array new].
	self manipMethodsList
		setList: (self manipMethodsFor: anEntity)
		selecting: Array new.
	anEntity isSituatedClass
		ifTrue:
			[(self builder namedComponents at: #moveEntityCheckBox)
				enable;
				isVisible: true.
			self moveEntityCheckBox value: (self canBeMovedFor: anEntity)]
		ifFalse:
			[(self builder namedComponents at: #moveEntityCheckBox)
				disable;
				isVisible: false].
	self manipWholePopCheckBox value: (self manipWholePopFor: anEntity).
	self canChangeValuesCheckBox value: (self canChangeValuesFor: anEntity)
]

{ #category : #'refresh display methods' }
CMSpaceInterfaceConfig >> displayMethodsForObservedEntity [
	
	| anEntity aPovList aInfoList |
	anEntity := self observedEntitiesList selection.
	anEntity
		ifNil:
			[self povMethodsList
				setList: List new
				selecting: Array new.
			self attributesList
				setList: List new
				selecting: Array new.
			self infoMethodsList
				setList: List new
				selecting: Array new.
			^self probeMethodsList
				setList: List new
				selecting: Array new].	"Prepare list for pov methods which will  include a specific sign for the default pov"
	aPovList := (self povMethodsFor: anEntity) copy.
	(self defaultPovFor: anEntity)
		ifNotNil:
			[aPovList remove: (self defaultPovFor: anEntity).
			aPovList add: (self defaultPov at: anEntity) , ' ->D'.
			aPovList sort: [:x :y | x < y]].	"Prepare list for info  methods which will  include a specific sign for the default info"
	aInfoList := (self infoMethodsFor: anEntity) copy.
	(self defaultInfoFor: anEntity)
		ifNotNil:
			[aInfoList remove: (self defaultInfoFor: anEntity).
			aInfoList add: (self defaultInfo at: anEntity) , ' ->D'.
			aInfoList sort: [:x :y | x < y]].
	self povMethodsList
		setList: aPovList
		selecting: Array new.
	self attributesList
		setList: (self attributesFor: anEntity)
		selecting: Array new.
	self infoMethodsList
		setList: aInfoList
		selecting: Array new.
	self probeMethodsList
		setList: (self probeMethodsFor: anEntity)
		selecting: Array new
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
CMSpaceInterfaceConfig >> forceSItoApplyConfigTrackAgents [
	
	(entitiesList
		sorted: [:a :b | a name asString first > b name asString first])
		do:
			[:agentClass | 
			(agentClass isSituatedClass and: [agentClass inheritsFrom: Agent])
				ifTrue: [self forceSItrackAgents: agentClass]]
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

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> initDisplayOptionsMenu [
	
	| menuDyn agentClasses menuAgents |
	agentClasses := List new.
	agentClasses
		addAll:
			(entitiesList select: [:e | e isSituatedClass and: [e inheritsFrom: Agent]]).
	menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
			#trackAgents.
	menuAgents := Menu new.
	1
		to: agentClasses size
		do:
			[:i | 
			| aClass |
			aClass := agentClasses at: i.
			menuAgents
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuAgents
]

{ #category : #testing }
CMSpaceInterfaceConfig >> isItDefault: aSymbolOrString [
	
	^'* ->D' match: aSymbolOrString
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isManipulateForTabletEnabled [
	
	^isManipulateForTabletEnabled
		ifNil:
			[isManipulateForTabletEnabled := ((builder menuAt: #displayOptionsMenu)
				value atNameKey: #toggleTouchpadMode) isOn]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isManipulateForTabletEnabled: aBoolean [
	
	| menuDyn |
	isManipulateForTabletEnabled := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleTouchpadMode.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	self spaceInterface isManipulateForTabletEnabled = aBoolean
		ifFalse: [self spaceInterface isManipulateForTabletEnabled: aBoolean]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isSingleDefaultInfoShown [
	
	^isSingleDefaultInfoShown
		ifNil:
			[isSingleDefaultInfoShown := builder
				ifNil: [true]
				ifNotNil:
					[:b | 
					((b menuAt: #displayOptionsMenu) value atNameKey:
							#toggleShowSingleDefaultInfo) isOn]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isSingleDefaultInfoShown: aBoolean [
	
	| menuDyn |
	isSingleDefaultInfoShown := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultInfo.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isSingleDefaultPovShown [
	
	^isSingleDefaultPovShown
		ifNil:
			[isSingleDefaultPovShown := builder
				ifNil: [true]
				ifNotNil:
					[:b | 
					((b menuAt: #displayOptionsMenu) value atNameKey:
							#toggleShowSingleDefaultPov) isOn]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isSingleDefaultPovShown: aBoolean [
	
	| menuDyn |
	isSingleDefaultPovShown := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultPov.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isUndoRedoEnabled [
	
	^isUndoRedoEnabled
		ifNil:
			[isUndoRedoEnabled := ((builder menuAt: #displayOptionsMenu) value
				atNameKey: #toggleUndoRedo) isOn]
]

{ #category : #accessing }
CMSpaceInterfaceConfig >> isUndoRedoEnabled: aBoolean [
	
	| menuDyn |
	isUndoRedoEnabled := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey: #toggleUndoRedo.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	self spaceInterface enableUndo = aBoolean
		ifFalse: [self spaceInterface enableUndoOption]
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

{ #category : #'interface opening' }
CMSpaceInterfaceConfig >> open [
	
	self dependents isEmpty
		ifTrue:
			[builder := self allButOpenInterface: #windowSpec.
			builder window
				label:
					builder window label , self spaceInterface basicTitle printString.
			self initDisplayOptionsMenu.
			self setCheckMarksForDisplayOptionsMenu.
			^builder window open]
		ifFalse: [self mainWindow raise]
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

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> setCheckMarksForDisplayOptionsMenu [
	
	| menu menuDyn |
	entitiesList
		do:
			[:agentClass | 
			(agentClass isSituatedClass and: [agentClass inheritsFrom: Agent])
				ifTrue:
					[menu := ((builder menuAt: #displayOptionsMenu) value atNameKey:
							#trackAgents) submenu menuItemLabeled: agentClass name asString.
					(self trackedAgents includes: agentClass name)
						ifFalse: [menu beOff]
						ifTrue: [menu beOn]]].
	isManipulateForTabletEnabled
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleTouchpadMode.
			isManipulateForTabletEnabled
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
		ifNil:
			[self
				isManipulateForTabletEnabled:
					self spaceInterface isManipulateForTabletEnabled].
	isUndoRedoEnabled
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleUndoRedo.
			isUndoRedoEnabled
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
		ifNil: [self isUndoRedoEnabled: self spaceInterface enableUndo].
	isSingleDefaultPovShown
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultPov.
			isSingleDefaultPovShown
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	isSingleDefaultInfoShown
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultInfo.
			isSingleDefaultInfoShown
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
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
CMSpaceInterfaceConfig >> siMenuFull_apply [
	
	self siMenuFull.
	self reopenSI openSIconfig
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
CMSpaceInterfaceConfig >> siMenuLimited2WithHabitus_apply [
	
	self siMenuLimited2WithHabitus.
	self reopenSI openSIconfig
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimited2_apply [
	
	self siMenuLimited2.
	self reopenSI openSIconfig
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimitedWithHabitus [
	
	self siMenuFormat value: #siMenuLimitedWithHabitus
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimitedWithHabitus_apply [
	
	self siMenuLimitedWithHabitus.
	self reopenSI openSIconfig
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuLimited_apply [
	
	self siMenuLimited.
	self reopenSI openSIconfig
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuNone [
	
	self siMenuFormat value: #siMenuNone
]

{ #category : #'menu-display options' }
CMSpaceInterfaceConfig >> siMenuNone_apply [
	
	self siMenuNone.
	self reopenSI openSIconfig
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
