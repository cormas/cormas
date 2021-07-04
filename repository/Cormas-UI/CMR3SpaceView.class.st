Class {
	#name : #CMR3SpaceView,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'cellSize',
		'model',
		'situatedEntitiesViews',
		'origin',
		'speed',
		'cellViews',
		'activePovsSelector',
		'layoutClass',
		'elemClass',
		'sevClass'
	],
	#category : #'Cormas-UI-Space-Spec2'
}

{ #category : #'instance creation' }
CMR3SpaceView class >> newOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	^ instance
]

{ #category : #'instance creation' }
CMR3SpaceView class >> openOn: aCMCormasModel [
	"This method is called by the CMSpecProjectWindow. It creates, subscribes and opens a simulationGrid on a cormasModel"

	| instance |
	instance := self new.
	instance initializeOn: aCMCormasModel.
	instance subscribeOn: aCMCormasModel.
	instance openWithToolbar.
	^ instance
]

{ #category : #'accessing - pov' }
CMR3SpaceView >> activePovsSelector [
	^ activePovsSelector ifNil: [ activePovsSelector := Dictionary new ]
]

{ #category : #'accessing - pov' }
CMR3SpaceView >> activePovsSelector: anObject [
	activePovsSelector := anObject
]

{ #category : #refreshing }
CMR3SpaceView >> addNewSituatedEntities [

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
CMR3SpaceView >> addViewForAgents: situatedEntities [
	" Private - Create views for situated entities (agents) "

	| windowSize |
	
	origin := self collectXAxisPositions min @ self collectYAxisPositions min.
	windowSize := self collectXAxisPositions max @ self collectYAxisPositions max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (model spaceModel column @ model spaceModel line).
	situatedEntitiesViews := situatedEntities collect: [ : se | self newSEViewForModel: se ].
	self canvas addAll: situatedEntitiesViews.
	"Adding property to be draggable"
	situatedEntitiesViews do: [ :situatedEntityEl | situatedEntityEl @ RSDraggable ]
]

{ #category : #'instance creation' }
CMR3SpaceView >> addViewForCells: cells [

	| theCellViews |
	
	theCellViews := cells collect: [ : cell | self newElementViewForModel: cell ] as: RSGroup.
	self canvas addAll: theCellViews.
	self configurePopUpOn: theCellViews.
	self configureLayoutOn: theCellViews.
]

{ #category : #'instance creation' }
CMR3SpaceView >> addViewForCells: cells withPov: aPovName [

	self flag: #toBeRevised. "This method seems obsolete"
	cellViews := (RTBox new
		color: [ :e | e getColorForPov: aPovName ];
		size: 25) elementsOn: cells.
	self addAll: cellViews.
	self configureLayout.
]

{ #category : #accessing }
CMR3SpaceView >> cellSize [

	^ cellSize 
		ifNil: [ cellSize := self defaultCellSize ]
]

{ #category : #accessing }
CMR3SpaceView >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #accessing }
CMR3SpaceView >> cellViews [
	^ cellViews ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpaceView >> cellViews: anObject [

	cellViews := anObject
]

{ #category : #refreshing }
CMR3SpaceView >> clearView [
	self situatedEntitiesViews removeAll.
	self clean
]

{ #category : #'instance creation' }
CMR3SpaceView >> collectXAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position x ]
]

{ #category : #'instance creation' }
CMR3SpaceView >> collectYAxisPositions [
	" Answer a <Collection> of ..."

	^ self nodes collect: [ :e | e position y ]
]

{ #category : #'accessing - layouts' }
CMR3SpaceView >> configureLayout [

	self layoutClass new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self nodes	
]

{ #category : #'accessing - layouts' }
CMR3SpaceView >> configureLayoutOn: aRSGroup [

	self layoutClass new
		gapSize: 0;
		lineItemsCount: model spaceModel column;
		on: self canvas nodes
]

{ #category : #'instance creation' }
CMR3SpaceView >> configurePopUpOn: theCellViews [

	| popUp |
	popUp := RSPopup text: [ : aCMEntity | aCMEntity asPopupText ].
	theCellViews
		@ popUp;
		when: RSMouseLeftClick do: [ : aRSMouseClick | aRSMouseClick shape model inspect ].
]

{ #category : #defaults }
CMR3SpaceView >> defaultCellSize [

	^ 25
]

{ #category : #defaults }
CMR3SpaceView >> defaultElementClass [

	^ RSBox
]

{ #category : #defaults }
CMR3SpaceView >> defaultLayoutClass [

	^ RSGridLayout
]

{ #category : #defaults }
CMR3SpaceView >> defaultSituatedEntityViewClass [

	^ RSEllipse
]

{ #category : #'instance creation' }
CMR3SpaceView >> elemClass [

	^ elemClass 
		ifNil: [ elemClass := self defaultElementClass ]
]

{ #category : #accessing }
CMR3SpaceView >> elemClass: anObject [

	elemClass := anObject
]

{ #category : #'accessing - pov' }
CMR3SpaceView >> getActivePovSelectorOf: aClass [
^self activePovsSelector at: aClass ifAbsent: [ nil ]
	
]

{ #category : #initialization }
CMR3SpaceView >> initializeOn: aModel [

	"This method initializes a simulationGrid for a specific cormasModel , without specifyin any animation behaviour"

	model := aModel.
	self addViewForCells: aModel theESE.
	aModel allTheSituatedEntities ifNotEmpty: [ : atse |
		self addViewForAgents: atse.
		self moveSituatedEntities ].
	model projectAnnouncer
		when: CMTimeChangedAnnouncement do: [ :aAnnounce | 
			aAnnounce timeStep = 0 
				ifFalse: [ self timeChanged: aAnnounce timeStep ] ];
		when: CMSimInitializationAnnouncement do: [ self timeChanged: 0 ].
	self canvas zoomToFit.
]

{ #category : #'accessing - layouts' }
CMR3SpaceView >> layoutClass [

	^ layoutClass
		ifNil: [ layoutClass := self defaultLayoutClass ]
]

{ #category : #'accessing - layouts' }
CMR3SpaceView >> layoutClass: anObject [

	layoutClass := anObject
]

{ #category : #accessing }
CMR3SpaceView >> model [

	^ model
]

{ #category : #accessing }
CMR3SpaceView >> model: anObject [

	model := anObject
]

{ #category : #initialization }
CMR3SpaceView >> moveSituatedEntities [

	situatedEntitiesViews do: [ :e | 
		e translateTo:
			e model patch numCol @ e model patch numLine * cellSize ]
]

{ #category : #'instance creation' }
CMR3SpaceView >> newElementViewForModel: cellModel [

"	| povSelector |

	povSelector := self getActivePovSelectorOf: cellModel class."
	^ self elemClass new
		model: cellModel;
		"color: (cellModel getColorForPov: povSelector);"
		size: self cellSize;
		yourself
]

{ #category : #'instance creation' }
CMR3SpaceView >> newSEViewForModel: aCMEntity [
	" Answer a <RSShape> for the receiver's situated entities "

"	| shapeSelector |
	
	shapeSelector := self getActivePovSelectorOf: aCMEntity class."
	^ self sevClass new
		model: aCMEntity;
	"	color: (aCMEntity getColorForPov: shapeSelector);"
		size: aCMEntity sizeOfPOV;
		yourself
]

{ #category : #accessing }
CMR3SpaceView >> nodes [
	^ self canvas nodes.
]

{ #category : #accessing }
CMR3SpaceView >> origin [
	^ origin
]

{ #category : #accessing }
CMR3SpaceView >> origin: anObject [
	origin := anObject
]

{ #category : #refreshing }
CMR3SpaceView >> removeObsoleteSituatedEntities [

	| obsoleteSituatedEntities |
	self situatedEntitiesViews isEmpty ifTrue: [ ^ self ].
	obsoleteSituatedEntities := self situatedEntitiesViews reject: [ :e | e model isSituated ].
	obsoleteSituatedEntities do: [ :e | e remove ].
	self situatedEntitiesViews removeAll: obsoleteSituatedEntities
]

{ #category : #'accessing - pov' }
CMR3SpaceView >> setActivePovSelectorOf: aClass with: aSymbol [

	self activePovsSelector at: aClass put: aSymbol
]

{ #category : #'accessing - pov' }
CMR3SpaceView >> setAndRefreshActivePovSelectorOf: aClass with: aSymbol [ 

	self setActivePovSelectorOf: aClass with: aSymbol.
	self nodes 
		select: [ : roassalNode | roassalNode model isKindOf: aClass ]
		thenDo: [ : roassalNode | 
			| shapeSelector |
			shapeSelector := self getActivePovSelectorOf: aClass.
			roassalNode color: (roassalNode model getColorForPov: shapeSelector) ].
	self canvas signalUpdate
]

{ #category : #accessing }
CMR3SpaceView >> sevClass [

	^ sevClass
		ifNil: [ sevClass := self defaultSituatedEntityViewClass ]
]

{ #category : #accessing }
CMR3SpaceView >> sevClass: anObject [

	sevClass := anObject
]

{ #category : #accessing }
CMR3SpaceView >> situatedEntitiesViews [
	^ situatedEntitiesViews
		ifNil: [ situatedEntitiesViews := OrderedCollection new ]
]

{ #category : #accessing }
CMR3SpaceView >> situatedEntitiesViews: anObject [
	situatedEntitiesViews := anObject
]

{ #category : #accessing }
CMR3SpaceView >> speed [

	^ speed
]

{ #category : #accessing }
CMR3SpaceView >> speed: anObject [

	speed := anObject
]

{ #category : #refreshing }
CMR3SpaceView >> timeChanged: aNewTimeStep [

	aNewTimeStep = 0
		ifTrue: [ self clearView.
			self addViewForCells: model theESE ]
		ifFalse: [ self removeObsoleteSituatedEntities ].
	self addNewSituatedEntities.
	self moveSituatedEntities.
	self nodes do: #signalUpdate.
	self canvas signalUpdate
]
