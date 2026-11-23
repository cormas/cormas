"
I am the Roassal plot of the points of a `CMPointSeries`: a scatter plot whose points are large enough to see.

## Responsibility:

- I draw a point for each x and y value, as `RSScatterPlot` does.
- I make the points larger than its own, so that a few points are easy to see and click.

## Collaborators:

- `CMPointSeries class>>plotsOf:on:`: creates me for each series data it draws, with a translucent color so that the points behind others show.

## Public API and Key Messages

- `x:y:` and `color:`, inherited.

```
(CMPointsPlot new x: #( 1 2 3 ) y: #( 4 1 3 ))
	color: (Color blue alpha: 0.5);
	yourself
```
"
Class {
	#name : 'CMPointsPlot',
	#superclass : 'RSScatterPlot',
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'rendering' }
CMPointsPlot >> renderIn: aCanvas [

	super renderIn: aCanvas.
	ellipses do: [ :each | each radius: 5 ]
]
