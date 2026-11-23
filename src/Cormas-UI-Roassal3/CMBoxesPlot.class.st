"
I am a Roassal plot that draws the boxes of a `CMBoxSeries`: at each value on x, a line from the minimum to the maximum, a box from the first to the third quartile, and a white line at the median.

## Responsibility:

- I draw a box at each value on x from the numbers gathered there, scaled by the chart I belong to.
- I compute the five numbers of a box: minimum, quartiles, median and maximum, interpolated as R and NumPy do by default.
- I share the space of a value on x with the boxes that other box series of my chart draw at the same value, at my own place; a box alone at its value is centered on it.

## Collaborators:

- `CMBoxSeries class>>plotsOf:on:` creates me from a `CMSeriesData`.
- `RSCompositeChart` gives me my scales, and `CMChart>>canvasOf:hiding:` hides my shapes.

## Public API and Key Messages

- `x:spreads:` gives the values on x and the numbers at each of them.
- `places:` gives my place, and the number of places, among the boxes of each value on x.
- `fiveNumbersOf:` returns the five numbers of a box.

```smalltalk
| chart |
chart := RSCompositeChart new.
chart add: (CMBoxesPlot new
		 x: #( 0 1 2 ) spreads: #( #( 1 2 3 ) #( 2 4 6 ) #( 3 5 9 ) );
		 yourself).
chart
	minChartValueX: -1;
	maxChartValueX: 3;
	minChartValueY: 0;
	maxChartValueY: 10.
chart open
```

## Internal Representation

- `xValues`: the values on x; `spreads`: the collection of numbers at each of them; `yValues`: all the numbers, which set the extent of the chart.
- `places`: for each value on x, an association of my place and of the number of boxes side by side there.
- `boxShapes`: the shapes I drew.
"
Class {
	#name : 'CMBoxesPlot',
	#superclass : 'RSAbstractPlot',
	#instVars : [
		'spreads',
		'boxShapes',
		'places'
	],
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'accessing' }
CMBoxesPlot >> createdShapes [

	^ boxShapes
]

{ #category : 'accessing - defaults' }
CMBoxesPlot >> defaultShape [

	^ RSBox new
]

{ #category : 'statistics' }
CMBoxesPlot >> fiveNumbersOf: someNumbers [
	"Return the minimum, the first quartile, the median, the third quartile and the maximum of someNumbers. Quartiles are interpolated between the two closest values, as R and NumPy do by default"

	| sorted |
	sorted := someNumbers asArray sorted.
	^ {
		  0.
		  (1 / 4).
		  (1 / 2).
		  (3 / 4).
		  1 } collect: [ :each | self quantile: each ofSorted: sorted ]
]

{ #category : 'initialization' }
CMBoxesPlot >> initialize [

	super initialize.
	places := #(  ).
	boxShapes := #(  )
]

{ #category : 'accessing' }
CMBoxesPlot >> places: somePlaces [
	"At each of my values on x, draw my box at a place among the boxes side by side there: somePlaces has an association of the place and of the number of places for each value on x, in the same order"

	places := somePlaces
]

{ #category : 'statistics' }
CMBoxesPlot >> quantile: aFraction ofSorted: someNumbers [

	| position below |
	position := someNumbers size - 1 * aFraction + 1.
	below := position floor.
	below = someNumbers size ifTrue: [ ^ someNumbers last ].
	^ (someNumbers at: below) + (position - below
	   * ((someNumbers at: below + 1) - (someNumbers at: below)))
]

{ #category : 'rendering' }
CMBoxesPlot >> renderIn: aCanvas [
	"Draw at each value on x a line from the minimum to the maximum, a box from the first to the third quartile, and a white line at the median"

	| stepWidth color |
	super renderIn: aCanvas.
	stepWidth := (xScale scale: 1) - (xScale scale: 0).
	color := self computeColor.
	boxShapes := OrderedCollection new.
	xValues doWithIndex: [ :step :index |
			| place five boxWidth center left right |
			place := places at: index.
			five := (self fiveNumbersOf: (spreads at: index)) collect: [ :each |
				        yScale scale: each ].
			boxWidth := stepWidth * 0.8 / place value.
			center := (xScale scale: step) - (stepWidth * 0.4)
			          + (boxWidth * (place key - 0.5)).
			left := center - (boxWidth / 2).
			right := center + (boxWidth / 2).
			boxShapes add: (RSLine new
					 from: center @ five first;
					 to: center @ five last;
					 color: color;
					 yourself).
			boxShapes add: (RSBox new
					 fromRectangle:
						 (Rectangle
							  origin: left @ (five at: 4)
							  corner: right @ (five at: 2));
					 color: color;
					 model: #box;
					 yourself).
			boxShapes add: (RSLine new
					 from: left @ (five at: 3);
					 to: right @ (five at: 3);
					 color: Color white;
					 yourself) ].
	aCanvas addAll: boxShapes
]

{ #category : 'accessing' }
CMBoxesPlot >> x: someValues spreads: someCollections [
	"Draw a box at each of someValues on x for the numbers of the collection at the same index of someCollections, alone at its value until places: says otherwise"

	xValues := someValues.
	spreads := someCollections.
	yValues := someCollections flatCollect: [ :each | each ].
	places := someValues collect: [ :each | 1 -> 1 ]
]
