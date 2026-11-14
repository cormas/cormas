"
I describe the look of an entity that covers an area, with a line around it: a cell, an agent or an aggregate.

## Responsibility:

- Hold the color and the thickness of the line around the entity, its border.
- Give my subclasses the same words for that border.

## Collaborators:

- `CMCellLook`, `CMAgentLook` and `CMAggregateLook` are my subclasses.

## Public API and Key Messages

- `borderColor:`, `borderColor`
- `borderThickness:`, `borderThickness`

I am abstract.

```
CMCellLook new
	borderColor: Color black;
	borderThickness: 0.05;
	yourself
```

## Internal Representation

- `borderColor`: a `Color`.
- `borderThickness`: a `Number`, as a fraction of the side of a cell. Zero draws no border.
"
Class {
	#name : 'CMAreaLook',
	#superclass : 'CMLook',
	#instVars : [
		'borderColor',
		'borderThickness'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
CMAreaLook >> borderColor [

	^ borderColor
]

{ #category : 'accessing' }
CMAreaLook >> borderColor: aColor [

	borderColor := aColor
]

{ #category : 'accessing' }
CMAreaLook >> borderThickness [

	^ borderThickness
]

{ #category : 'accessing' }
CMAreaLook >> borderThickness: aNumber [

	borderThickness := aNumber
]

{ #category : 'initialization' }
CMAreaLook >> reset [

	super reset.
	borderColor := Color veryLightGray.
	borderThickness := 0.01
]
