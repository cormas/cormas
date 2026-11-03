"
I draw an agent as a shape, according to its active point of view. I can be shown on my own, even if the agent is not on a cell.

## Responsibility:

- Show the color, shape and size of the point of view of my agent.
- Know which shapes a point of view may ask for, and reject the others.

## Collaborators:

- `CMAgent`: answers the point of view to show.
- `CMPointOfView`: holds the color, the shape symbol and the size relative to a cell.

## Public API and Key Messages

- `for:` creates me for an agent.
- `update` shows the current point of view.
- `centerAt:` places my center in the coordinates of my parent.

```
(CMBlAgentElement for: anAgent) openInNewSpace
```

## Internal Representation

- `agent`: the agent I draw.
"
Class {
	#name : 'CMBlAgentElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'agent'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlAgentElement class >> exampleCow [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: (model entitiesOfClass: CMMockCow) first
]

{ #category : 'accessing' }
CMBlAgentElement class >> polygonShapes [
	"Answer the vertices of each polygon shape, with 0@0 and 1@1 as opposite corners of the box around the shape"

	^ Dictionary newFrom: {
			  (#square -> {
				   (0 @ 0).
				   (1 @ 0).
				   (1 @ 1).
				   (0 @ 1) }).
			  (#diamond -> {
				   (0.5 @ 0).
				   (1 @ 0.5).
				   (0.5 @ 1).
				   (0 @ 0.5) }).
			  (#triangle -> {
				   (0.5 @ 0).
				   (1 @ 1).
				   (0 @ 1) }).
			  (#hexagon -> {
				   (0.25 @ 0).
				   (0.75 @ 0).
				   (1 @ 0.5).
				   (0.75 @ 1).
				   (0.25 @ 1).
				   (0 @ 0.5) }).
			  (#star -> self starVertices) }
]

{ #category : 'accessing' }
CMBlAgentElement class >> starVertices [
	"Answer a five-pointed star with a tip at the top, alternating between tips and notches"

	^ (0 to: 9) collect: [ :index |
			  | radius angle |
			  radius := index even
				            ifTrue: [ 0.5 ]
				            ifFalse: [ 0.2 ].
			  angle := Float pi * index / 5 - Float halfPi.
			  0.5 + (radius * angle cos) @ (0.5 + (radius * angle sin)) ]
]

{ #category : 'accessing' }
CMBlAgentElement class >> supportedShapes [

	^ self polygonShapes keys asSortedCollection asArray , #( circle )
]

{ #category : 'geometry' }
CMBlAgentElement >> centerAt: aPoint [

	self position: aPoint - (self side / 2)
]

{ #category : 'geometry' }
CMBlAgentElement >> geometryForShape: aSymbol [

	| vertices side |
	aSymbol = #circle ifTrue: [ ^ BlCircleGeometry new ].

	vertices := self class polygonShapes at: aSymbol ifAbsent: [
			            self error:
				            'Unknown agent shape #' , aSymbol
				            , '. Supported shapes are: '
				            , (', ' join: self class supportedShapes) ].

	side := self side.
	^ BlPolygonGeometry vertices:
		  (vertices collect: [ :each | each * side ])
]

{ #category : 'updating' }
CMBlAgentElement >> refresh [

	| pov side |
	pov := agent activePov.
	side := self side.
	self
		extent: side @ side;
		background: (self
				 backgroundOfPov: pov
				 in: (agent cormasModel ifNotNil: [ :model | model spaceModel ])
				 extent: side @ side);
		geometry: (self geometryForShape: pov shape)
]

{ #category : 'initialization' }
CMBlAgentElement >> setUpFor: anAgent [

	agent := anAgent.
	self refresh
]

{ #category : 'geometry' }
CMBlAgentElement >> side [
	"Answer the size in pixels of the box around my shape. The point of view expresses it relative to the size of a cell"

	^ agent activePov size * self cellSize
]
