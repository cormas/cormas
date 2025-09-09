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

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> centeredPositionForAgent: anAgent [
	"Place an agent in the center of the cell"

	^ self
		positionAgent: anAgent
		atProportion: 0.5@0.5
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

	| position agent cell oldCell |
	
	position := anEvent camera fromPixelToSpace: anEvent position.
	
	agent := anEvent shape model.
	cell := (self cellAt: position ifAbsent: [ nil ]).
	
	oldCell := agent cell.
		
	agent moveTo: (cell
		ifNotNil: [
			self
				animateMove: anEvent shape
				from: position
				to: "cell" position
				duration: 250 milliSeconds.
			
			cell model ]
		ifNil: [ 
			self
				animateMove: anEvent shape
				from: position
				to: (anEvent canvas shapeFromModel: oldCell) position
				duration: 1 second.
			
			oldCell ]).
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> moveAgentShape: anAgentShape [

	| agent pov extent |

	agent := anAgentShape model.

	(anAgentShape propertyAt: #RSLabeled) ifNotNil: [ :p |
		p text: agent labelOfPOV ].
	
	pov := agent perform: agent class activePovSelector.
	extent := anAgentShape extent / anAgentShape extent max * diagramBuilder maxExtent.
	
	pov isForImage ifTrue: [ 
		anAgentShape paint: (self paintFromImage: (pov image scaledToSize: extent)) ].
		
	anAgentShape extent: extent.
	
	anAgentShape
		scaleBy: pov size;
		translateTo: (self positionForAgent: agent)
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> objects [

	^ diagramBuilder cormasModel agents select: [ :each | each isSituated ]
]

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> positionAgent: anAgent atProportion: aRelativePoint [
	"aRelativePoint is relative to a cell. 0@0 will place the agent in the top-left corner of the cell, 1@1 - bottom-right corner, 0.5@0.5 - center of the cell"

	| cell cellCoordinates cellSize offset intersectionProportion shiftProportionX shiftProportionY shiftProportion borderOffset intersectionOffset config |
	
	cell := anAgent cell.
	config := diagramBuilder cormasModel spaceModel neighbourhoodConfiguration.
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.
	
	cellCoordinates := cell columnNumber @ cell rowNumber.
	
	intersectionProportion :=
		config boundingRectangleHorizontalIntersection @
		config boundingRectangleVerticalIntersection.
		
	shiftProportionX := cell rowNumber even
		ifTrue: [ config boundingRectangleHorizontalShiftEven ]
		ifFalse: [ config boundingRectangleHorizontalShiftOdd ].
		
	shiftProportionY := cell columnNumber even
		ifTrue: [ config boundingRectangleVerticalShiftEven ]
		ifFalse: [ config boundingRectangleVerticalShiftOdd ].
		
	shiftProportion := shiftProportionX @ shiftProportionY.
	
	borderOffset := ((cell pov borderWidth / 4) * (cellCoordinates x - 1)) @ 0.
	
	intersectionOffset := (cellCoordinates - 1) * intersectionProportion.
	offset := (cellCoordinates - 1) - intersectionOffset + shiftProportion + borderOffset.

	^ (offset + aRelativePoint) * cellSize
]

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> positionForAgent: anAgent [
	"This method should be modified to define the logic of choosing agent position (for example, based on the POV). For now, we have two options: #centeredPositionForAgent: and #randomPositionForAgent:"
	
	^ self centeredPositionForAgent: anAgent
]

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> randomPositionForAgent: anAgent [
	"Place an agent at a random location inside a cell"
	| x y |
	x := anAgent random.
	y := anAgent random.

	^ self
		positionAgent: anAgent
		atProportion: x@y
]

{ #category : 'hooks' }
CMR3SpaceAgentsBuilder >> shapeFor: anObject index: aNumber [

	| pov shape |
	pov := anObject perform: anObject class activePovSelector.

	self masterShape: ((RSShapeFactory perform: pov shape)
			 color: pov color;
			 extent: 20 @ 20;
			 yourself).

	shape := super shapeFor: anObject index: aNumber.

	shape model: anObject.

	isDraggable ifTrue: [ self makeAgentShapeDraggable: shape ].

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

	self moveAgentShape: aShape
]
