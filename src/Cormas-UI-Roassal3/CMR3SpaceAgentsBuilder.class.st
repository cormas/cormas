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

	| position agent cell oldCell |
	
	position := anEvent camera fromPixelToSpace: anEvent position.
	
	agent := anEvent shape model.
	cell := self cellAt: position ifAbsent: [ nil ].
	
	oldCell := agent cell.
		
	cell
		ifNotNil: [
			self
				animateMove: anEvent shape
				from: position
				to: "cell" position
				duration: 250 milliSeconds.
			
			agent moveTo: cell model.
			
			agent positionInCell: (self positionInCell: cell model fromAbsolutePosition: position) ]
		ifNil: [ 
			self
				animateMove: anEvent shape
				from: position
				to: (anEvent canvas shapeFromModel: oldCell) position
				duration: 1 second ].
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> moveAgentShape: anAgentShape [

	| agent pov extent image |

	agent := anAgentShape model.

	(anAgentShape propertyAt: #RSLabeled) ifNotNil: [ :p |
		p text: agent labelOfPOV ].
	
	pov := agent perform: agent class activePovSelector.
	extent := anAgentShape extent / anAgentShape extent max * diagramBuilder maxExtent.
	
	pov isForImage ifTrue: [ 
		image := self selectScaledFormFrom: pov tile.
		anAgentShape paint: (self paintFromImage: (image scaledToSize: extent)) ].
		
	anAgentShape extent: extent.
	
	anAgentShape
		scaleBy: pov size;
		translateTo: (self positionForAgent: agent)
]

{ #category : 'accessing' }
CMR3SpaceAgentsBuilder >> objects [

	^ diagramBuilder cormasModel agents select: [ :each | each isSituated ]
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> offsetOfCell: aCell [
	"Calculate offset of a cell in a spatial grid. This accounts for the intersection of cell shapes such as hexagons or triangles. It also accounts for the shifting of the odd rows / columns"

	| config cellSize cellCoordinates intersectionProportion shiftProportionX shiftProportionY shiftProportion intersectionOffset offset |

	config := self neighbourhoodConfiguration.
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.
	
	cellCoordinates := aCell columnNumber @ aCell rowNumber.
	
	intersectionProportion :=
		config boundingRectangleHorizontalIntersection @
		config boundingRectangleVerticalIntersection.
		
	shiftProportionX := aCell rowNumber even
		ifTrue: [ config boundingRectangleHorizontalShiftEven ]
		ifFalse: [ config boundingRectangleHorizontalShiftOdd ].
		
	shiftProportionY := aCell columnNumber even
		ifTrue: [ config boundingRectangleVerticalShiftEven ]
		ifFalse: [ config boundingRectangleVerticalShiftOdd ].
		
	shiftProportion := shiftProportionX @ shiftProportionY.
	
	intersectionOffset := (cellCoordinates - 1) * intersectionProportion.
	offset := (cellCoordinates - 1) - intersectionOffset + shiftProportion.

	^ offset - config cellShapeOriginOffset
]

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> positionAgent: anAgent atProportion: aRelativePoint [
	"aRelativePoint is relative to a cell. 0@0 will place the agent in the top-left corner of the cell, 1@1 - bottom-right corner, 0.5@0.5 - center of the cell"

	| cell cellSize offset |
	
	cell := anAgent cell.
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.
	offset := self offsetOfCell: cell.

	^ (aRelativePoint + offset) * cellSize
]

{ #category : 'position in cell' }
CMR3SpaceAgentsBuilder >> positionForAgent: anAgent [

	^ self
		positionAgent: anAgent
		atProportion: anAgent positionInCell
]

{ #category : 'as yet unclassified' }
CMR3SpaceAgentsBuilder >> positionInCell: aCell fromAbsolutePosition: aPoint [

	|  cellSize offset |
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.
	offset := self offsetOfCell: aCell.
	
	^ aPoint / cellSize - offset
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
