"
I draw the whole space of a Cormas model: its grid of cells, and its agents on top.

## Responsibility:

- Show all the cells of my model in their grid positions.
- Show the agents that are on a cell, at their position in that cell.
- Follow the model when `update` is sent: new and removed agents, moved agents and changed points of view.

## Collaborators:

- `CMModel`: answers the cells and the agents.
- `CMBlAgentElement`: draws each agent.

## Public API and Key Messages

- `for:` creates me for a model.
- `update` shows the current state of the model.

```
(CMBlSpaceElement for: aCormasModel) openInNewSpace
```

## Internal Representation

- `cormasModel`: the model I draw.
- `agentElements`: the elements of the agents, recreated by each update.

## Navigation and export

I fit my parent until the user navigates. `CMBlSpaceViewport` gives me the controls to navigate with the mouse and the keyboard.

- `zoomToFit`
- `zoomBy:at:`
- `panBy:`
- `saveToPngFile:` saves the whole space at its natural size, whatever the current zoom

Agents can be dragged onto another cell. An agent dropped outside the grid goes back to where it was.
"
Class {
	#name : 'CMBlSpaceElement',
	#superclass : 'CMBlCellGroupElement',
	#instVars : [
		'cormasModel',
		'agentElements',
		'zoom',
		'offset',
		'followsParent',
		'draggedElement',
		'dragOrigin'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlSpaceElement class >> exampleMockModel [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: model
]

{ #category : 'examples' }
CMBlSpaceElement class >> scriptOpenMockModel [

	<script>
	^ (CMBlSpaceViewport on: self exampleMockModel) openInNewSpace
]

{ #category : 'navigation' }
CMBlSpaceElement >> applyNavigation [
	"A transformation applies its last step first, so the point is scaled before it is moved"

	self transformDo: [ :transform |
			transform
				topLeftOrigin;
				translateBy: offset / zoom;
				scaleBy: zoom ]
]

{ #category : 'interaction' }
CMBlSpaceElement >> cellElementAt: aPoint ifNone: aBlock [
	"Answer the element of the cell whose shape contains aPoint, in my coordinates. The boxes of neighbouring cells can overlap, so their shape decides"

	^ cellElements
		  detect: [ :each |
		  each containsPoint: (each parentPointToLocal: aPoint) ]
		  ifNone: aBlock
]

{ #category : 'accessing' }
CMBlSpaceElement >> cells [

	^ cormasModel cells
]

{ #category : 'interaction' }
CMBlSpaceElement >> dropAgentOfElement: anAgentElement [
	"The position of the element itself is only up to date after the next layout, and its constraints already know where it is going"

	| center |
	center := anAgentElement constraints position
	          + (anAgentElement extent / 2).
	(self cellElementAt: center ifNone: [ ^ self ]) in: [ :cellElement |
			anAgentElement entity
				moveTo: cellElement entity;
				positionInCell:
					(cellElement parentPointToLocal: center) / cellElement extent ]
]

{ #category : 'navigation' }
CMBlSpaceElement >> fitIfFollowingParent [
	"Nothing can be fitted while the size of my parent or my own is still unknown"

	| available |
	followsParent ifFalse: [ ^ self ].
	self hasParent ifFalse: [ ^ self ].
	available := self parent extent.
	(available min > 0 and: [ self extent min > 0 ]) ifFalse: [ ^ self ].
	zoom := available x / self extent x min: available y / self extent y.
	offset := available - (self extent * zoom) / 2.
	self applyNavigation
]

{ #category : 'interaction' }
CMBlSpaceElement >> handleDrag: anEvent [

	draggedElement ifNil: [ ^ self ].
	anEvent consume.
	draggedElement position: draggedElement constraints position
		+ (anEvent position - dragOrigin / zoom).
	dragOrigin := anEvent position
]

{ #category : 'interaction' }
CMBlSpaceElement >> handleDragEnd: anEvent [
	"An update puts the agent where it belongs, also when it was dropped outside the grid"

	draggedElement ifNil: [ ^ self ].
	anEvent consume.
	self dropAgentOfElement: draggedElement.
	draggedElement := nil.
	self update
]

{ #category : 'interaction' }
CMBlSpaceElement >> handleDragStart: anEvent [
	"Only agents are dragged. Any other drag is left to whoever pans me"

	(agentElements includes: anEvent target) ifFalse: [ ^ self ].
	anEvent consume.
	draggedElement := anEvent target.
	dragOrigin := anEvent position
]

{ #category : 'initialization' }
CMBlSpaceElement >> initialize [

	super initialize.
	agentElements := #(  ).
	zoom := 1.
	offset := 0 @ 0.
	followsParent := true.
	self
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ self fitIfFollowingParent ];
		addEventHandlerOn: BlDragStartEvent
		do: [ :event | self handleDragStart: event ];
		addEventHandlerOn: BlDragEvent
		do: [ :event | self handleDrag: event ];
		addEventHandlerOn: BlDragEndEvent
		do: [ :event | self handleDragEnd: event ]
]

{ #category : 'updating' }
CMBlSpaceElement >> newElementForAgent: anAgent [

	| cell |
	cell := anAgent cell.
	^ (CMBlAgentElement for: anAgent)
		  centerAt: (self gridPositionOfCell: cell) - gridOrigin
			  + (anAgent positionInCell * (self cellExtentOf: cell));
		  yourself
]

{ #category : 'initialization' }
CMBlSpaceElement >> onAddedToParent [

	super onAddedToParent.
	self parent
		addEventHandlerOn: BlElementExtentChangedEvent
		do: [ self fitIfFollowingParent ].
	self fitIfFollowingParent
]

{ #category : 'navigation' }
CMBlSpaceElement >> panBy: aPoint [
	"Move what I show by aPoint, in the coordinates of my parent"

	self inSpaceDo: [
			followsParent := false.
			offset := offset + aPoint.
			self applyNavigation ]
]

{ #category : 'updating' }
CMBlSpaceElement >> refresh [
	"Agents are added after the cells so that they appear on top of them"

	self removeChildren: agentElements.
	super refresh.
	agentElements := (cormasModel agents select: [ :each |
		                  each isSituated ]) collect: [ :each |
		                 self newElementForAgent: each ].
	self addChildren: agentElements
]

{ #category : 'export' }
CMBlSpaceElement >> saveToPngFile: aFileReference [
	"Save a picture of the whole space at its natural size, whatever the current zoom"

	| form |
	form := (self class for: cormasModel) aeAsForm.
	aFileReference ensureDelete.
	aFileReference binaryWriteStreamDo: [ :stream |
		PNGReadWriter putForm: form onStream: stream ]
]

{ #category : 'initialization' }
CMBlSpaceElement >> setUpFor: aCormasModel [

	cormasModel := aCormasModel.
	super setUpFor: aCormasModel
]

{ #category : 'navigation' }
CMBlSpaceElement >> zoomBy: aNumber at: aPoint [
	"Change my zoom by a factor, keeping still what is shown at aPoint in the coordinates of my parent"

	self inSpaceDo: [
			followsParent := false.
			offset := aPoint - (aPoint - offset * aNumber).
			zoom := zoom * aNumber.
			self applyNavigation ]
]

{ #category : 'navigation' }
CMBlSpaceElement >> zoomToFit [
	"Show the whole space in my parent, also when my parent changes size later"

	self inSpaceDo: [
			followsParent := true.
			self fitIfFollowingParent ]
]
