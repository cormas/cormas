"
I draw the whole space of a Cormas model: its grid of cells, its aggregates on top of the cells, its links on top of the aggregates, and its agents on top of everything.

## Responsibility:

- Show all the cells of my model in their grid positions.
- Show the aggregates that have something to draw, the ones with the highest `id` on top.
- Show the links with both ends on the grid, the ones with the highest `id` on top.
- Show the agents that are on a cell, at their position in that cell.
- Follow the model when `update` is sent: new and removed agents, moved agents and changed points of view.

## Collaborators:

- `CMModel`: answers the cells, the aggregates, the links and the agents.
- `CMBlAggregateShapeElement`: draws each aggregate.
- `CMBlLinkElement`: draws each link.
- `CMBlAgentElement`: draws each agent.

## Public API and Key Messages

- `for:` creates me for a model.
- `update` shows the current state of the model.

```
(CMBlSpaceElement for: aCormasModel) openInNewSpace
```

## Internal Representation

- `cormasModel`: the model I draw.
- `aggregateElements`: the elements of the visible aggregates, in drawing order.
- `linkElements`: the elements of the visible links, in drawing order.
- `agentElements`: the elements of the agents that have a cell.

An update keeps the elements of the entities still shown and refreshes them, and only adds or removes those of new or gone entities, at their place in the drawing order: removing and adding children is costly next to the many cells.

## Navigation and export

I fit my parent until the user navigates. `CMBlSpaceViewport` gives me the controls to navigate with the mouse and the keyboard.

- `zoomToFit`
- `zoomBy:at:`
- `panBy:`
- `saveToPngFile:` saves the whole space at its natural size, whatever the current zoom

Agents can be dragged onto another cell, and their links follow them during the drag. A left click on a link goes to the cell underneath. An agent dropped outside the grid goes back to where it was.
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
		'dragOrigin',
		'aggregateElements',
		'linkElements',
		'routeElements'
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

{ #category : 'private' }
CMBlSpaceElement >> elementsFor: someKeys reusing: someElements at: anIndex creating: aBlock [
	"Answer an element for each key, in order, as my children from anIndex on. An element whose key is still there is kept and refreshed, an element for a new key is created by aBlock and added at its place, and the others are removed. Removing and adding children costs much more than refreshing them, because I have a child for every cell"

	| byKey elements kept |
	byKey := Dictionary new.
	someElements do: [ :each | byKey at: each drawnKey put: each ].
	elements := someKeys collect: [ :each |
		            byKey at: each ifAbsent: [ aBlock value: each ] ].
	kept := elements asIdentitySet.
	self removeChildren:
		(someElements reject: [ :each | kept includes: each ]).
	elements withIndexDo: [ :each :index |
			each parent == self
				ifTrue: [ each refresh ]
				ifFalse: [ self addChild: each at: anIndex + index - 1 ] ].
	^ elements
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
	dragOrigin := anEvent position.
	self moveLinksOfDraggedElement
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

{ #category : 'interaction' }
CMBlSpaceElement >> handleLeftClick: anEvent [
	"A left click is about a cell, so it goes through a link to the cell underneath"

	(self entityTargetedBy: anEvent) ifNotNil: [ :entity |
		entity isLink ifTrue: [ ^ self handleLeftClickOnLink: anEvent ] ].
	super handleLeftClick: anEvent
]

{ #category : 'interaction' }
CMBlSpaceElement >> handleLeftClickOnLink: anEvent [

	| cellElement |
	cellElement := self
		               cellElementAt:
		               (self globalPointToLocal: anEvent position)
		               ifNone: [ ^ self ].
	anEvent consume.
	leftClickBlock value: cellElement entity
]

{ #category : 'initialization' }
CMBlSpaceElement >> initialize [

	super initialize.
	aggregateElements := #(  ).
	linkElements := #(  ).
	routeElements := #(  ).
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
CMBlSpaceElement >> isOnGrid: aLink [

	^ aLink ends allSatisfy: [ :end | end isOnGrid ]
]

{ #category : 'interaction' }
CMBlSpaceElement >> moveLinksOfDraggedElement [
	"The agent only moves when it is dropped, so tell its links where it is being dragged"

	| agent center |
	agent := draggedElement entity.
	center := draggedElement constraints position
	          + (draggedElement extent / 2).
	linkElements do: [ :each |
			(each link ends identityIncludes: agent) ifTrue: [
				each moveEnd: agent to: center ] ]
]

{ #category : 'private' }
CMBlSpaceElement >> newElementForAgent: anAgent [

	^ self place: (CMBlAgentElement for: anAgent observedBy: observer)
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

{ #category : 'private' }
CMBlSpaceElement >> place: anAgentElement [
	"Move anAgentElement to the position of its agent in its cell"

	| agent cell |
	agent := anAgentElement entity.
	cell := agent cell.
	^ anAgentElement
		  centerAt: (self gridPositionOfCell: cell) - gridOrigin
			  + (agent positionInCell * (self cellExtentOf: cell));
		  yourself
]

{ #category : 'updating' }
CMBlSpaceElement >> refresh [
	"Aggregates come after the cells, links after the aggregates, the routes of networks after the links, and agents last, so that each appears on top of the previous ones. The elements of the entities still shown are kept and refreshed. A new grid adds its cells after my other children, so these are removed first"

	| index |
	self showsCurrentCells ifFalse: [ self removeElementsOverTheCells ].
	super refresh.
	index := self childrenCount - aggregateElements size
	         - linkElements size - routeElements size
	         - agentElements size + 1.
	aggregateElements := self
		                     elementsFor: self visibleAggregates
		                     reusing: aggregateElements
		                     at: index
		                     creating: [ :each |
		                     CMBlAggregateShapeElement
			                     for: each
			                     observedBy: observer ].
	index := index + aggregateElements size.
	linkElements := self
		                elementsFor: self visibleLinks
		                reusing: linkElements
		                at: index
		                creating: [ :each |
		                CMBlLinkElement for: each observedBy: observer ].
	index := index + linkElements size.
	routeElements := self
		                 elementsFor: self routes
		                 reusing: routeElements
		                 at: index
		                 creating: [ :each |
			                 CMBlRouteElement
				                 for: each second
				                 of: each first
				                 observedBy: observer ].
	index := index + routeElements size.
	agentElements := self
		                 elementsFor:
		                 (cormasModel agents select: [ :each |
			                  each isSituated ])
		                 reusing: agentElements
		                 at: index
		                 creating: [ :each | self newElementForAgent: each ].
	agentElements do: [ :each | self place: each ]
]

{ #category : 'private' }
CMBlSpaceElement >> removeElementsOverTheCells [

	self removeChildren:
		aggregateElements , linkElements , routeElements , agentElements.
	aggregateElements := #(  ).
	linkElements := #(  ).
	routeElements := #(  ).
	agentElements := #(  )
]

{ #category : 'private' }
CMBlSpaceElement >> routes [
	"Answer a network and one of its links on the grid, for each link that a visible network highlights, in drawing order"

	^ self visibleNetworks flatCollect: [ :network |
			  (network links select: [ :each | self isOnGrid: each ]) collect: [
					  :each |
					  {
						  network.
						  each } ] ]
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

{ #category : 'updating' }
CMBlSpaceElement >> visibleAggregates [
	"Answer the aggregates to draw, the ones to appear on top last. Aggregates released by a merge stay dead in the model until the simulation step ends"

	^ ((cormasModel allEntitiesOfClass: CMSpatialEntityAggregate)
		   select: [ :each |
		   each isDead not and: [ (observer lookOf: each) isVisible ] ])
		  sorted: [ :a :b | a id < b id ]
]

{ #category : 'updating' }
CMBlSpaceElement >> visibleLinks [
	"Answer the links to draw, with both ends on the grid, the ones to appear on top last"

	^ (cormasModel links select: [ :each |
		   (self isOnGrid: each) and: [ (observer lookOf: each) isVisible ] ])
		  sorted: [ :a :b | a id < b id ]
]

{ #category : 'updating' }
CMBlSpaceElement >> visibleNetworks [
	"Answer the networks whose look draws something over their links, the ones to appear on top last"

	^ ((cormasModel allEntitiesOfClass: CMNetwork) select: [ :each |
			   | look |
			   look := observer lookOf: each.
			   each isDead not and: [
				   look isVisible and: [ look color alpha > 0 ] ] ]) sorted: [ :a :b |
		  a id < b id ]
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
