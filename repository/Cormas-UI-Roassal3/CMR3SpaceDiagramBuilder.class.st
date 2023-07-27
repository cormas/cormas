Class {
	#name : #CMR3SpaceDiagramBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'cormasModel',
		'masterCell',
		'cellShapes',
		'activePoVsDictionary'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #examples }
CMR3SpaceDiagramBuilder class >> example [

	<example>
	| model builder |
	
	model := CMMockModel new initializeSimulation.

	builder := self new
		cormasModel: model;
		inspect;
		asPresenter.
	
	builder openWithSpec.
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> activePoVsDictionary [
	" Each presenter could have customized PoV's. If this Dictionary is empty, we use the PoV's defined in the receiver's space model "

	^ activePoVsDictionary ifNil: [ activePoVsDictionary := self defaultActivePoVs ]
]

{ #category : #'accessing - pov' }
CMR3SpaceDiagramBuilder >> activeSpatialEntityPov [
	" Answer a <Symbol> representing the selector of the active PoV which is a Spatial Entity "
	
	| spatialEntitySelections |
	
	spatialEntitySelections := self activePoVsDictionary associationsSelect: [ : assoc | assoc key isKindOf: CMSpatialEntityElement class ].
	^ spatialEntitySelections size = 1
		ifTrue: [ spatialEntitySelections anyOne value ]
		ifFalse: [ spatialEntitySelections ifEmpty: [ #pov ] ifNotEmpty: [ self error ] ]
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> createAdaptivePopup [

	"RSPopup text: [ : aCMEntity | aCMEntity asString ]"
	^ RSPopup new shapeBuilder: [ : aCMEntity |
		| composite lb colors |
		composite := RSComposite new.
		colors := NSScale category20c.
		lb := RSLegend new.
		lb container: composite.
		lb title: aCMEntity friendlyName.
		aCMEntity interestingDetails do: [ : att | 
			lb 
				text: (self formatEntityDetail: aCMEntity attribute: att)
				withShape: (RSEllipse new size: 8; color: Color black) ].
		lb build.
		composite adjustToChildren.
		composite
			color: (Color white alpha: 0.7);
			withBorder;
			padding: 5;
			yourself.
		 ].
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> createCellShapes [

	^ cormasModel theESE collect: [ :cell |
		self newCellShapeForModel: cell ]
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> defaultActivePoVs [
	" Answer a <Dictionary> of receiver's model active points of view "
	
	^ cormasModel spaceModel activePoVsDictionary
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> defaultContainer [

	| canvas |
	canvas := RSCanvas new.
	canvas addInteraction: RSCanvasController.
	
	^ canvas
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> defaultMasterCell [

	| popUp |
	
	popUp := self createAdaptivePopup.

	^ RSBox new
		size: 25;
		@ popUp;
		when: RSMouseLeftClick send: #inspectEntity: to: self;
		yourself.
]

{ #category : #formatting }
CMR3SpaceDiagramBuilder >> formatEntityDetail: aCMEntity attribute: att [

	^ String << [ : stream |
		stream 
			<< att key;
			space;
			<< att value asString ]
]

{ #category : #initialization }
CMR3SpaceDiagramBuilder >> initialize [

	super initialize.
	masterCell := self defaultMasterCell.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> inspectEntity: anEvent [

	anEvent shape model inspect
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> masterCell [

	^ masterCell
]

{ #category : #'instance creation' }
CMR3SpaceDiagramBuilder >> newCellShapeForModel: aCellModel [

	^ self masterCell copyWithAnnouncer
		model: aCellModel;
		yourself
]

{ #category : #rendering }
CMR3SpaceDiagramBuilder >> renderIn: aCanvas [

	cellShapes := self createCellShapes.
	aCanvas addAll: cellShapes.
	
	RSGridLayout new
		gapSize: 0;
		lineItemsCount: cormasModel spaceModel column;
		on: aCanvas nodes.
		
	self update.
]

{ #category : #updating }
CMR3SpaceDiagramBuilder >> update [

	self updateCellShapes.
]

{ #category : #updating }
CMR3SpaceDiagramBuilder >> updateCellShape: aShape [

	| model colorSymbolOrNumber |
	model := aShape model.
	
	colorSymbolOrNumber := model perform: self activeSpatialEntityPov.

	aShape color: (colorSymbolOrNumber asColorForPoVIn: model).
]

{ #category : #updating }
CMR3SpaceDiagramBuilder >> updateCellShapes [

	cellShapes do: [ :shape |
		self updateCellShape: shape ].
]
