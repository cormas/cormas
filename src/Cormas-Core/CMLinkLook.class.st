"
I describe how a link appears in a view: a line with a color and a thickness, and an arrowhead that shows its direction.

## Responsibility:

- Hold the color, the thickness and the arrowhead of the line.
- Start with a thin black line, so that links are drawn even when their model defines no aspect.

## Collaborators:

- An aspect of a link fills me.
- A renderer draws me between the two ends of the link.

## Public API and Key Messages

- `color:`, `thickness:`, `thicknessForValue:from:to:`
- `hasArrowhead:`, `hasArrowhead`

```
aspectWear: look
	<aspect>
	look
		color: Color darkGray;
		thicknessForValue: traffic from: 0 to: 500;
		hasArrowhead: true
```

## Internal Representation

- `hasArrowhead`: a `Boolean`.
"
Class {
	#name : 'CMLinkLook',
	#superclass : 'CMLineLook',
	#instVars : [
		'hasArrowhead'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
CMLinkLook >> hasArrowhead [

	^ hasArrowhead
]

{ #category : 'accessing' }
CMLinkLook >> hasArrowhead: aBoolean [

	hasArrowhead := aBoolean
]

{ #category : 'initialization' }
CMLinkLook >> reset [

	super reset.
	color := Color black.
	thickness := 0.03.
	hasArrowhead := false
]
