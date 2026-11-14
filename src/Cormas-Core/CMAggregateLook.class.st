"
I describe how an aggregate appears in a view: as a region that can be colored, with a border around it. I never change how its cells look.

## Responsibility:

- Hold the color of the region and of its border.
- Start transparent, with a visible border, so that an aggregate is seen without hiding its cells.

## Collaborators:

- An aspect of an aggregate fills me.
- A renderer draws me over the cells of the aggregate.

## Public API and Key Messages

- `color:`: a translucent color tints the cells, and an opaque one hides them.
- `borderColor:`, `borderThickness:`

```
aspectOwner: look
	<aspect>
	look
		color: (owner color alpha: 0.3);
		borderColor: owner color
```
"
Class {
	#name : 'CMAggregateLook',
	#superclass : 'CMAreaLook',
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMAggregateLook >> reset [

	super reset.
	color := Color transparent.
	borderColor := Color darkGray.
	borderThickness := 0.1
]
