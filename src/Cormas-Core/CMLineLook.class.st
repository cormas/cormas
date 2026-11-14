"
I describe the look of an entity drawn as a line: a link, or a network as a route along its links.

## Responsibility:

- Hold how thick the line is.
- Compute that thickness from an attribute, with `thicknessForValue:from:to:`.

## Collaborators:

- `CMLinkLook` and `CMNetworkLook` are my subclasses.

## Public API and Key Messages

- `thickness:`, `thickness`
- `thicknessForValue:from:to:`

I am abstract.

```
CMLinkLook new
	thicknessForValue: 250 from: 0 to: 500;
	thickness
```

## Internal Representation

- `thickness`: a `Number`, as a fraction of the side of a cell.
"
Class {
	#name : 'CMLineLook',
	#superclass : 'CMLook',
	#instVars : [
		'thickness'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
CMLineLook >> thickness [

	^ thickness
]

{ #category : 'accessing' }
CMLineLook >> thickness: aNumber [

	thickness := aNumber
]

{ #category : 'helpers' }
CMLineLook >> thicknessForValue: aNumber from: minimum to: maximum [
	"Use a thickness that goes from a thin line at the minimum to half a cell at the maximum. Values outside the range are clamped"

	thickness := 0.02 + (0.48 * (self fractionOf: aNumber from: minimum to: maximum))
]
