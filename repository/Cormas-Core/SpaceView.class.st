Class {
	#name : #SpaceView,
	#superclass : #Object,
	#instVars : [
		'entityFigures',
		'activeAttributeValue',
		'activeAttribute',
		'oldBounds',
		'delimiter',
		'delimiterColor',
		'figuresByReference',
		'manipulatedEntity',
		'manipulationAction',
		'manipulationActionArguments',
		'backgroundFillColor'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #accessing }
SpaceView >> activeAttribute [
	
	^activeAttribute
]

{ #category : #accessing }
SpaceView >> activeAttribute: anObject [
	
	activeAttribute := anObject
]

{ #category : #accessing }
SpaceView >> activeAttributeValue [
	
	^activeAttributeValue
]

{ #category : #accessing }
SpaceView >> activeAttributeValue: anObject [
	
	activeAttributeValue := anObject
]

{ #category : #adapting }
SpaceView >> adaptComponentsForNewBounds [
	| scaleFactor |
	scaleFactor := self preferredBounds extent / self oldBounds extent.	"- (1@0)"	"scaleFactor := self bounds extent / oldBounds extent."	"scaleFactor := self bounds extent / container bounds extent."
	self components
		do: [ :aFigure | aFigure scaleByWithConstraints: scaleFactor ].	"When the grid size has changed, the BitmapFigure have to be placed at the right place"
	((self components
		select:
			[ :aFigure | (aFigure isKindOf: BitmapFigure) or: [ aFigure isDistortable not ] ])
		collect: [ :fig | fig entityType ])
		do: [ :aClass | 
			self
				changePov: (self model povMethodDico at: aClass name)
				ofEntity: aClass ].	"	(((self components select: [:aFigure | aFigure isBitmapFigure]) 
		collect: [:fig | fig entityType]) asSet) do: 
				[:aClass | 
				self changePov: (self model povMethodDico at: aClass name) ofEntity: aClass]."
	self flag:#TODO.
			"C''est incroyable √ßa (le change pov au dessus). il doit y a voir un moyen de replacer le bitmap figure au bonne endroit sans etre oblig√© de les reconstruire."
				"	self invalidateNow.
	(Dialog confirm: 'Fit Window to the SpaceModel?') ifTrue:[self model resizeWindow]"
]

{ #category : #adapting }
SpaceView >> adaptFigure: aFigure [
	"scaleFactor := self bounds extent / self model spaceModel absoluteBounds extent."
	
	^aFigure scaleByWithConstraints: self scaleFactor
]

{ #category : #adding }
SpaceView >> add: aFigure [
	
	self registerFigure: aFigure.
	^super add: aFigure
]

{ #category : #'adding-removing' }
SpaceView >> addFigure: aFigure [
	"Add aFigure, adapted to my bounds"
	
	aFigure isDistortable
		ifFalse:
			[| sf |
			sf := self scaleFactor.
			sf := (sf x min: sf y) @ (sf x min: sf y).
			aFigure scaleBy: sf].
	^self add: (self adaptFigure: aFigure)
]

{ #category : #'adding-removing' }
SpaceView >> addFigureForArcPov: arcPov start: startCellReference end: endCellReference [
	"Add the Figures of the Arc POV.
ArcFigures are located on the center of the startCell and the stopCell (even if it is not loaded)
returns the figure created"
	
	| origin arcFig final startCell |
	startCell := self spaceModel elementaryEntitiesDefaultPovs
		at: startCellReference entityId.
	origin := startCell center.
	final := (self spaceModel elementaryEntitiesDefaultPovs
		at: endCellReference entityId) center.
	arcFig := arcPov asFigure.
	arcFig start: origin stop: final.
	origin = final ifTrue: [arcFig addTwoPointOutside: startCell bounds].
	self addFigure: arcFig.
	arcPov infoName = #nil ifFalse: [arcFig setTextFor: arcPov infoResult].
	self entityFiguresAt: arcPov put: arcFig.
	^arcFig
]

{ #category : #'adding-removing' }
SpaceView >> addFigureForOccupantPov: aPov on: aESERef [
	"Add the Figures of the Agent's POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded
returns the figure created"
	
	| aFig absolutePoint absolutePatchBounds |
	absolutePatchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESERef entityId) bounds.
	aFig := aPov asFigure.
	self addFigure: aFig.
	absolutePoint := aFig calculateNewPositionOnPatchBounds:
			absolutePatchBounds.
	aFig moveTo: absolutePoint.
	aPov infoName = #nil ifFalse: [aFig setText: aPov infoResult].
	(self model trackedFigureTypes
		includes: aPov entityReference entityClass name) ifTrue: [aFig track].	"store the image association"
	self entityFiguresAt: aPov put: aFig.
	^aFig
]

{ #category : #'adding-removing' }
SpaceView >> addFigureForSpatialPov: aPOV [
	"Add a copy of aPOV as a new Figure, adapted to my bounds.
The CloneFig is dependent of aPOV, its model
The method returns the added figure"
	
	| aFig |
	aFig := aPOV asFigure.
	self addFigure: aFig.
	(aPOV name ~= #nil and: [aPOV infoName ~= #nil])
		ifTrue: [aFig setText: aPOV infoResult].
	^aFig
]

{ #category : #'adding-removing' }
SpaceView >> addFiguresForArcPovsAndPatches: aCollectionOfPovAndPatch [
	"Add the Figures of the Arc' POV."
	
	| aPov startPatchRef endPatchRef |
	^aCollectionOfPovAndPatch
		do:
			[:anArray | 
			aPov := anArray at: 1.
			startPatchRef := anArray at: 2.
			endPatchRef := anArray at: 3.
			self addFigureForArcPov: aPov start: startPatchRef end: endPatchRef]
]

{ #category : #'adding-removing' }
SpaceView >> addFiguresForOccupantPovsAndPatches: aCollectionOfPovAndPatch [
	"Add the Figures of the Agents' POV.
Figures are adapted to my bounds and located on the center of the cell even if it is not loaded
returns the figures created"
	
	| aPov aPatchRef |
	^aCollectionOfPovAndPatch
		do:
			[:aPovAndPatch | 
			aPov := aPovAndPatch key.
			aPatchRef := aPovAndPatch value.
			self addFigureForOccupantPov: aPov on: aPatchRef]
]

{ #category : #'adding-removing' }
SpaceView >> addFiguresForSpatialPovs: aCollectionOfPovs [
	"Add a COPY of the Figures, adapted to my bounds
	returns the figures created"
	
	| figures |
	figures := aCollectionOfPovs
		collect: [:aPov | self addFigureForSpatialPov: aPov].	"re display with the delimiter size"
	self delimiter: self delimiter.
	self delimiterColor: self delimiterColor.
	^figures
]

{ #category : #'adding-removing' }
SpaceView >> addLast: anOriginalFigure [
	"Add a COPY of anOriginalFigure, adapted to my bounds"
	
	| aCloneFig |
	aCloneFig := anOriginalFigure copy.
	aCloneFig model: anOriginalFigure.
	^super addLast: (self adaptFigure: aCloneFig)
]

{ #category : #adding }
SpaceView >> addWithoutRegister: aFigure [
	
	^super add: aFigure
]

{ #category : #'accessing-Figures' }
SpaceView >> allEntityFiguresAt: aClass [
	"Return a collection of Figures of aClass and super classes, stored into the entityFigures Dictionary.
entityFigures = [ Predator -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				Prey -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	| coll |
	coll := OrderedCollection new.
	aClass allTerminalClasses
		do: [:cl | coll addAll: (self entityFiguresAt: cl)].
	^coll
]

{ #category : #'accessing-Figures' }
SpaceView >> allFiguresAt: aPoint [
	
	^components select: [:comp | comp containsPoint: aPoint]
]

{ #category : #accessing }
SpaceView >> backgroundFillColor [
	
	^backgroundFillColor ifNil: [backgroundFillColor := ColorValue gray]
]

{ #category : #accessing }
SpaceView >> backgroundFillColor: anObject [
	
	backgroundFillColor := anObject
]

{ #category : #adapting }
SpaceView >> bounds: newBounds [
	"The receiver's bounds are being changed to newBounds.
	Inform the controller (if there is one) that any information it was retaining regarding bounds are invalid."
	
	super bounds: newBounds.
	self setBoundsTo: newBounds.
	self components isEmpty ifFalse: [self adaptComponentsForNewBounds].	"je ne sais pas pourquoi mais parfois bounds (cad oldBounds avant le changement, est d√©j√† √©gale √† newBounds, ou a peu pres egale. ???? c'est pour √ßa que je memorise oldBounds"
	oldBounds := newBounds
]

{ #category : #'accessing-Figures' }
SpaceView >> celluleFigureAt: aPoint [
	
	^(self allFiguresAt: aPoint)
		detect:
			[:fig | fig class ~= TrackFigure and: [fig entityType isSpatialEntityElementClass]]
		ifNone: [nil]
]

{ #category : #'accessing-Figures' }
SpaceView >> celluleFigures [
	
	^self components
		select: [:fig | fig entityType = self model cormasModelClass cellClass]
]

{ #category : #click }
SpaceView >> changeAttributeOf: figure [
	"method called from Tool (initializeChangeAttributeTool), to set a new value of the attribute of a cell clicked by the user"
	
	(figure model entity perform: activeAttribute asSymbol) =
			activeAttributeValue ifFalse: [model storeBeforeManipulation].
	figure model entity
		perform: (activeAttribute , ':') asSymbol
		with: activeAttributeValue
]

{ #category : #click }
SpaceView >> changeColorOf: figure [
	"method called from Tool (initializeChangeAttributeTool), change color of figure clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	self manipulationActionArguments isEmpty ifTrue: [^nil].
	self manipulationActionArguments first class = ColorValue ifFalse: [^nil].
	figure class ~= BitmapFigure
		ifTrue: [figure fillColor: self manipulationActionArguments first]
]

{ #category : #displaying }
SpaceView >> changeInfo: infoSymbol ofEntity: aClass [
	"Called from spaceInterface, when a Info has changed"
	
	| figures |
	figures := self figuresOfEntity: aClass.
	infoSymbol = #nil
		ifTrue: [figures do: [:fig | fig removeText]]
		ifFalse: [figures do: [:fig | fig setTextFor: infoSymbol]]
]

{ #category : #displaying }
SpaceView >> changePov: selectorName ofEntity: aClass [
	"Called from spaceInterface, when a PoV has changed"
	"removing the EntityFigures of an Occupant Class if selectorName = #nil"
	
	(selectorName = #nil and: [aClass isSpatialClass not])
		ifTrue: [^self removeAllFiguresOf: aClass].
	aClass isSpatialClass
		ifTrue:
			["removing the other spatialEntityFigures, (do not remove the agregates figures which POV = delimitors)"
			selectorName = #delimitors | (selectorName = #nil)
				ifFalse: [self removeAllSpatialFiguresBut: aClass]].
	self removeAllFiguresOf: aClass.	"il se peut que le nouveau PoV demande des images diff√©rentes"
	selectorName = #nil ifTrue: [^nil].
	self loadFiguresFrom: aClass povSelector: selectorName
]

{ #category : #click }
SpaceView >> clicToChange [
	
	| firstPatch valueToBeChanged |
	activeAttributeValue := self cormas
		request:
			(UserMessage defaultString: 'attribute value of ' key: #attributeValue)
				asString , self activeAttribute.
	activeAttributeValue isEmpty ifTrue: [^nil].
	firstPatch := (self spaceModel spatialEntities
		at: self model activeSpatialEntity name)
		detect: [:i | (i perform: self activeAttribute asSymbol) isNil not]
		ifNone:
			[(self spaceModel spatialEntities at: self model activeSpatialEntity name)
				first].
	valueToBeChanged := firstPatch perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [activeAttributeValue := activeAttributeValue asSymbol].
	(valueToBeChanged isKindOf: Number)
		ifTrue:
			[(activeAttributeValue isKindOf: Number)
				ifFalse: [activeAttributeValue := activeAttributeValue asNumber]].
	(valueToBeChanged isKindOf: Boolean)
		ifTrue:
			[(activeAttributeValue isKindOf: Boolean)
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]
]

{ #category : #click }
SpaceView >> clicToChangeAttribute: aSymbol withValue: aValue [
	
	| anInstance valueToBeChanged |
	activeAttribute := aSymbol.
	activeAttributeValue := aValue.
	anInstance := self allEntityFiguresAt: self manipulatedEntity.
	anInstance isEmpty ifTrue: [^nil].
	anInstance := anInstance first model entity copy.
	valueToBeChanged := anInstance perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [^activeAttributeValue := activeAttributeValue asSymbol].
	valueToBeChanged cormasHelper isTypeNumber
		ifTrue:
			[activeAttributeValue cormasHelper isTypeNumber
				ifFalse: [^activeAttributeValue := activeAttributeValue asNumber]].
	valueToBeChanged cormasHelper isTypeBoolean
		ifTrue:
			[activeAttributeValue cormasHelper isTypeBoolean
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]
]

{ #category : #click }
SpaceView >> clicToExecuteMethod: aSymbol onEntity: aClass [
	
	| firstPatch valueToBeChanged |
	activeAttribute := aSymbol.
	firstPatch := (self spaceModel spatialEntities
		at: self model activeSpatialEntity name)
		detect: [:i | (i perform: self activeAttribute asSymbol) isNil not]
		ifNone:
			[(self spaceModel spatialEntities at: self model activeSpatialEntity name)
				first].
	valueToBeChanged := firstPatch perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [activeAttributeValue := activeAttributeValue asSymbol].
	valueToBeChanged cormasHelper isTypeNumber
		ifTrue:
			[activeAttributeValue cormasHelper isTypeNumber
				ifFalse: [activeAttributeValue := activeAttributeValue asNumber]].
	valueToBeChanged cormasHelper isTypeBoolean
		ifTrue:
			[activeAttributeValue cormasHelper isTypeBoolean
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]
]

{ #category : #menus }
SpaceView >> contextualMenu [
	"See SpaceController and VectorialFigure #menuAt:"
	
	| aMenuBuilder tmp menuUpdated |
	aMenuBuilder := MenuBuilder new.
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass spatialClasses asList.
	tmp isEmpty ifFalse: [aMenuBuilder line].
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass socialClasses asList.
	tmp isEmpty ifFalse: [aMenuBuilder line].
	tmp := self
		fillContextualMenu: aMenuBuilder
		forClasses: self model cormasModelClass locatedObjectClasses asList.
	menuUpdated := self setCheck: aMenuBuilder menu.
	self controller menuHolder value isNil not
		ifTrue:
			[menuUpdated selectionMemory: self controller menuHolder selectionMemory].
	self controller menuHolder: menuUpdated
]

{ #category : #accessing }
SpaceView >> cormas [
	
	^self model spaceModel cormas
]

{ #category : #accessing }
SpaceView >> cormasModel [
	
	^self model cormasModel
]

{ #category : #aVirer }
SpaceView >> createOrResizeImagesForSpatialEntity22: aClass [
	"Set the images of all instances of aClass. The image is equal to the 'coordinates' of each entity scaled to the window size. The image is stored into entityImages (an identityDictionary )."
	
	(self entityImages includesKey: aClass)
		ifFalse: [self createImagesForSpatialEntity: aClass]
		ifTrue:
			[self resizeImagesOfSpatialEntitiesFromOldBounds: self buffer bounds]
]

{ #category : #'controller accessing' }
SpaceView >> defaultControllerClass [
	
	^SpaceController
]

{ #category : #accessing }
SpaceView >> delimiter [
	"returns an integer"
	
	delimiter ifNil: [delimiter := 0].
	^delimiter
]

{ #category : #'menu actions' }
SpaceView >> delimiter: aInteger [
	
	delimiter := aInteger.
	(self figuresOfEntity: self model activeSpatialEntity)
		do: [:aFig | aFig lineWidth: aInteger]
]

{ #category : #accessing }
SpaceView >> delimiterColor [
	
	^delimiterColor ifNil: [delimiterColor := ColorValue black]
]

{ #category : #'menu actions' }
SpaceView >> delimiterColor: aColor [
	"change the color of the delimiter"
	
	delimiterColor := aColor.
	self delimiter = 0 ifTrue: [^nil].
	(self figuresOfEntity: self model activeSpatialEntity)
		do: [:aFig | aFig lineColor: aColor]
]

{ #category : #click }
SpaceView >> detectSpatialEntityImageIncluding22: aPoint [
	| collec |
	collec := self model cormasModel
		perform:
			(self model cormasModel getterForEntityClass: self activeSpatialEntity)
				asSymbol.
	^ collec
		detect: [ :p | self image: (self getImageForEntity: p) includes: aPoint ]
		ifNone: [  ]
]

{ #category : #click }
SpaceView >> detectSpatialEntityImageIncluding: aPoint [
	| collec |
	collec := self model cormasModel
		perform:
			(self model cormasModel getterForEntityClass: self activeSpatialEntity).
	^ collec
		detect:
			[ :p | self image: (self getImageForEntity: p) includes: aPoint ]
		ifNone: [  ]
]

{ #category : #displaying }
SpaceView >> displayOn: aGraphicsContext [
	"overriden to set the backgroundColor"
	
	| clipRect |
	clipRect := aGraphicsContext clippingBounds.
	aGraphicsContext paint: self backgroundFillColor.
	clipRect displayFilledOn: aGraphicsContext.
	self isVisible
		ifTrue:
			[self isSelected
				ifTrue: [self displaySelectedFigureOn: aGraphicsContext]
				ifFalse: [self displayFigureOn: aGraphicsContext]].
	handles
		do:
			[:each | (each intersects: clipRect) ifTrue: [each displayOn: aGraphicsContext copy]]
]

{ #category : #'accessing-Figures' }
SpaceView >> entityComponents [
	"return a collection of all the components that are figures of entity"
	
	^self components select: [:c | c isTrackFigure not]
]

{ #category : #'accessing-Figures' }
SpaceView >> entityFigures [
	"Store the figures (SpatialEntityCoordinates scaled to the window size) of anEntity into entityFigures (an identityDictionary ).
entityFigures = [ class -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				class2 -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	^entityFigures ifNil: [entityFigures := Dictionary new]
]

{ #category : #'accessing-Figures' }
SpaceView >> entityFigures: anObject [
	
	entityFigures := anObject
]

{ #category : #'accessing-Figures' }
SpaceView >> entityFiguresAt: aClass [
	"Return a collection of Figures  of aClass stored into the entityFigures Dictionary.
entityFigures = [ Predator -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				Prey -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	^(self entityFigures
		at: aClass
		ifAbsent: [^#()]) values
]

{ #category : #'accessing-Figures' }
SpaceView >> entityFiguresAt: anImage put: aFigure [
	"Store the figures (SpatialEntityCoordinates scaled to the window size) of anEntity into entityFigures (an identityDictionary ).
entityFigures = [ #class -> anIdentityDictionary (anImage -> aFigure anImage -> aFigure...)
				#class2 -> anIdentityDictionary (anImage -> aFigure anImage -> aFigure...)]"

	(self entityFigures
		at: anImage entityReference entityClass
		ifAbsentPut: [ IdentityDictionary new ]) at: anImage put: aFigure.
	self flag: #TODO.
	"A Revoir
		entityFigures est uniquement utilisés pour le accéder aux figures des occupants pour un faire un track agents.
		Or actuellement les arcs utilisent enregistrent également leur entityFigures
		Et par ailleurs les figures sont déjà accessibles via les components du spaceView
		Il vaudrait donc mieux virer le entityFigures et passer par les components"
]

{ #category : #click }
SpaceView >> executeMethodOf: figure [
	"method called from Tool (initializeChangeAttributeTool), to execute a of the attribute of a cell clicked by the user"
	
	(figure model entity class includesBehavior: self manipulatedEntity)
		ifFalse: [^nil].
	model storeBeforeManipulation.
	figure model entity
		perform: self manipulationAction asSymbol
		withArguments: self manipulationActionArguments
]

{ #category : #accessing }
SpaceView >> figuresByReference [
	
	^figuresByReference ifNil: [figuresByReference := Dictionary new]
]

{ #category : #'visualized classes' }
SpaceView >> figuresOfEntity: aClass [
	
	^self components select: [:fig | fig entityType = aClass]
]

{ #category : #'attribute accessing' }
SpaceView >> fillColor [
	
	^attributes fillColor ifNil: [attributes fillColor: ColorValue lightGray]
]

{ #category : #'attribute accessing' }
SpaceView >> fillColor: aColorValue [
	"self paintPreferences setBackgroundColor: aColorValue."
	
	aColorValue ifNil: [^nil].
	self container ifNil: [^nil].
	self container container lookPreferences setBackgroundColor: aColorValue.
	super fillColor: aColorValue
]

{ #category : #menus }
SpaceView >> fillContextualMenu: aMenuBuilder forClasses: aCollectionOfClasses [
	
	| lesPdv |
	aCollectionOfClasses
		do:
			[:aClass | 
			lesPdv := (aClass organization listAtCategoryNamed: #pov)
				asOrderedCollection.
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			aMenuBuilder add: 'nil' -> (aClass name , '*nil') asSymbol.
			lesPdv
				do:
					[:aPOV | aMenuBuilder add: aPOV -> (aClass name , '*' , aPOV) asSymbol].
			aMenuBuilder endSubMenu].
	^aCollectionOfClasses
]

{ #category : #'accessing from entity references' }
SpaceView >> findFigureFor: anEntityReference [
	
	^(self entityFiguresAt: anEntityReference entityClass)
		detect:
			[:fig | fig model entityReference entityId = anEntityReference entityId]
		ifNone: [nil]
]

{ #category : #'accessing from entity references' }
SpaceView >> findRegisteredFigureFor: anEntityReference [
	
	| dict |
	dict := self figuresByReference
		at: anEntityReference entityId
		ifAbsent: [^nil].
	^dict
		at: anEntityReference entityClass
		ifAbsent: [nil]
]

{ #category : #'adding-removing' }
SpaceView >> flashColor: aColorValue entityReference: anEntityReference [
	"update the spatial figure color to be aColorValue "
	
	| aFig |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig fillColor: aColorValue
]

{ #category : #'accessing-Figures' }
SpaceView >> getTextFrom: aClass info: infoSymbol [
	"return a collection of TextFigures from the Entity (aClass) and subclasses"
	
	^self model cormasModel allEntitiesFrom: aClass getInfoFor: infoSymbol
]

{ #category : #'menu actions' }
SpaceView >> group [
	
	| figures newFigure |
	figures := selections copy.
	figures isEmpty ifTrue: [^self].
	self removeAll: figures.
	newFigure := CompositeEntityFigure new.
	newFigure addAll: figures.
	self
		add: newFigure;
		selection: newFigure
]

{ #category : #click }
SpaceView >> image: anImage includes: aPoint [
	
	^anImage notNil
		ifFalse: [false]
		ifTrue: [anImage bounds regionIntersects: (aPoint extent: 1)]
]

{ #category : #'initialize-release' }
SpaceView >> initialize [
	"super initialize."
	
	selections := OrderedCollection new.
	handles := OrderedCollection new.
	model := nil.
	state := 64.
	components := OrderedCollection new.
	self
		lineWidth: 1;
		lineColor: ColorValue black;
		selectable: false;
		moveable: false;
		removeable: false;
		connectable: false	"Set the default properties of figures, someone must do this..."
]

{ #category : #click }
SpaceView >> inspectOf: figure [
	"method called from Tool (initializeChangeAttributeTool), to execute a of the attribute of a cell clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	figure model entity inspect
]

{ #category : #'adding-removing' }
SpaceView >> loadFigureCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef povSelector: selectorName andInfo: infoName [
	
	| fig |
	fig := self
		addFigureForSpatialPov:
			(self model povOfCompoundSpatialEntity: aCompoundEntityRef withComponents:
					componentsRef forSelector: selectorName andInfo: infoName).
	selectorName = #nil
		ifTrue:
			[fig
				transparent;
				lineWidth: 3]
]

{ #category : #'adding-removing' }
SpaceView >> loadFiguresFrom: aClass povSelector: selectorName [
	"Create, add and return a collection of Figures from the Entity (aClass) and subclasses"
	
	| aInfoName |
	aInfoName := self model infoMethodDicoAt: aClass.
	self loadFiguresFrom: aClass povSelector: selectorName andInfo: aInfoName
]

{ #category : #'adding-removing' }
SpaceView >> loadFiguresFrom: aClass povSelector: selectorName andInfo: aInfoName [
	"Create, add and return a collection of Figures from the Entity (aClass) and subclasses using a specified povSelector and infoName"
	
	| loadedFigures |
	loadedFigures := aClass isSpatialClass
		ifTrue:
			[self
				addFiguresForSpatialPovs:
					(self model povsOfSpatialEntity: aClass forSelector: selectorName andInfo:
							aInfoName)]
		ifFalse:
			[aClass isArcClass
				ifFalse:
					[self
						addFiguresForOccupantPovsAndPatches:
							(self model povsAndPatchesOfOccupantEntity: aClass forSelector:
									selectorName andInfo: aInfoName)]
				ifTrue:
					[self
						addFiguresForArcPovsAndPatches:
							(self model povsAndPatchesOfArcEntity: aClass forSelector: selectorName
								andInfo: aInfoName)]].
	aClass isSpatialEntitySetClass
		ifTrue:
			[loadedFigures do: [:f | self sendToBack: f].
			self celluleFigures do: [:cf | self sendToBack: cf]].
	aClass isSpatialEntityElementClass
		ifTrue: [loadedFigures do: [:cf | self sendToBack: cf]].
	^loadedFigures
]

{ #category : #accessing }
SpaceView >> manipulatedEntity [
	
	^manipulatedEntity
]

{ #category : #accessing }
SpaceView >> manipulatedEntity: anObject [
	
	manipulatedEntity := anObject
]

{ #category : #accessing }
SpaceView >> manipulationAction [
	
	^manipulationAction
]

{ #category : #accessing }
SpaceView >> manipulationAction: anObject [
	
	manipulationAction := anObject
]

{ #category : #accessing }
SpaceView >> manipulationActionArguments [
	
	^manipulationActionArguments
		ifNil: [manipulationActionArguments := Array new]
]

{ #category : #accessing }
SpaceView >> manipulationActionArguments: anObject [
	
	manipulationActionArguments := anObject
]

{ #category : #'adding-removing' }
SpaceView >> moveArcStart: aArcRef to: startCellReference [
	"First detects the arcFigure that match aArcRef on this spaceView,
	If the Nodes are displayed, then put the start position of the arc fig to the center of the Node FIg, 
	otherwise move the start point to it position into the figure matching the startCellReference"
	
	| aFig absolutePoint patchBounds startNodeFig |
	aFig := self findRegisteredFigureFor: aArcRef.
	aFig
		ifNil:
			[aFig := self findFigureFor: aArcRef.
			aFig ifNil: [^nil]].
	aFig container ifNil: [^self release].
	startNodeFig := self
		findRegisteredFigureFor: (EntityReference on: aArcRef entity startNode).
	startNodeFig
		ifNil:
			[startNodeFig := self
				findFigureFor: (EntityReference on: aArcRef entity startNode)].
	startNodeFig isNil
		ifTrue:
			[patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
				at: startCellReference entityId) bounds.
			absolutePoint := aFig calculateNewStartPositionOnPatchBounds:
					patchBounds.
			aFig startPoint: absolutePoint * self scaleFactor	"aFig startPoint: absolutePoint * localContainer scaleFactor * localContainer zoomFactor + (localContainer translationVector * localContainer zoomFactor)"]
		ifFalse: [aFig startPoint: startNodeFig center]
]

{ #category : #'adding-removing' }
SpaceView >> moveArcStop: aArcRef to: endCellReference [
	"First detects the arcFigure that match aArcRef on this spaceView,
	If the Nodes are displayed, then put the stop position of the arc fig to the center of the Node FIg, 
	otherwise move the stop point to it position into the figure matching the endCellReference"
	
	| aFig absolutePoint patchBounds stopNodeFig |
	aFig := self findRegisteredFigureFor: aArcRef.
	aFig
		ifNil:
			[aFig := self findFigureFor: aArcRef.
			aFig ifNil: [^nil]].
	aFig container ifNil: [^self release].
	stopNodeFig := self
		findRegisteredFigureFor: (EntityReference on: aArcRef entity stopNode).
	stopNodeFig
		ifNil:
			[stopNodeFig := self
				findFigureFor: (EntityReference on: aArcRef entity stopNode)].
	stopNodeFig isNil
		ifTrue:
			[patchBounds := (self spaceModel elementaryEntitiesDefaultPovs
				at: endCellReference entityId) bounds.
			absolutePoint := aFig calculateNewStopPositionOnPatchBounds: patchBounds.
			aFig stopPoint: absolutePoint * self scaleFactor.
			aFig entity isCyclic ifTrue: [aFig addTwoPointOutside: patchBounds]	"aFig startPoint: absolutePoint * localContainer scaleFactor * localContainer zoomFactor + (localContainer translationVector * localContainer zoomFactor)"]
		ifFalse:
			[aFig stopPoint: stopNodeFig center.
			aFig entity isCyclic
				ifTrue:
					[| cyclicsArcs |
					cyclicsArcs := stopNodeFig entity cyclicsArcs.
					aFig
						addTwoPointOutside: stopNodeFig bounds
						position:
							(cyclicsArcs
								indexOf: aFig entity
								ifAbsent: [1]) / cyclicsArcs size]]
]

{ #category : #'adding-removing' }
SpaceView >> moveOccupant: aSituatedEntityReference on: aESEreference [
	"First detects the figure that match aSituatedEntityReference on this spaceView
	Then move that figure to its new location by requesting the patch of this entity.
	It also calculates the position of the figure on the SpatialEntity by requesting 'position' to the corresponding Pov"
	
	| aFig absolutePoint absolutePatchBounds |
	aFig := self findRegisteredFigureFor: aSituatedEntityReference.
	aFig
		ifNil:
			[aFig := self findFigureFor: aSituatedEntityReference.
			aFig ifNil: [^nil]].
	absolutePatchBounds := (self spaceModel elementaryEntitiesDefaultPovs
		at: aESEreference entityId) bounds.
	absolutePoint := aFig calculateNewPositionOnPatchBounds:
			absolutePatchBounds.
	aFig moveTo: absolutePoint
]

{ #category : #adapting }
SpaceView >> moveOccupant: occupantFigure to: absolutePoint [
	"Move origin of occupantFigure to aPoint x scaleFactor."
	
	| lineFigures |
	"add a new point to the tracker as the last position"
	lineFigures := occupantFigure dependents
		select: [:f | f isKindOf: TrackFigure].
	lineFigures
		do:
			[:lf | 
			lf
				addPoint: occupantFigure center
				beforeIndex: lf pointsSize.
			lf testAndRemoveOrigine].	"move the figure"
	occupantFigure translateTo: absolutePoint * self scaleFactor
]

{ #category : #'private - mouse actions' }
SpaceView >> noPatch [
	
	self cormas
		warn:
			(UserMessage defaultString: ' define a topology !  ' key: #defineTopology)
]

{ #category : #accessing }
SpaceView >> oldBounds [
	
	^oldBounds ifNil: [oldBounds := self preferredBounds]
]

{ #category : #accessing }
SpaceView >> oldBounds: anObject [
	
	oldBounds := anObject
]

{ #category : #'private - mouse actions' }
SpaceView >> performDoubleClickButton: aPoint [
	
	| figure |
	figure := self selection ifNil: [^self].
	figure model ifNotNil: [figure model inspect]
]

{ #category : #copying }
SpaceView >> postCopy [
	"Do not copy the dependents list."
	
	super postCopy.
	selections := OrderedCollection new
]

{ #category : #'adding-removing' }
SpaceView >> redisplayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef [
	
	| oldPov selectorName infoName |
	oldPov := (self findRegisteredFigureFor: aCompoundEntityRef) model.
	selectorName := oldPov name.
	infoName := oldPov infoName.
	self removeEntity: aCompoundEntityRef.
	self loadFigureCompoundSpatialEntity: aCompoundEntityRef withComponents:
			componentsRef povSelector: selectorName andInfo: infoName
]

{ #category : #'adding-removing' }
SpaceView >> registerFigure: aFigure [
	
	| ref |
	aFigure model ifNil: [^nil].
	ref := aFigure model entityReference.
	(self figuresByReference
		at: ref entityId
		ifAbsentPut: [Dictionary new])
		at: ref entityClass
		put: aFigure
]

{ #category : #'adding-removing' }
SpaceView >> remove: aFigure [
	
	self removeEntityFigure: aFigure.	"clean up the entityFigure dictionary"
	aFigure model: nil.
	super remove: aFigure
]

{ #category : #'adding-removing' }
SpaceView >> removeAll: aCollectionOfFigures [
	
	super removeAll: aCollectionOfFigures.
	aCollectionOfFigures
		do:
			[:fig | 
			self removeEntityFigure: fig.	"clean up the entityFigure dictionary"
			fig model: nil].
	^aCollectionOfFigures
]

{ #category : #'adding-removing' }
SpaceView >> removeAllCompoundSpatialEntityFigures [
	
	self
		removeAll:
			(self components select: [:f | f entityType isCompoundSpatialClass])
]

{ #category : #'adding-removing' }
SpaceView >> removeAllFigures [
	
	self removeAll: self components
]

{ #category : #'adding-removing' }
SpaceView >> removeAllFiguresBut: targetFigures [
	"removes a ll the displayed Figures but keeps th targetFigures"
	
	| figuresToBeRemoved |
	figuresToBeRemoved := self components
		select: [:fig | (targetFigures includes: fig) not].
	^self removeAll: figuresToBeRemoved
]

{ #category : #'adding-removing' }
SpaceView >> removeAllFiguresOf: aClass [
	
	aClass withAllSubclasses
		do: [:cl | self removeAll: (self figuresOfEntity: cl)]
]

{ #category : #'adding-removing' }
SpaceView >> removeAllNoneEntityFigures: aCollectionOfFigures [
	
	super removeAll: aCollectionOfFigures.
	^aCollectionOfFigures
]

{ #category : #'adding-removing' }
SpaceView >> removeAllPovsBut: targetPovs [
	"removes a ll the displayed Figures but keeps the targetFigures of the targetPovs"
	
	| targetFigs |
	targetFigs := self components
		select:
			[:fig | (targetPovs collect: [:povx | povx entity]) includes: fig model entity].
	targetFigs isEmpty
		ifTrue:
			[targetFigs := OrderedCollection with: targetPovs first dependents last].
	self removeAllFiguresBut: targetFigs
]

{ #category : #'adding-removing' }
SpaceView >> removeAllSpatialFiguresBut: aClass [
	"remove the figures of the SpatialFigure but keep the figures of aClass AND the agregates figures which POV = delimitors"
	
	| classes |
	self model activeSpatialEntity: aClass.
	classes := self model spatialClasses copy.
	classes remove: aClass.
	classes
		removeAllSuchThat:
			[:cl | (self model povMethodDico at: cl name) = #delimitors].
	classes do: [:cl | self removeAll: (self figuresOfEntity: cl)]
]

{ #category : #'adding-removing' }
SpaceView >> removeEntity: aEntityRef [
	
	(self findRegisteredFigureFor: aEntityRef) ifNotNil: [:f | self remove: f]
]

{ #category : #'accessing-Figures' }
SpaceView >> removeEntityFigure: aFigure [
	"remove aFigure from the figuresByReference & entityFigures dictionaries"
	
	| key |
	aFigure model ifNil: [^nil].
	self unregisterFigure: aFigure.
	key := (self entityFigures
		at: aFigure entityType
		ifAbsent: [^nil])
		keyAtValue: aFigure
		ifAbsent: [^nil].
	(self entityFigures at: aFigure entityType)
		removeKey: key
		ifAbsent: [^nil]
]

{ #category : #'adding-removing' }
SpaceView >> removeOccupant: aSituatedEntityReference [
	
	(self findRegisteredFigureFor: aSituatedEntityReference)
		ifNotNil: [:f | self remove: f]
]

{ #category : #click }
SpaceView >> resetColorOf: figure [
	"method called from Tool (initializeChangeAttributeTool), reset the color of the figure clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	figure class ~= BitmapFigure
		ifTrue:
			[figure model entity isSpatialEntity
				ifTrue: [figure fillColor: (figure model getColorForPov: figure pov)]
				ifFalse:
					[figure fillColor: (figure model entity povAt: figure pov) color]]
]

{ #category : #adapting }
SpaceView >> scaleFactor [
	
	^self bounds extent / self spaceModel absoluteBounds extent
]

{ #category : #aVirer }
SpaceView >> selectFigure22: aFigure [
	
	self halt.
	aFigure isSelected
		ifFalse: [super selectFigure: aFigure]
		ifTrue: [self deselectFigure: aFigure]
]

{ #category : #click }
SpaceView >> selection: aFigure [
	
	aFigure isSelected ifFalse: [^super selection: aFigure].
	self clearSelections
]

{ #category : #menus }
SpaceView >> setContextualMenu: aMenuBuilder from: aListOfClasses [
	
	| lesPdv |
	aListOfClasses
		do:
			[:aClass | 
			lesPdv := (aClass organization listAtCategoryNamed: #pov)
				asOrderedCollection.	"lesPdv addFirst: #randomColor."
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			aMenuBuilder add: 'nil' -> (aClass name , '*nil') asSymbol.
			lesPdv
				do: [:a | aMenuBuilder add: a -> (aClass name , '*' , a) asSymbol].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]
]

{ #category : #accessing }
SpaceView >> spaceModel [
	
	^model spaceModel
]

{ #category : #'accessing-Figures' }
SpaceView >> spatialAgregateFigureAt: aPoint [
	
	^(self allFiguresAt: aPoint)
		detect: [:cf | cf isCompositeEntityFigure]
		ifNone: [nil]
]

{ #category : #click }
SpaceView >> stopClicToChangeAttribute [
	
	activeAttribute := nil.
	activeAttributeValue := nil
]

{ #category : #accessing }
SpaceView >> translationVector [
	
	^1
]

{ #category : #'adding-removing' }
SpaceView >> unregisterFigure: aFigure [
	"remove aFigure from the figuresByReference dictionary"
	
	| ref dict |
	ref := aFigure model entityReference.
	dict := self figuresByReference
		at: ref entityId
		ifAbsent: [^nil].
	dict
		removeKey: ref entityClass
		ifAbsent: [nil]
]

{ #category : #'private - spatial entities images' }
SpaceView >> update: aspectSymbol [
	"Some aspect of the model has changed.
	By default, repaint the receiver.  Subclasses
	will often do something more selective."
	
	self invalidate
]

{ #category : #'adding-removing' }
SpaceView >> updateFigureForEntityReference: anEntityReference [
	"update the figure corresponding to anEntityReference (and its model, namely currentPov) in case the current values of the povResult and infoResult of the model of figure are different from the one of a updatedPovSpec which is newly calculated using the povSelector and infoName of the model of the figure.
	This method allows to manage figures which have a same enityType but not a same povSelector or povName"

	| aFig currentPov aSelector newPov currentPatch updatedPovSpec startPatch stopPatch |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig ifNil: [ ^ nil ].
	aFig model ifNil: [ ^ nil ].
	currentPov := aFig model.	"((self components select: [:f| f model entityType = CormasNS.Models.NewDistrict.Abeille]) collect: [:f| f model entity])"
	aSelector := currentPov name.
	(aSelector = #nil or: [ aSelector = #delimitors ])
		ifTrue: [ ^ nil ].	"Delimitors are updated only when the components of a spatialSet is changed"
	updatedPovSpec := anEntityReference entity
		getPovSpecForSelector: aSelector
		andInfo: currentPov infoName.
	currentPov povResult = updatedPovSpec povResult
		ifFalse: [ currentPov povResult: updatedPovSpec povResult.
			currentPov povResult cormasHelper isTypeColorValue
				ifTrue: [ currentPov color: currentPov povResult.
					aFig fillColor: currentPov color ]
				ifFalse: [ "In this case, it means the shape of entity has to be updated"
					"in the cas of a spatialEntity this is simple because the shape remains the same. Only the color changes. (a spatialEntitySet which compoistion changed is handled by the method redisplayCompoundSpatialEntity:"
					anEntityReference entityClass isSpatialClass
						ifTrue: [ currentPov
								color: (anEntityReference entityClass getColorAtPov: currentPov povResult).
							aFig fillColor: currentPov color ]
						ifFalse: [ "it is then an occupant or an arc that has a different shape"
							newPov := anEntityReference entityClass
								createEntityPOVwithSpec: updatedPovSpec.
							newPov entityReference: anEntityReference.
							anEntityReference entityClass isArcClass
								ifTrue: [ "It is then an arc"
									startPatch := anEntityReference entity startNode patch.
									stopPatch := anEntityReference entity stopNode patch.
									self remove: aFig.
									self
										addFigureForArcPov: newPov
										start: (EntityReference on: startPatch)
										end: (EntityReference on: stopPatch) ]
								ifFalse: [ "It is then an Occupant"
									currentPatch := anEntityReference entity patch.
									self flag:#TODO.
											"Ici on fait un appel au serveur via le message entity. A voir comment optimiser pour qu''il n''yest pas d''apel au serveur"
									self remove: aFig.
									self
										addFigureForOccupantPov: newPov
										on: (EntityReference on: currentPatch) ] ] ] ].
	currentPov infoResult ~= updatedPovSpec infoResult
		ifTrue: [ currentPov infoResult: updatedPovSpec infoResult.
			aFig setText: updatedPovSpec infoResult ]
]

{ #category : #'adding-removing' }
SpaceView >> updateFigureForEntityReference: anEntityReference ifPovNameIs: aPovName [
	"update the figure corresponding to anEntityReference (and its model, namely currentPov) in case the current values of the povResult and infoResult of the model of figure are different from the one of a updatedPovSpec which is newly calculated using the povSelector and infoName of the model of the figure.
	This method allows to manage figures which have a same enityType but not a same povSelector or povName"

	| aFig currentPov aSelector newPov currentPatch updatedPovSpec startPatch stopPatch |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig ifNil: [ ^ nil ].
	currentPov := aFig model.
	aSelector := currentPov name.
	(currentPov povResult ~= aPovName
		or: [ aSelector = #nil or: [ aSelector = #delimitors ] ])
		ifTrue: [ ^ nil ].	"Delimitors are updated only when the components of a spatialSet is changed"
	updatedPovSpec := anEntityReference entity
		getPovSpecForSelector: aSelector
		andInfo: currentPov infoName.
	currentPov povResult: updatedPovSpec povResult.
	currentPov povResult cormasHelper isTypeColorValue
		ifTrue: [ currentPov color: currentPov povResult.
			aFig fillColor: currentPov color ]
		ifFalse: [ "In this case, it means the shape of entity has to be updated"
			"in the cas of a spatialEntity this is simple because the shape remains the same. Only the color changes. (a spatialEntitySet which composition changed is handled by the method redisplayCompoundSpatialEntity:"
			anEntityReference entityClass isSpatialClass
				ifTrue: [ currentPov
						color: (anEntityReference entityClass getColorAtPov: currentPov povResult).
					aFig fillColor: currentPov color ]
				ifFalse: [ "it is then an Occupant or an Arc that has a different shape"
					newPov := anEntityReference entityClass
						createEntityPOVwithSpec: updatedPovSpec.
					newPov entityReference: anEntityReference.
					anEntityReference entityClass isArcClass
						ifTrue: [ "It is then an arc"
							startPatch := anEntityReference entity startNode patch.
							stopPatch := anEntityReference entity stopNode patch.
							self remove: aFig.
							self
								addFigureForArcPov: newPov
								start: (EntityReference on: startPatch)
								end: (EntityReference on: stopPatch) ]
						ifFalse: [ "It is then an Occupant"
							currentPatch := anEntityReference entity patch.
							self flag:#TODO.
							"Ici on fait un appel au serveur via le message entity. A voir comment optimiser pour qu''il n''yest pas d''apel au serveur"
							self remove: aFig.
							self
								addFigureForOccupantPov: newPov
								on: (EntityReference on: currentPatch) ] ] ].
	currentPov infoResult ~= updatedPovSpec infoResult
		ifTrue: [ currentPov infoResult: updatedPovSpec infoResult.
			aFig setText: updatedPovSpec infoResult ]
]

{ #category : #'adding-removing' }
SpaceView >> updateFigureForEntityReference: anEntityReference onPatch: aPatchEntityReference [
	"update the figure corresponding to anEntityReference (and its model, namely currentPov) in case the current values of the povResult and infoResult of the model of figure are different from the one of a updatedPovSpec which is newly calculated using the povSelector and infoName of the model of the figure.
	This method allows to manage figures which have a same enityType but not a same povSelector or povName"
	
	| aFig currentPov aSelector newPov updatedPovSpec startPatch stopPatch |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig ifNil: [^nil].
	aFig model ifNil: [^nil].
	currentPov := aFig model.	"((self components select: [:f| f model entityType = CormasNS.Models.NewDistrict.Abeille]) collect: [:f| f model entity])"
	aSelector := currentPov name.
	(aSelector = #nil or: [aSelector = #delimitors]) ifTrue: [^nil].	"Delimitors are updated only when the components of a spatialSet is changed"
	updatedPovSpec := anEntityReference entity
		getPovSpecForSelector: aSelector
		andInfo: currentPov infoName.
	currentPov povResult = updatedPovSpec povResult
		ifFalse:
			[currentPov povResult: updatedPovSpec povResult.
			currentPov povResult cormasHelper isTypeColorValue
				ifTrue:
					[currentPov color: currentPov povResult.
					aFig fillColor: currentPov color]
				ifFalse:
					["In this case, it means the shape of entity has to be updated"
					"in the cas of a spatialEntity this is simple because the shape remains the same. Only the color changes. (a spatialEntitySet which compoistion changed is handled by the method redisplayCompoundSpatialEntity:"
					anEntityReference entityClass isSpatialClass
						ifTrue:
							[currentPov
								color:
									(anEntityReference entityClass getColorAtPov: currentPov povResult).
							aFig fillColor: currentPov color]
						ifFalse:
							["it is then an occupant or an arc that has a different shape"
							newPov := anEntityReference entityClass createEntityPOVwithSpec:
									updatedPovSpec.
							newPov entityReference: anEntityReference.
							anEntityReference entityClass isArcClass
								ifTrue:
									["It is then an arc"
									startPatch := anEntityReference entity startNode patch.
									stopPatch := anEntityReference entity stopNode patch.
									self remove: aFig.
									self
										addFigureForArcPov: newPov
										start: (EntityReference on: startPatch)
										end: (EntityReference on: stopPatch)]
								ifFalse:
									["It is then an Occupant"
									"currentPatch := anEntityReference entity patch. 
														Dev todo: 'Ici on fait un appel au serveur via le message entity. A voir comment optimiser pour qu''il n''yest pas d''apel au serveur'."
									self remove: aFig.
									self addFigureForOccupantPov: newPov on: aPatchEntityReference	"(EntityReference on: currentPatch)"]]]].
	currentPov infoResult ~= updatedPovSpec infoResult
		ifTrue:
			[currentPov infoResult: updatedPovSpec infoResult.
			aFig setText: updatedPovSpec infoResult]
]

{ #category : #'visualized classes' }
SpaceView >> visualizedClasses [
	
	^self model cormasModelClass visualizedClasses
]

{ #category : #'visualized classes' }
SpaceView >> visualizedPassiveClasses [
	"return a collection of the LocatedObjects classes of the model for which a pov has been defined"
	
	^self visualizedClasses
		select:
			[:e | self model cormasModelClass locatedObjectClasses includes: e]
]

{ #category : #'visualized classes' }
SpaceView >> visualizedSocialClasses [
	"return a collection of the Social classes of the model for which a pov has been defined"
	
	| modelClass |
	modelClass := self model cormasModelClass.
	^modelClass visualizedClasses
		select: [:e | modelClass socialClasses includes: e]
]

{ #category : #'visualized classes' }
SpaceView >> visualizedSpatialClasses [
	"return a collection of all the spatial classes of the model,  even if no pov has been defined"
	
	^self model cormasModelClass spatialClasses
]

{ #category : #accessing }
SpaceView >> zoomFactor [
	
	^1
]

{ #category : #'private - mouse actions' }
SpaceView >> zoomOnSpatialEntities: aSetOfFigures [
	"the user clicked and draged on a set of entities of the grid. An interfaceZoom is opened on the target entities"
	
	aSetOfFigures isEmpty ifTrue: [^nil].
	SpaceInterfaceZoom openAndDisplayFigures: aSetOfFigures
]
