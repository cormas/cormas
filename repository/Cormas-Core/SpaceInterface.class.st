"
close
	super closeAndUnschedule.

	self siCongif ifNotNil:[self siConfig closeAndUnschedule]
"
Class {
	#name : #SpaceInterface,
	#superclass : #Object,
	#instVars : [
		'spaceModel',
		'menuHolder',
		'legend',
		'activeSpatialEntity',
		'basicTitle',
		'delimiterSize',
		'fillDico',
		'povMethodDico',
		'infoMethodDico',
		'trackedFigureTypes',
		'video',
		'zoomInterfaceIsStatic',
		'isTimeTitleDisplayed',
		'isTimeFieldDisplayed',
		'timeField',
		'timeUnitName',
		'manipInstancesController',
		'createInstancesController',
		'entityForManipulation',
		'siConfig',
		'configName',
		'enableUndo'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #resources }
SpaceInterface class >> iconNormal [
	
	^Cursor normal asOpaqueImage
]

{ #category : #resources }
SpaceInterface class >> iconWrite [
	
	^Cursor caret asOpaqueImage
]

{ #category : #'interface specs' }
SpaceInterface class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: #(UserMessage 
				#key: #space 
				#defaultString: 'space') 
			#min: #(Point 10 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 720 531 1062 874) 
			#flags: 4 
			#menu: #menuBar 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 28 0 0 1 0 1) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5734 5734 5734)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 0 0 0 0 0 1 28 0) 
				#flags: 0 
				#component: #toolbar) #(InputFieldSpec 
				#layout: #(LayoutFrame 0 0.333333 4 0 0 0.666666 26 0) 
				#name: #configName 
				#flags: 0 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#model: #configName 
				#tabable: false 
				#isReadOnly: true 
				#type: #text) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -142 1.0 3 0 24 22) 
				#name: #undoButton 
				#model: #undo 
				#tabable: false 
				#helpText: 'Cancel the last manipulation from user' 
				#label: #undoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin -117 1.0 3 0 24 22) 
				#name: #redoButton 
				#model: #redo 
				#tabable: false 
				#helpText: 'Redo the last undo from user' 
				#label: #redoIcon 
				#hasCharacterOrientedLabel: false 
				#style: #pixelSmall 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(InputFieldSpec 
					#layout: #(LayoutSizedOrigin 40 0 1 0 48 21) 
					#name: #timeUnitName 
					#flags: 0 
					#isOpaque: true 
					#model: #timeUnitName 
					#isReadOnly: true) #(InputFieldSpec 
					#layout: #(LayoutFrame 0 0 0 0 41 0 22 0) 
					#name: #timeField 
					#model: #timeField 
					#isReadOnly: true 
					#type: #number 
					#formatString: '0')) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(LayoutSizedOrigin -90 1.0 3 0 88 22) 
					#name: #Composite1)))))
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateCreateEntityTool [
	"Activate the CREATE ENTITY tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'CreateEntity Tool'
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateInspectTool [
	"Activate the INSPECT tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'Inspect Tool'
]

{ #category : #'menu - actions' }
SpaceInterface >> activateLegend [
	
	((self menuHolder value atNameKey: #tools) submenu atNameKey:
			#activateLegend) isOn
		ifTrue:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOff.
			self legend legendes
				do:
					[:leg | leg builder window isOpen ifTrue: [leg builder window unmap]]]
		ifFalse:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOn.
			self legend legendes
				do:
					[:leg | 
					(leg isOpened and: [leg builder window isOpen])
						ifFalse:
							[leg builder window openIn: leg builder window displayBox.
							leg isOpened: true]
						ifTrue: [leg builder window map]]]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateManipulateTool [
	"Activate the MANIPULATE  tool button in the toolbar (hand tool)"
	
	self activateToolNamed: 'Manipulate Tool'
]

{ #category : #'tool hotDraw' }
SpaceInterface >> activateZoomTool [
	"Activate the ZOOM tool button in the toolbar (arrow tool)"
	
	self activateToolNamed: 'Zoom Tool'
]

{ #category : #accessing }
SpaceInterface >> activeSpatialEntity [
	
	activeSpatialEntity isNil
		ifTrue: [activeSpatialEntity := self spaceModel cellClass].
	^activeSpatialEntity
]

{ #category : #accessing }
SpaceInterface >> activeSpatialEntity: aSpatialEntityClass [
	
	activeSpatialEntity := aSpatialEntityClass
]

{ #category : #menus }
SpaceInterface >> adaptMenuForNewShape [
	"adapt the menu"
	
	| menu |
	menu := self menuCellshape.
	spaceModel gridCellShape = #hexagonal
		ifTrue:
			[(menu atNameKey: #fourconnexe) beOff.
			(menu atNameKey: #eightconnexe) beOff.
			(menu atNameKey: #square) beOff.
			(menu atNameKey: #hexagonal) beOn]
		ifFalse:
			[(menu atNameKey: #square) beOn.
			(menu atNameKey: #hexagonal) beOff.
			spaceModel nbNeighbours = #four
				ifTrue:
					[(menu atNameKey: #fourconnexe) beOn.
					(menu atNameKey: #eightconnexe) beOff]
				ifFalse:
					[(menu atNameKey: #fourconnexe) beOff.
					(menu atNameKey: #eightconnexe) beOn]]
]

{ #category : #'menu-info' }
SpaceInterface >> addSubMenuInfoTo: aMenuBuilder from: aListOfClasses [
	"Add a Submenu with: info, track. 
a selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| infoList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			infoList := self siConfig
				ifNil: [aClass availableInfo]
				ifNotNil: [self siConfig infoMethodsForSIMenu: aClass].
			infoList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changeInfo: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]
]

{ #category : #'menu-pov' }
SpaceInterface >> addSubMenuTo: aMenuBuilder from: aListOfClasses [
	"Add a Sub-Menu to a given menu (aMenuBuilder) for the classes.
A  selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| povList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			povList := self siConfig
				ifNil: [aClass availablePov]
				ifNotNil: [self siConfig povMethodsForSIMenu: aClass].
			povList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changePov: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]
]

{ #category : #'user message' }
SpaceInterface >> asynchronousDo: aBlock [
	"execute asynchronously aBlock (usefull for remote work"
	
	^aBlock promise
]

{ #category : #accessing }
SpaceInterface >> basicTitle [
	
	basicTitle ifNil: [self setBasicTitle].
	^basicTitle
]

{ #category : #accessing }
SpaceInterface >> basicTitle: anObject [
	
	basicTitle := anObject
]

{ #category : #menus }
SpaceInterface >> boundariesChanged [
	"gere le menu Forme des cellules "

	| menuCloture |
	self updateWindowName.
	menuCloture := self menuGridboundaries.
	spaceModel closed
		ifTrue: [ "cellules fermees"
			(menuCloture atNameKey: #torroidal) beOff.
			(menuCloture atNameKey: #closed) beOn ]
		ifFalse: [ "cellules toroidales"
			(menuCloture atNameKey: #torroidal) beOn.
			(menuCloture atNameKey: #closed) beOff ]
]

{ #category : #changed }
SpaceInterface >> changeInfo: aSymbol ofEntity: aClass [
	"Called from the user, when an Info has to be displayed"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"on memorise les #infos"
			self infoMethodDico
				at: cl name
				put: aSymbol.
			self drawing changeInfo: aSymbol ofEntity: cl].	"il faut regler aussi le petit onglet du menu"
	self checkInfoMenu.	"change the window title"
	self updateWindowName
]

{ #category : #changed }
SpaceInterface >> changePov: selectorName ofEntity: aClass [
	"Called from the user, when he changes aPoV"
	
	aClass withAllSubclasses
		do:
			[:cl | 
			"self changeInfo: #nil ofEntity: cl. on supprime les info sur les figures"
			"apparement c''est pas n√©cessaire"
			self povMethodDico
				at: cl name
				put: selectorName.	"on memorise les pov"
			self fillDico
				at: cl name
				put: selectorName ~= #nil.
			self legend isOpen
				ifTrue:
					[self legend
						majLegendes:
							(Array
								with: cl
								with: selectorName asString)]].	"on supprime les pov des autres classes spatiales"
	aClass isSpatialClass
		ifTrue:
			[| classes |
			classes := self spatialClasses copy.	"SpatialEntity allSubclasses"
			classes remove: aClass.
			classes
				do:
					[:cl | 
					(cl isElementary and: [selectorName = #delimitors])
						ifFalse:
							[(self povMethodDico at: cl name) = #delimitors
								ifFalse:
									[self povMethodDico
										at: cl name
										put: #nil].
							self fillDico
								at: cl name
								put: false]]].	"il faut regler aussi le petit onglet du menu"
	self checkPovMenu.	"*** finally, change the POV !"
	aClass withAllSubclasses
		do: [:cl | self drawing changePov: selectorName ofEntity: cl].	"change the window title"
	self updateWindowName	"Pas besoin d''un refreshViewDisplay car le updateWindowName force le r√©affichage"
]

{ #category : #'menu-info' }
SpaceInterface >> checkInfoMenu [
	
	self setCheckInfo: self menuInfo
]

{ #category : #'menu-pov' }
SpaceInterface >> checkPovMenu [
	
	self setCheck: self menuPov	"self setCheck: ((self builder bindings at: #menuBar) menuItemAt: 4) submenu."
]

{ #category : #accessing }
SpaceInterface >> classFromSymbol: aSymbol [
	self deprecated: 'Use class method on Symbol instead of classFromSymbol:'.
	^ aSymbol class
]

{ #category : #'menu - actions' }
SpaceInterface >> clicToChange [
	
	self activeSpatialEntity notNil
		ifTrue:
			[self drawing clicToChange.
			self activateInspectTool.
			Cursor caret beCursor]
]

{ #category : #'menu - actions' }
SpaceInterface >> clicToInspect [
	
	self drawing activeAttribute: nil.
	Cursor normal beCursor
]

{ #category : #'menu - actions' }
SpaceInterface >> closed [
	spaceModel closed
		ifFalse: [ spaceModel closed: true.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged ]
]

{ #category : #aspects }
SpaceInterface >> configName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^configName isNil
		ifTrue: [configName := Text new asValue]
		ifFalse: [configName]
]

{ #category : #initialisation }
SpaceInterface >> copyPovFrom: parentInterface [
	
	self spaceModel: parentInterface spaceModel.
	self activeSpatialEntity: parentInterface activeSpatialEntity.
	delimiterSize := parentInterface delimiterSize copy.
	fillDico := parentInterface fillDico copy.
	povMethodDico := parentInterface povMethodDico copy.
	infoMethodDico := parentInterface infoMethodDico copy.
	isTimeTitleDisplayed := parentInterface isTimeTitleDisplayed.
	isTimeFieldDisplayed := parentInterface isTimeFieldDisplayed
]

{ #category : #accessing }
SpaceInterface >> cormas [
	
	^self spaceModel cormas
]

{ #category : #accessing }
SpaceInterface >> cormasModel [
	
	^self spaceModel cormasModel
]

{ #category : #accessing }
SpaceInterface >> cormasModelClass [
	
	^self spaceModel cormasModelClass
]

{ #category : #accessing }
SpaceInterface >> createInstancesController [
	
	^createInstancesController
]

{ #category : #accessing }
SpaceInterface >> createInstancesController: anObject [
	
	anObject ifNil: [self activateInspectTool].
	createInstancesController := anObject
]

{ #category : #'tool hotDraw' }
SpaceInterface >> currentTool [
	"get the HotDraw Tool of the grid"
	
	^self view controller currentTool
]

{ #category : #delimiteur }
SpaceInterface >> delimiterSize [
	
	^delimiterSize isNil
		ifTrue: [delimiterSize := #pixel1 asValue]
		ifFalse: [delimiterSize]
]

{ #category : #display }
SpaceInterface >> displayArc: anOccupantReference on: parameter [
	
	| aSelector startCellReference stopCellReference aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	startCellReference := parameter key.
	stopCellReference := parameter value.
	newPov entityReference: anOccupantReference.
	self drawing addFigureForArcPov: newPov start: startCellReference end:
			stopCellReference
]

{ #category : #display }
SpaceInterface >> displayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef [
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| aClass selectorName infoName |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	infoName := self infoMethodDicoAt: aClass.
	self drawing loadFigureCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef povSelector: selectorName andInfo: infoName
]

{ #category : #display }
SpaceInterface >> displayCompoundSpatialEntityClass: aClass [
	"Called when 
	- the grid size has been modified 
	- a new instance of SpaceInterface is opened
	- the compoundSpatialEntities of aClass are created"
	
	| selectorName |
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing loadFiguresFrom: aClass povSelector: selectorName
]

{ #category : #display }
SpaceInterface >> displayOccupant: anOccupantReference on: aESEreference [
	
	| aSelector aInfoName newPov |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	aInfoName := self infoMethodDicoAt: anOccupantReference entityClass.	"anOccupant center: aSpatialEntity defaultPOV bounds origin."	"the position will be defined later"
	newPov := anOccupantReference entityClass
		createEntityPOVwithSpec:
			(anOccupantReference entity getPovSpecForSelector: aSelector andInfo:
					aInfoName).
	newPov entityReference: anOccupantReference.
	self drawing addFigureForOccupantPov: newPov on: aESEreference
]

{ #category : #'drawing description' }
SpaceInterface >> displayTimeField [
	"the simulation time is displayed in the field"
	
	| timeStep timeFieldMenu |
	timeFieldMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeField.
	self isTimeFieldDisplayed: self isTimeFieldDisplayed not.
	self isTimeFieldDisplayed
		ifTrue:
			[(self builder componentAt: #timeUnitName) beVisible.
			(self builder componentAt: #timeField) beVisible.
			timeStep := spaceModel cormasModel timeStep.
			self timeField value: timeStep.
			timeFieldMenu beOn]
		ifFalse:
			[(self builder componentAt: #timeUnitName) beInvisible.
			(self builder componentAt: #timeField) beInvisible.
			timeFieldMenu beOff]
]

{ #category : #'drawing description' }
SpaceInterface >> displayTimeTitle [
	"the simulation time is displayed in the title of the window"
	
	| timeStep timeTitleMenu |
	timeTitleMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeTitle.
	self isTimeTitleDisplayed: self isTimeTitleDisplayed not.
	self isTimeTitleDisplayed
		ifTrue:
			[timeStep := spaceModel cormasModel timeStepWithUnit.
			self builder window label: self basicTitle , '  Time: ' , timeStep.
			timeTitleMenu beOn]
		ifFalse:
			[self builder window label: self basicTitle.
			timeTitleMenu beOff]
]

{ #category : #'menu - actions' }
SpaceInterface >> eightconnexe [
	
	self spaceModel eightconnexe
]

{ #category : #accessing }
SpaceInterface >> enableUndo [
	
	^enableUndo ifNil: [enableUndo := true]
]

{ #category : #accessing }
SpaceInterface >> enableUndo: anObject [
	
	enableUndo := anObject
]

{ #category : #'undo/redo' }
SpaceInterface >> enableUndoOption [
	"Enable (desable) redo, and display (hide) the Redo/Undo buttons"
	
	self enableUndo: self enableUndo not.
	self enableUndo
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOn.
			(self builder componentAt: #undoButton)
				beVisible;
				enable.
			(self builder componentAt: #redoButton)
				beVisible;
				enable]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOff.
			(self builder componentAt: #undoButton) beInvisible.
			(self builder componentAt: #redoButton) beInvisible]
]

{ #category : #accessing }
SpaceInterface >> entityForManipulation [
	
	^entityForManipulation
]

{ #category : #accessing }
SpaceInterface >> entityForManipulation: anObject [
	
	entityForManipulation := anObject
]

{ #category : #accessing }
SpaceInterface >> fillDico [
	"a Dictionary containing #Class name -> true or false"
	
	^fillDico ifNil: [fillDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> fillDico: anObject [
	
	fillDico := anObject
]

{ #category : #'menu-pov' }
SpaceInterface >> fillDicoAt: aClass [
	
	^self fillDico
		at: aClass name
		ifAbsentPut: [true]
]

{ #category : #'menu - actions' }
SpaceInterface >> fourconnexe [
	
	self spaceModel fourconnexe
]

{ #category : #'menu - actions' }
SpaceInterface >> hexagonal [
	
	self spaceModel hexagonal
]

{ #category : #accessing }
SpaceInterface >> infoMethodDico [
	"a Dictionary containing #Class name -> #infoSelector"
	
	^infoMethodDico ifNil: [infoMethodDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> infoMethodDico: anObject [
	
	infoMethodDico := anObject
]

{ #category : #'menu-info' }
SpaceInterface >> infoMethodDicoAt: aClass [
	
	^self infoMethodDico
		at: aClass name
		ifAbsentPut: [#nil]
]

{ #category : #menus }
SpaceInterface >> initMenuTopologie [
	
	self adaptMenuForNewShape.
	self boundariesChanged
]

{ #category : #testing }
SpaceInterface >> isForHabitus: aString [
	"true if the receiver has a SIConfig with name aString"
	
	^self siConfig
		ifNil: [false]
		ifNotNil: [:si | si configName value = aString]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> isManipulateForTabletEnabled [
	
	^((self menuHolder value atNameKey: #option) submenu atNameKey:
			#isManipulateForTabletEnabled) isOn
]

{ #category : #'tool hotDraw' }
SpaceInterface >> isManipulateForTabletEnabled: aBoolean [
	
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOff]
]

{ #category : #accessing }
SpaceInterface >> isTimeFieldDisplayed [
	
	^isTimeFieldDisplayed ifNil: [isTimeFieldDisplayed := true]
]

{ #category : #accessing }
SpaceInterface >> isTimeFieldDisplayed: anObject [
	
	isTimeFieldDisplayed := anObject
]

{ #category : #accessing }
SpaceInterface >> isTimeTitleDisplayed [
	
	^isTimeTitleDisplayed ifNil: [isTimeTitleDisplayed := true]
]

{ #category : #accessing }
SpaceInterface >> isTimeTitleDisplayed: anObject [
	
	isTimeTitleDisplayed := anObject
]

{ #category : #accessing }
SpaceInterface >> legend [
	
	^legend
		ifNil:
			[self initLegend.
			legend]
]

{ #category : #accessing }
SpaceInterface >> legend: anObject [
	
	legend := anObject
]

{ #category : #changed }
SpaceInterface >> listMethodsChanged [
	"some methods has changed. Rebuild the menu (added while removing the spaceInterfaces from cormas)"
	
	self spaceModel ifNotNil: [self initMenuPov]
]

{ #category : #accessing }
SpaceInterface >> manipInstancesController [
	
	^manipInstancesController
]

{ #category : #accessing }
SpaceInterface >> manipInstancesController: anObject [
	
	manipInstancesController := anObject
]

{ #category : #'menus-access' }
SpaceInterface >> menuBar [
	
	| menu siMenuFormat submenu labelsKept |
	siMenuFormat := self siConfig ifNotNil: [:sic | sic siMenuFormat value].
	(siMenuFormat isNil or: [siMenuFormat = #siMenuFull])
		ifTrue: [^self class menuBar]
		ifFalse:
			[menu := self class menuBar.
			labelsKept := OrderedCollection new.
			siMenuFormat ~= #siMenuNone
				ifTrue:
					[labelsKept
						add: 'PoV';
						add: 'Display'].
			(#(#siMenuLimitedWithHabitus #siMenuLimited2WithHabitus) includes:
					siMenuFormat) ifTrue: [labelsKept add: 'Tools'].
			menu labels
				do:
					[:lab | 
					(labelsKept includes: lab)
						ifFalse: [menu hideItem: (menu menuItemLabeled: lab)]
						ifTrue:
							[submenu := (menu menuItemLabeled: lab) submenu.
							(submenu labels includes: 'Habitus')
								ifTrue:
									[submenu labels
										do:
											[:slab | 
											slab ~= 'Habitus'
												ifTrue: [submenu hideItem: (submenu menuItemLabeled: slab)]]].
							(submenu labels includes: 'Spatial delimitor')
								ifTrue:
									[submenu hideItem: (submenu menuItemLabeled: 'Spatial delimitor').
									submenu hideItem: (submenu menuItemLabeled: 'Time').
									submenu hideItem: (submenu menuItemLabeled: 'BackGround').
									(#(#siMenuLimited2 #siMenuLimited2WithHabitus) includes:
											siMenuFormat)
										ifTrue: [submenu hideItem: (submenu menuItemLabeled: 'track')]]]].
			^menu]
]

{ #category : #'menus-access' }
SpaceInterface >> menuCellshape [
	
	| menuModify |
	menuModify := self menuModify.
	^(menuModify atNameKey: #cellshape) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuGridboundaries [
	
	| menuModify |
	menuModify := self menuModify.
	^(menuModify atNameKey: #gridboundaries) submenu
]

{ #category : #accessing }
SpaceInterface >> menuHolder [
	
	^menuHolder
]

{ #category : #'menus-access' }
SpaceInterface >> menuInfo [
	"return a Menu : #info menu"
	
	^(self menuHolder value atNameKey: #info) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuModify [
	
	| menuFile |
	menuFile := (self menuHolder value atNameKey: #environment) submenu.
	^(menuFile atNameKey: #modify) submenu
]

{ #category : #'menus-access' }
SpaceInterface >> menuPov [
	"return a Menu : #pov menu"
	
	^(self menuHolder value atNameKey: #pov) submenu
]

{ #category : #display }
SpaceInterface >> moveArcStart: aArcRef to: aCellRef [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStart: aArcRef to: aCellRef
]

{ #category : #display }
SpaceInterface >> moveArcStop: aArcRef to: stopCellReference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStop: aArcRef to: stopCellReference
]

{ #category : #display }
SpaceInterface >> moveOccupant: anOccupantReference on: aESEreference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveOccupant: anOccupantReference on: aESEreference
]

{ #category : #'menu - actions' }
SpaceInterface >> moveableZoom [
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: false.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOff.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOn
]

{ #category : #menus }
SpaceInterface >> notYiet [
	
	^self cormas warn: 'Sorry, not yet ready'
]

{ #category : #updating }
SpaceInterface >> noticeEntityChange: anEntityChange [
	
	| changeType anEntityReference parameter |
	changeType := anEntityChange symbol.
	anEntityReference := anEntityChange entity.
	parameter := anEntityChange parameter.
	changeType = #valueChanged
		ifTrue:
			[^parameter
				ifNil: [self updateEntity: anEntityReference]
				ifNotNil: [:p | self updateEntity: anEntityReference onPatch: p]].
	changeType = #movingOccupant
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #newOccupant
		ifTrue: [^self displayOccupant: anEntityReference on: parameter].
	changeType = #removeEntity ifTrue: [^self removeEntity: anEntityReference].
	changeType = #leavingOccupant
		ifTrue: [^self removeOccupant: anEntityReference].
	changeType = #newArc
		ifTrue: [^self displayArc: anEntityReference on: parameter].
	changeType = #movingArc
		ifTrue: [^self moveOccupant: anEntityReference on: parameter].
	changeType = #addAggregate
		ifTrue:
			[^self displayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #compositionChanged
		ifTrue:
			[^self redisplayCompoundSpatialEntity: anEntityReference withComponents:
					parameter].
	changeType = #newStartPosition
		ifTrue: [^self moveArcStart: anEntityReference to: parameter].
	changeType = #newStopPosition
		ifTrue: [^self moveArcStop: anEntityReference to: parameter].
	changeType = #povSymbolChanged
		ifTrue: [^self updateEntity: anEntityReference ifPovNameIs: parameter].
	changeType = #flash
		ifTrue:
			[^self drawing flashColor: parameter entityReference: anEntityReference]
]

{ #category : #'interface closing' }
SpaceInterface >> noticeOfWindowClose: aWindow [
	"The ApplicationWindow aWindow is in the process of closing. 
	You have been notified."
	
	self changed: #windowClosed
]

{ #category : #'classes list for menu' }
SpaceInterface >> passiveClassesForMenu: aMenuName [
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of the LocatedObjects classes of the model for which a pov has been defined"
	
	| methodName |
	self siConfig
		ifNil:
			[^self cormasModelClass visualizedClasses
				select: [:e | self cormasModelClass locatedObjectClasses includes: e]]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: CMPassiveObject]
]

{ #category : #delimiteur }
SpaceInterface >> pixel0 [
	
	self delimiterSize value: #pixel0.
	self view delimiter: 0
]

{ #category : #delimiteur }
SpaceInterface >> pixel1 [
	
	self delimiterSize value: #pixel1.
	self view delimiter: 1
]

{ #category : #delimiteur }
SpaceInterface >> pixel2 [
	
	self delimiterSize value: #pixel2.
	self view delimiter: 2
]

{ #category : #delimiteur }
SpaceInterface >> pixel3 [
	
	self delimiterSize value: #pixel3.
	self view delimiter: 3
]

{ #category : #accessing }
SpaceInterface >> povMethodDico [
	"a Dictionary containing #Class name -> #povSelector"
	
	^povMethodDico ifNil: [povMethodDico := Dictionary new]
]

{ #category : #accessing }
SpaceInterface >> povMethodDico: anObject [
	
	povMethodDico := anObject
]

{ #category : #'menu-pov' }
SpaceInterface >> povMethodDicoAt: aClass [
	
	^self povMethodDico
		at: aClass name
		ifAbsentPut: [#nil]
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povOfCompoundSpatialEntity: aSpatialEntityRef withComponents: componentsRef forSelector: povSelector andInfo: aInfoName [
	"creating the pov of a spatialEntity"
	
	| aPov componentsPovs defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	componentsPovs := OrderedCollection new.
	componentsRef
		do:
			[:ref | 
			componentsPovs
				add: (self spaceModel elementaryEntitiesDefaultPovs at: ref entityId)].
	aPov := aClass createEntityPOVwithSpec: povSpec componentsPovs:
			componentsPovs.
	aPov entityReference: aSpatialEntityRef.
	^aPov
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povOfElementarySpatialEntity: aSpatialEntityRef forSelector: povSelector andInfo: aInfoName [
	"creating the pov of a spatialEntity"
	
	| aPov defaultPov povSpec aClass |
	defaultPov := self spaceModel elementaryEntitiesDefaultPovs
		at: aSpatialEntityRef entityId.	"clientSpaceModel also defines it"
	povSelector = #povClassName ifTrue: [^defaultPov].
	povSpec := aSpatialEntityRef entity getPovSpecForSelector: povSelector
		andInfo: aInfoName.
	aClass := aSpatialEntityRef entityClass.
	aPov := aClass createEntityPOVwithSpec: povSpec defaultPov: defaultPov.
	aPov entityReference: aSpatialEntityRef.
	^aPov
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsAndPatchesOfArcEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for arc entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aStartPatchEntityReference aEndPatchEntityReference |
	data := self spaceModel getPovsDataOfArcEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aStartPatchEntityReference := r at: 3.
			aEndPatchEntityReference := r at: 4.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches
				add:
					(Array with: aPov with: aStartPatchEntityReference with:
							aEndPatchEntityReference)].
	^povsAndPatches
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsAndPatchesOfOccupantEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aPatchEntityReference |
	data := self spaceModel getPovsDataOfOccupantEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aPatchEntityReference := r at: 3.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches add: aPov -> aPatchEntityReference].
	^povsAndPatches
]

{ #category : #'accessing - entities pov' }
SpaceInterface >> povsOfSpatialEntity: aClass forSelector: povSelector andInfo: aInfoName [
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| povs i aPov data aEntityReference aPovSpec componentsPovs |
	data := self spaceModel getPovsDataOfEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povs := OrderedCollection new.
	aClass isElementary
		ifTrue:
			[i := 0.
			data
				do:
					[:d | 
					i := i + 1.
					self spaceModel elementaryEntitiesDefaultPovs size < i
						ifFalse:
							[aEntityReference := d key.
							aPovSpec := d value.
							aPov := aClass
								createEntityPOVwithSpec: aPovSpec
								defaultPov: (self spaceModel elementaryEntitiesDefaultPovs at: i).	"clientSpaceModel also defines it"
							aPov entityReference: aEntityReference.
							povs add: aPov]]]
		ifFalse:
			[data
				do:
					[:d | 
					aEntityReference := d key.
					aPovSpec := d value.
					componentsPovs := OrderedCollection new.
					aPovSpec elementaryComponentsId
						do:
							[:compId | 
							componentsPovs
								add: (self spaceModel elementaryEntitiesDefaultPovs at: compId)].	"clientSpaceModel also defines it"
					aPov := aClass createEntityPOVwithSpec: aPovSpec componentsPovs:
							componentsPovs.
					aPov entityReference: aEntityReference.
					povs add: aPov]].
	^povs
]

{ #category : #display }
SpaceInterface >> redisplayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef [
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| selectorName aClass |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing redisplayCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef
]

{ #category : #'undo/redo' }
SpaceInterface >> redo [
	"reload the last redo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager redo
]

{ #category : #updating }
SpaceInterface >> registerInto: aCollection forHabitus: habitusName [
	"register the receiver into aCollection if it has the habitusName
	always registrer if habitusName is nil"
	
	(habitusName isNil or: [self isForHabitus: habitusName])
		ifTrue: [aCollection add: self]
]

{ #category : #display }
SpaceInterface >> removeEntity: aEntityRef [
	
	| aSelector |
	aSelector := self povMethodDicoAt: aEntityRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeEntity: aEntityRef.
	Cormas refresh: self
]

{ #category : #display }
SpaceInterface >> removeOccupant: anOccupantReference [
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeOccupant: anOccupantReference
]

{ #category : #'menu - actions' }
SpaceInterface >> reopenWithSameHabitus [
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
]

{ #category : #'menu - actions' }
SpaceInterface >> saveGridMapInfo [
	
	self spaceModel saveGridMapInfo
]

{ #category : #delimiteur }
SpaceInterface >> selectColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self view delimiterColor: color
]

{ #category : #background }
SpaceInterface >> setBackGroundColor [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self drawing backgroundFillColor: color.
	self changed
]

{ #category : #'drawing description' }
SpaceInterface >> setBasicTitle [
	"Set the title of the grid window"
	
	| pov prefix |
	self spaceModel ifNil: [^nil].
	prefix := self spaceModel envSpecStringFor: self activeSpatialEntity name.
	pov := self activeSpatialEntity name asString , ' -> '
		, (self povMethodDicoAt: self activeSpatialEntity) asString.
	basicTitle := prefix , pov
]

{ #category : #'menu-pov' }
SpaceInterface >> setCheck: unMenu [
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := item label class.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self povMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
]

{ #category : #'menu-info' }
SpaceInterface >> setCheckInfo: unMenu [
	
	| class |
	self cormasModel
		ifNotNil:
			[unMenu menuItems
				do:
					[:item | 
					class := item label class.
					item submenu menuItems
						do:
							[:subItem | 
							subItem label = (self infoMethodDicoAt: class) asString
								ifTrue: [subItem beOn]
								ifFalse: [subItem beOff]]]].
	^unMenu
]

{ #category : #'manipulate instances' }
SpaceInterface >> setEntityForManipulationToDefault [
	
	self entityForManipulation: #any
]

{ #category : #menus }
SpaceInterface >> setMenuHolder [
	"Set the Menu of the grid"
	
	menuHolder := self builder menuAt: #menuBar.	"menuHolder := self class menuBar asValue."
	self initMenuTopologie.
	self initMenuPov.
	self initMenuInfo.	"self initMenuDelimitor. A faire..."
	self initMenuAttributs.
	self initMenuTrack
]

{ #category : #initialisation }
SpaceInterface >> setSpaceModel: aModel [
	"Set the receiver's model to be aModel."
	
	spaceModel == aModel ifTrue: [^self].
	spaceModel ifNotNil: [spaceModel removeDependent: self].
	spaceModel := aModel.
	spaceModel ifNotNil: [spaceModel addDependent: self]
]

{ #category : #accessing }
SpaceInterface >> siConfig [
	
	^siConfig
]

{ #category : #accessing }
SpaceInterface >> siConfig: anObject [
	
	siConfig := anObject
]

{ #category : #accessing }
SpaceInterface >> spaceModel [
	
	^spaceModel
]

{ #category : #accessing }
SpaceInterface >> spaceModel: aModel [
	"Set the receiver's model to aModel."
	
	self setSpaceModel: aModel	"self drawing setSpaceModel: aModel"
]

{ #category : #accessing }
SpaceInterface >> spatialClasses [
	
	^self spaceModel spatialClasses
]

{ #category : #'classes list for menu' }
SpaceInterface >> spatialClassesForMenu: aMenuName [
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of all the spatial classes of the model,  even if no pov has been defined"
	
	| methodName |
	self siConfig
		ifNil: [^self spaceModel spatialClasses]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: CMSpatialEntity]
]

{ #category : #'grid recorder' }
SpaceInterface >> spatialGridArea [
	
	^self builder window displayBox
]

{ #category : #'menu - actions' }
SpaceInterface >> squared [
	"model patchShape ~= #squared ifTrue: 
			[model patchShape: #squared.
			model nbNeighbours: #four.
			model createCells.
			model createCellsImages.
			model displayOn: model vue graphicsContext.
			model displayOn: model vue buffer graphicsContext.
			self shapeChanged]"
	
	
]

{ #category : #'undo/redo' }
SpaceInterface >> storeBeforeManipulation [
	"Store the whole state of the current model as BOS file. This is done before manipulation from the user, in order to enable Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager storeBeforeManipulation
]

{ #category : #'drawing description' }
SpaceInterface >> timeChanged [
	"the simulation time has changed. I update the title of the window and the linked interfaces"
	
	| timeStep |
	spaceModel ifNil: [^nil].
	timeStep := spaceModel timeStep.
	self isTimeTitleDisplayed
		ifTrue:
			[self builder window
				label:
					self basicTitle , '  Time: ' , timeStep printString , ' '
						, self timeUnitName value].
	self isTimeFieldDisplayed ifTrue: [self timeField value: timeStep].
	self changed: #timeChanged
]

{ #category : #aspects }
SpaceInterface >> timeField [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^timeField isNil
		ifTrue: [timeField := 0 asValue]
		ifFalse: [timeField]
]

{ #category : #aspects }
SpaceInterface >> timeUnitName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^timeUnitName isNil
		ifTrue:
			[timeUnitName := spaceModel isNil
				ifTrue: ['steps']
				ifFalse: [spaceModel timeUnitName asValue]]
		ifFalse: [timeUnitName]
]

{ #category : #'tool hotDraw' }
SpaceInterface >> toggleManipulateForTablet [
	
	self isManipulateForTabletEnabled: self isManipulateForTabletEnabled not
]

{ #category : #'tool hotDraw' }
SpaceInterface >> toolNames [
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar.
	To each name (String), an icon should be associated at the class level and an initializeTool method should be design at the level of Tool class (these methods must be draged into Cormas Package)
	Ex: 'Inspect Tool'  -> inspectIcon -> initializeInspectTool
		'Manipulate Tool'  -> manipulateIcon -> initializeManipulateTool
		'Zoom Tool' -> zoomIcon -> initializeZoomTool"
	
	^#('Inspect Tool' 'Manipulate Tool' 'ChangeAttribute Tool' 'CreateEntity Tool' 'Zoom Tool' nil)
]

{ #category : #'menu - actions' }
SpaceInterface >> torroidal [
	spaceModel closed
		ifTrue: [ spaceModel closed: true.
			spaceModel
				initNeighbourhood;
				initEdge.
			self boundariesChanged ]
]

{ #category : #'menu-track' }
SpaceInterface >> trackAgents: agentClass [
	
	| agentFigures menu |
	agentClass withAllSubclasses
		do:
			[:aClass | 
			agentFigures := #().
			(self drawing entityFigures
				at: aClass
				ifAbsent: [nil])
				ifNotNil:
					[agentFigures := (self drawing entityFigures at: aClass) values].
			menu := (self menuHolder value atNameKey: #trackAgents) submenu
				menuItemLabeled: aClass name asString.
			menu isOn
				ifTrue:
					[menu beOff.
					self trackedFigureTypes
						remove: aClass name
						ifAbsent: [nil].
					agentFigures do: [:af | af untrack]]
				ifFalse:
					[menu beOn.
					self trackedFigureTypes add: aClass name.
					agentFigures do: [:af | af track]]]
]

{ #category : #accessing }
SpaceInterface >> trackedFigureTypes [
	"a Collection containing #Class name of the tracked Entities"
	
	^trackedFigureTypes ifNil: [trackedFigureTypes := OrderedCollection new]
]

{ #category : #'undo/redo' }
SpaceInterface >> undo [
	"reload the last undo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager undo
]

{ #category : #'menu - actions' }
SpaceInterface >> unmoveableZoom [
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: true.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOn.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOff
]

{ #category : #'manipulate instances' }
SpaceInterface >> updateEntitiesSelectionWith: collecOfFigures lastFigureSelected: aFigure [
	
	self manipInstancesController ifNil: [^nil].
	self manipInstancesController
		updateInstancesSelectionWith:
			(collecOfFigures collect: [:f | f model entity])
		lastSelected: aFigure model entity
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference ifPovNameIs: aPovName [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference
		ifPovNameIs: aPovName
]

{ #category : #display }
SpaceInterface >> updateEntity: anEntityReference onPatch: aPatchEntityReference [
	"Called from the spaceModel to update one entity that received a changed message
	If the spaceInterface settings allow the visualiation of that entityClass (aSelector is not nil), then it asks the corresponding figure to update according to its own povSpec (which may be different from the povSpec specified by the sapceInterface for that entityClass "
	
	| aSelector |
	aSelector := self povMethodDicoAt: anEntityReference entityClass.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	self drawing updateFigureForEntityReference: anEntityReference onPatch:
			aPatchEntityReference
]

{ #category : #'drawing description' }
SpaceInterface >> updateWindowName [
	"Set the title of the grid window"
	
	self setBasicTitle.
	self builder window label: self basicTitle.
	self timeChanged
]

{ #category : #'grid recorder' }
SpaceInterface >> video: nilOrFilename [
	
	nilOrFilename isNil
		ifTrue:
			[video := nil.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOff]
		ifFalse:
			[video := nilOrFilename asFilename.
			((self menuHolder value atNameKey: #tools) submenu atNameKey: #video)
				beOn]
]

{ #category : #accessing }
SpaceInterface >> view [
	
	^self drawing
]

{ #category : #'drawing description' }
SpaceInterface >> windowName [
	"What should our window label be?"
	
	^'Cormas Space'
]

{ #category : #accessing }
SpaceInterface >> zoomInterfaceIsStatic [
	
	^zoomInterfaceIsStatic ifNil: [zoomInterfaceIsStatic := true]
]

{ #category : #accessing }
SpaceInterface >> zoomInterfaceIsStatic: anObject [
	
	zoomInterfaceIsStatic := anObject
]
