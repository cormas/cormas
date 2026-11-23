"
I am a Roassal plot that draws bars, each from a bottom to a top, at values on x. I draw a `CMBarSeries`.

## Responsibility:

- I draw a box at each value on x whose bottom and top differ, as wide as 0.8 of a unit on x, so that the bars of consecutive steps do not touch.
- I give the chart my bottoms and tops, so that its y axis reaches below zero when a bar does.

## Collaborators:

- `CMBarSeries` makes me from the stacks it computes.
- `RSCompositeChart` gives me the scales of its axes.

## Public API and Key Messages

- `x:from:to:` sets the values on x and the bottom and top of the bar at each of them.

```smalltalk
CMBarsPlot new x: #( 1 2 3 ) from: #( 0 -2 0 ) to: #( 4 0 3 )
```

## Internal Representation

- `xValues`, `yValues`: the values on x and the tops of the bars; `bottoms`: their bottoms.
- `bars`: the boxes drawn, which the legend hides and shows.
"
Class {
	#name : 'CMBarsPlot',
	#superclass : 'RSAbstractPlot',
	#instVars : [
		'bottoms',
		'bars'
	],
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'accessing' }
CMBarsPlot >> createdShapes [

	^ bars
]

{ #category : 'accessing' }
CMBarsPlot >> defaultShape [

	^ RSBox new
]

{ #category : 'rendering' }
CMBarsPlot >> definedValuesY [

	^ yValues , bottoms
]

{ #category : 'initialization' }
CMBarsPlot >> initialize [

	super initialize.
	bars := #(  )
]

{ #category : 'rendering' }
CMBarsPlot >> renderIn: aCanvas [
	"Draw a bar at each value on x whose bottom and top differ, as wide as 0.8 of a unit on x, so that the bars of consecutive steps do not touch"

	| halfWidth color |
	super renderIn: aCanvas.
	halfWidth := (xScale scale: 1) - (xScale scale: 0) * 0.4.
	color := self computeColor.
	bars := OrderedCollection new.
	1 to: xValues size do: [ :index |
			| center |
			(bottoms at: index) = (yValues at: index) ifFalse: [
					center := xScale scale: (xValues at: index).
					bars add: (self shape copy
							 fromRectangle: (Rectangle
									  origin:
										  center - halfWidth @ (yScale scale: (yValues at: index))
									  corner:
										  center + halfWidth @ (yScale scale: (bottoms at: index)));
							 color: color;
							 model: #bar;
							 yourself) ] ].
	aCanvas addAll: bars
]

{ #category : 'accessing' }
CMBarsPlot >> x: someValues from: someBottoms to: someTops [
	"Draw a bar at each of someValues on x, from the bottom to the top at the same index"

	xValues := someValues.
	bottoms := someBottoms.
	yValues := someTops
]
