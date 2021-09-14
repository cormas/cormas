Class {
	#name : #CMR3SpacePresenter,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'cellSize',
		'model',
		'situatedEntitiesViews',
		'origin',
		'speed',
		'cellViews',
		'layoutClass',
		'elemClass',
		'sevClass',
		'activePoVsDictionary'
	],
	#category : #'Cormas-UI-Roassal3'
}

{ #category : #'instance creation' }
CMR3SpacePresenter class >> newOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	^ instance
]

{ #category : #'instance creation' }
CMR3SpacePresenter class >> openOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	instance openWithToolbar.
	^ instance
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> activePoVSelectorAtClass: aClass [
	" Answer a <Symbol> which is a selector to access the PoV of an entity of aClass "

	^ self activePoVsDictionary at: aClass ifAbsent: [ 
			aClass superClassesUntilEntity  
				ifEmpty: [ Color gray ] 
				ifNotEmpty: [ self halt  ] ]
	
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> activePoVsDictionary [
	" Each presenter could have customized PoV's. If this Dictionary is empty, we use the PoV's defined in the receiver's space model "

	activePoVsDictionary ifNil: [ activePoVsDictionary := Dictionary new ].
	^ activePoVsDictionary ifEmpty: [ activePoVsDictionary := self defaultActivePoVs ]
]

{ #category : #refreshing }
CMR3SpacePresenter >> addNewSituatedEntities [

	| newSituatedEntities newSituatedEntitiesViews |
	newSituatedEntities := model allTheSituatedEntities reject: [ :a | 
		                       (situatedEntitiesViews collect: [ :e | 
			                        e model ]) includes: a ].
	newSituatedEntitiesViews := newSituatedEntities collect: [ : se | self newSEViewForModel: se ].
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self canvas addAll: newSituatedEntitiesViews.
	newSituatedEntitiesViews do: [ :nse | nse @ RSDraggable ]
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> addViewForAgents: theSituatedEntities [
	" Private - Create views for situated entities (agents) "

	| windowSize |


	theSituatedEntities ifNotEmpty: [ : atse |

		origin := self collectXAxisPositions min @ self collectYAxisPositions min.
		windowSize := self collectXAxisPositions max @ self collectYAxisPositions max.
		"9@6 / (3@2)"
		cellSize := (windowSize - origin) / (model spaceModel column @ model spaceModel line).
		situatedEntitiesViews := atse collect: [ : se | self newSEViewForModel: se ].
		self canvas addAll: situatedEntitiesViews ].
	self moveSituatedEntities

]

{ #category : #'instance creation' }
CMR3SpacePresenter >> addViewForCells: cells [

	| theCellViews |
	
	theCellViews := cells collect: [ : cell | self newElementViewForModel: cell ] as: RSGroup.
	self canvas addAll: theCellViews.
	self configurePopUpOn: theCellViews.
	self configureLayoutOn: theCellViews.
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> atClass: aClass putActivePovSelector: aSymbol [

	self activePoVsDictionary at: aClass put: aSymbol
]

{ #category : #accessing }
CMR3SpacePresenter >> cellSize [

	^ cellSize 
		ifNil: [ cellSize := self defaultCellSize ]
]

{ #category : #accessing }
CMR3SpacePresenter >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #accessing }
CMR3SpacePresenter >> cellViews [
	^ cellViews ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpacePresenter >> cellViews: anObject [

	cellViews := anObject
]

{ #category : #refreshing }
CMR3SpacePresenter >> clearView [
	self situatedEntitiesViews removeAll.
	self clean
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> collectXAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position x ]
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> collectYAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position y ]
]

{ #category : #'accessing - layouts' }
CMR3SpacePresenter >> configureLayout [

	self layoutClass new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self nodes	
]

{ #category : #'accessing - layouts' }
CMR3SpacePresenter >> configureLayoutOn: aRSGroup [

	self layoutClass new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self canvas nodes
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> configurePopUpOn: theCellViews [

	| popUp |
	popUp := RSPopup text: [ : aCMEntity | aCMEntity asString ].
	theCellViews
		@ popUp;
		when: RSMouseLeftClick do: [ : aRSMouseClick | aRSMouseClick shape model inspect ].
]

{ #category : #accessing }
CMR3SpacePresenter >> cormasModel [
	" Answer the receiver's <CMAbstractModel> "
	
	^ model
]

{ #category : #defaults }
CMR3SpacePresenter >> defaultActivePoVs [
	" Answer a <Dictionary> of receiver's model active points of view "
	
	^ self spaceModel activePoVsDictionary
]

{ #category : #defaults }
CMR3SpacePresenter >> defaultCellSize [

	^ 25
]

{ #category : #defaults }
CMR3SpacePresenter >> defaultElementClass [

	^ RSBox
]

{ #category : #defaults }
CMR3SpacePresenter >> defaultLayoutClass [

	^ RSGridLayout
]

{ #category : #defaults }
CMR3SpacePresenter >> defaultSituatedEntityViewClass [

	^ RSEllipse
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> elemClass [

	^ elemClass 
		ifNil: [ elemClass := self defaultElementClass ]
]

{ #category : #accessing }
CMR3SpacePresenter >> elemClass: anObject [

	elemClass := anObject
]

{ #category : #initialization }
CMR3SpacePresenter >> initialize [
	" Private - Set the receiver's Spec application "

	super initialize.
	application := CMSpApplication new
]

{ #category : #initialization }
CMR3SpacePresenter >> initializePresenters [
	" Private - This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour "

	self addViewForCells: self model theESE.
	self addViewForAgents: self model allTheSituatedEntities.
	
	model projectAnnouncer
		when: CMTimeChangedAnnouncement do: [ :aAnnounce | 
			aAnnounce timeStep = 0 
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		when: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].
	self canvas zoomToFit.
]

{ #category : #'accessing - layouts' }
CMR3SpacePresenter >> layoutClass [

	^ layoutClass
		ifNil: [ layoutClass := self defaultLayoutClass ]
]

{ #category : #'accessing - layouts' }
CMR3SpacePresenter >> layoutClass: anObject [

	layoutClass := anObject
]

{ #category : #accessing }
CMR3SpacePresenter >> model [

	^ model
]

{ #category : #accessing }
CMR3SpacePresenter >> model: anObject [

	model := anObject
]

{ #category : #initialization }
CMR3SpacePresenter >> moveSituatedEntities [
	" Position the already created entities views to the location determined by each view's patch "

	self situatedEntitiesViews ifNotEmpty: [ : eViews |
		eViews do: [ : e | 
			"Adding property to be draggable"
			e @ RSDraggable.
			e translateTo: e model patch numCol @ e model patch numLine * cellSize ] ]
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> newElementViewForModel: cellModel [

"	| povSelector |

	povSelector := self getActivePovSelectorOf: cellModel class."
	^ self elemClass new
		model: cellModel;
		"color: (cellModel getColorForPov: povSelector);"
		size: self cellSize;
		yourself
]

{ #category : #'instance creation' }
CMR3SpacePresenter >> newSEViewForModel: aCMEntity [
	" Answer a <RSShape> for the receiver's situated entities "

	| colorSelector |
	
	colorSelector := self activePoVSelectorAtClass: aCMEntity class.
	^ self sevClass new
		model: aCMEntity;
		color: (aCMEntity perform: colorSelector);
		size: aCMEntity sizeOfPOV;
		yourself
]

{ #category : #accessing }
CMR3SpacePresenter >> nodes [
	^ self canvas nodes.
]

{ #category : #accessing }
CMR3SpacePresenter >> origin [
	^ origin
]

{ #category : #accessing }
CMR3SpacePresenter >> origin: anObject [
	origin := anObject
]

{ #category : #refreshing }
CMR3SpacePresenter >> removeObsoleteSituatedEntities [

	| obsoleteSituatedEntities |
	self situatedEntitiesViews isEmpty ifTrue: [ ^ self ].
	obsoleteSituatedEntities := self situatedEntitiesViews reject: [ :e | e model isSituated ].
	obsoleteSituatedEntities do: [ :e | e remove ].
	self situatedEntitiesViews removeAll: obsoleteSituatedEntities
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> setAndRefreshActivePovSelectorOf: aClass with: aSymbol [
	" Configure a single point of view with selector aSymbol in model class aClass "

	self halt.
	self atClass: aClass putActivePovSelector: aSymbol.
	self updateNodesOf: aClass.
	self canvas signalUpdate
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> setAndRefreshActivePovs [
	" Configure the receiver's point of views in all classes in the active PoVs Dictionary "

	self activePoVsDictionary keysDo: [ : classPoV | self updateNodesOf: classPoV ].
	self canvas signalUpdate
]

{ #category : #initialization }
CMR3SpacePresenter >> setModelBeforeInitialization: aCMAbstractModel [
	" Private - Set the receiver's CORMAS model to aCMAbstractModel "

	self model: aCMAbstractModel.
]

{ #category : #accessing }
CMR3SpacePresenter >> sevClass [

	^ sevClass
		ifNil: [ sevClass := self defaultSituatedEntityViewClass ]
]

{ #category : #accessing }
CMR3SpacePresenter >> sevClass: anObject [

	sevClass := anObject
]

{ #category : #accessing }
CMR3SpacePresenter >> situatedEntitiesViews [
	^ situatedEntitiesViews
		ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpacePresenter >> situatedEntitiesViews: anObject [
	situatedEntitiesViews := anObject
]

{ #category : #accessing }
CMR3SpacePresenter >> spaceModel [
	" Answer the receiver's <CMSpaceModel> "

	^ self cormasModel spaceModel
]

{ #category : #accessing }
CMR3SpacePresenter >> speed [

	^ speed
]

{ #category : #accessing }
CMR3SpacePresenter >> speed: anObject [

	speed := anObject
]

{ #category : #refreshing }
CMR3SpacePresenter >> timeChanged: aNewTimeStep [

	aNewTimeStep = 0
		ifTrue: [ self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ self removeObsoleteSituatedEntities ].
	self addNewSituatedEntities.
	self moveSituatedEntities.
	self nodes do: #signalUpdate.
	self canvas signalUpdate
]

{ #category : #'accessing - pov' }
CMR3SpacePresenter >> updateNodesOf: modelClass [

	^ self nodes
		  select: [ :roassalNode | roassalNode model isKindOf: modelClass ]
		  thenDo: [ :roassalNode | 
			  | shapeSelector |
			  shapeSelector := self activePoVSelectorAtClass: modelClass.
			  roassalNode color: (roassalNode model getColorForPov: shapeSelector) ]
]
