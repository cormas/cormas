Class {
	#name : 'CMR3SpaceAgentsBuilder',
	#superclass : 'CMR3SpaceShapeBuilder',
	#instVars : [
		'isDraggable'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> animateMove: anShape from: oldPosition to: newPosition duration: aDuration [


	diagramBuilder container newAnimation
			duration: aDuration;
			from: oldPosition;
			to: newPosition;
			easing: RSEasingInterpolator circleOut;
			onStepDo: [ :t |
				anShape position: t.
				anShape signalUpdate ]
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> cellAt: aPoint ifAbsent: absentBlock [
	" Answer the <RSShape> which contains aPoint in the receiver "

	^ diagramBuilder cellShapes
		detect: [ :roassalNode | roassalNode encompassingRectangle containsPoint: aPoint ]
		ifNone: absentBlock
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> contextMenuItemsFor: anEntity [

	^ (super contextMenuItemsFor: anEntity), { CMKillSpaceContextMenuCommand forOwner: anEntity }
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> defaultMasterShape [

	^ RSShapeFactory star
		size: 16;
		yourself.
]

{ #category : 'initialization' }
CMR3SpaceAgentsBuilder >> initialize [

	super initialize.
	isDraggable := true
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> isDraggable [

	^ isDraggable
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> isDraggable: aBoolean [

	isDraggable := aBoolean
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> makeAgentShapeDraggable: anAgentShape [

	"Adding property to be draggable"
	anAgentShape @ RSDraggable.
	
	anAgentShape when: RSMouseDragEnd send: #mouseEnd: to: self.
]

{ #category : 'events' }
CMR3SpaceAgentsBuilder >> mouseEnd: anEvent [

	| position agent cell oldPatch |
	
	position := anEvent camera fromPixelToSpace: anEvent position.
	
	agent := anEvent shape model.
	cell := (self cellAt: position ifAbsent: [ nil ]).
	
	oldPatch := agent patch.
		
	agent moveTo: (cell
		ifNotNil: [
			self
				animateMove: anEvent shape
				from: position
				to: cell position
				duration: 250 milliSeconds.
			
			cell model ]
		ifNil: [ 
			self
				animateMove: anEvent shape
				from: position
				to: (anEvent canvas shapeFromModel: oldPatch) position
				duration: 1 second.
			
			oldPatch ]).
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> moveAgentShape: anAgentShape [

	| agent cell cellSize pov |
			
	agent := anAgentShape model.
	
	cell := agent patch.
	cell ifNil: [ ^ self ].
	
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.

	(anAgentShape propertyAt: #RSLabeled) ifNotNil: [ :p |
		p text: agent labelOfPOV ].
	
	pov := agent perform: agent class activePovSelector.
	
	pov isForImage ifTrue: [ 
		anAgentShape
			paint: (self paintFromImage: pov image);
			extent: pov image extent ].
	
	anAgentShape
		scaleBy: 16 / anAgentShape extent max * pov size;
		translateTo: (cell columnNumber @ cell rowNumber * cellSize) - (cellSize / 2)
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> objects [

	^ diagramBuilder cormasModel agents select: [ :each | each isSituated ]
]

{ #category : 'hooks' }
CMR3SpaceAgentsBuilder >> shapeFor: anObject index: aNumber [

	| pov shape |
	pov := anObject perform: anObject class activePovSelector.
	
	self masterShape: ((RSShapeFactory perform: pov shape)
		color: pov color;
		extent: 20@20;
		yourself).
			
	shape := super shapeFor: anObject index: aNumber.
	
	shape model: anObject.
		
	isDraggable ifTrue: [
		self makeAgentShapeDraggable: shape ].
	
	^ shape
]

{ #category : 'updating' }
CMR3SpaceAgentsBuilder >> update [
	
	shapes do:#remove.
	self container
		addAll: (shapes := self shapesFor: self objects).
	shapes do: [ :each | self updateShape: each ].
]

{ #category : 'updating' }
CMR3SpaceAgentsBuilder >> updateShape: aShape [

	self moveAgentShape: aShape.
	
	Transcript show: diagramBuilder cormasModel agents size; cr.
]
