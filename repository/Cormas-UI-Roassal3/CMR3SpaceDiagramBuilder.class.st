Class {
	#name : #CMR3SpaceDiagramBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'cormasModel',
		'masterCell',
		'cellShapes',
		'activePoVsDictionary',
		'masterAgent',
		'agentShapes'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #examples }
CMR3SpaceDiagramBuilder class >> example [

	<example>
	| model builder |
	
	model := CMMockModel new
		initializeSimulation;
		yourself.

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
CMR3SpaceDiagramBuilder >> cellAt: aPoint ifAbsent: absentBlock [
	" Answer the <RSShape> which contains aPoint in the receiver "

	^ self cellShapes
		detect: [ :roassalNode | roassalNode encompassingRectangle containsPoint: aPoint ]
		ifNone: absentBlock
]

{ #category : #accessing }
CMR3SpaceDiagramBuilder >> cellShapes [

	^ cellShapes
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
CMR3SpaceDiagramBuilder >> createAgentShapes [

	^ cormasModel theAgents collect: [ :agent |
		self newAgentShapeForModel: agent ]
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> createCellShapes [

	^ cormasModel theESE collect: [ :agent |
		self newCellShapeForModel: agent ]
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
CMR3SpaceDiagramBuilder >> defaultMasterAgent [

	| popUp |
	
	popUp := self createAdaptivePopup.

	^ RSEllipse new
		size: 25;
		@ popUp;
		when: RSMouseLeftClick send: #inspectEntity: to: self;
		yourself.
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
	masterAgent := self defaultMasterAgent.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> inspectEntity: anEvent [

	anEvent shape model inspect
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> makeAgentShapeDraggable: anAgentShape [

	| agent |

	"Adding property to be draggable"
	anAgentShape @ RSDraggable.
	
	anAgentShape when: RSMouseDragEnd do: [ :evt |
		agent := evt shape model.
		agent patch: (self cellAt: evt position ifAbsent: [ agent patch ]) ].
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> masterAgent [

	^ masterAgent
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> masterCell [

	^ masterCell
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> moveAgentShape: anAgentShape [

	| agent cell cellSize |
			
	agent := anAgentShape model.
	cell := agent patch.
	cellSize := cellShapes anyOne encompassingRectangle extent.
	
	self makeAgentShapeDraggable: anAgentShape.

	(anAgentShape propertyAt: #RSLabeled) ifNotNil: [ :p |
		p text: agent labelOfPOV ].
	
	anAgentShape
		"@ (RSPopup text: agent detailsOfPOV);"
		size: agent sizeOfPOV;
		color: agent pov;
		translateTo: (cell numCol @ cell numLine * cellSize) - (cellSize / 2)
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilder >> moveAgentShapes [

	agentShapes do: [ :each | self moveAgentShape: each ]
]

{ #category : #'instance creation' }
CMR3SpaceDiagramBuilder >> newAgentShapeForModel: anAgentModel [

	^ self masterAgent copyWithAnnouncer
		model: anAgentModel;
		yourself
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
		
	agentShapes := self createAgentShapes.
	aCanvas addAll: agentShapes.
		
	self update.
]

{ #category : #updating }
CMR3SpaceDiagramBuilder >> update [

	self updateCellShapes.
	self moveAgentShapes.
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
