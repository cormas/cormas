Class {
	#name : #CMR3SpaceAgentsBuilder,
	#superclass : #CMR3SpaceShapeBuilder,
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #'as yet unclassified' }
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

{ #category : #accessing }
CMR3SpaceAgentsBuilder >> cellAt: aPoint ifAbsent: absentBlock [
	" Answer the <RSShape> which contains aPoint in the receiver "

	^ diagramBuilder cellShapes
		detect: [ :roassalNode | roassalNode encompassingRectangle containsPoint: aPoint ]
		ifNone: absentBlock
]

{ #category : #'as yet unclassified' }
CMR3SpaceAgentsBuilder >> defaultMasterShape [

	^ RSShapeFactory star
		size: 25;
		yourself.
]

{ #category : #'as yet unclassified' }
CMR3SpaceAgentsBuilder >> makeAgentShapeDraggable: anAgentShape [

	"Adding property to be draggable"
	anAgentShape @ RSDraggable.
	
	anAgentShape when: RSMouseDragEnd send: #mouseEnd: to: self.
]

{ #category : #accessing }
CMR3SpaceAgentsBuilder >> masterShape: aShape [

	super masterShape: aShape.
	self makeAgentShapeDraggable: aShape.
]

{ #category : #events }
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

{ #category : #'as yet unclassified' }
CMR3SpaceAgentsBuilder >> moveAgentShape: anAgentShape [

	| agent cell cellSize |
			
	agent := anAgentShape model.
	cell := agent patch.
	cellSize := diagramBuilder cellShapes anyOne encompassingRectangle extent.

	(anAgentShape propertyAt: #RSLabeled) ifNotNil: [ :p |
		p text: agent labelOfPOV ].
	
	anAgentShape
		"@ (RSPopup text: agent detailsOfPOV);"
		size: agent sizeOfPOV;
		color: agent pov;
		translateTo: (cell columnNumber @ cell rowNumber * cellSize) - (cellSize / 2)
]

{ #category : #accessing }
CMR3SpaceAgentsBuilder >> objects [

	^ diagramBuilder cormasModel theAgents
]

{ #category : #updating }
CMR3SpaceAgentsBuilder >> updateShape: aShape [

	self moveAgentShape: aShape
]
