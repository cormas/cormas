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
"
Class {
	#name : 'CMBlSpaceElement',
	#superclass : 'CMBlCellGroupElement',
	#instVars : [
		'cormasModel',
		'agentElements'
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
	^ self exampleMockModel openInNewSpace
]

{ #category : 'accessing' }
CMBlSpaceElement >> cells [

	^ cormasModel cells
]

{ #category : 'initialization' }
CMBlSpaceElement >> initialize [

	super initialize.
	agentElements := #(  )
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

{ #category : 'initialization' }
CMBlSpaceElement >> setUpFor: aCormasModel [

	cormasModel := aCormasModel.
	super setUpFor: aCormasModel
]
