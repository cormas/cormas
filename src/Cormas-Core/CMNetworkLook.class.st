"
I describe how a network appears in a view: as a route highlighted along its links. I never change how its links look.

## Responsibility:

- Hold the color and the thickness of the highlight.
- Start transparent, so that a network draws nothing more than its links until an aspect says otherwise.

## Collaborators:

- An aspect of a network fills me.
- A renderer draws me along the links of the network.

## Public API and Key Messages

- `color:`: a translucent color tints the links, and an opaque one hides them.
- `thickness:`, `thicknessForValue:from:to:`

```
aspectMainRoutes: look
	<aspect>
	look
		color: (Color yellow alpha: 0.4);
		thickness: 0.5
```
"
Class {
	#name : 'CMNetworkLook',
	#superclass : 'CMLineLook',
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMNetworkLook >> reset [

	super reset.
	color := Color transparent.
	thickness := 0.4
]
