"
I am a Roassal plot that draws the boxes of one probe of a `CMBoxplot`: at each step, a line from the minimum to the maximum, a box from the first to the third quartile, and a white line at the median.

## Responsibility:

- I draw a box at each step from the numbers recorded at that step, scaled by the chart I belong to.
- I compute the five numbers of a box: minimum, quartiles, median and maximum, interpolated as R and NumPy do by default.
- I share the width of a step with the boxes of the other probes of my chart, at my own place.

## Collaborators:

- `CMBoxplot>>plotsOf:` creates me from a `CMChartSeries`.
- `RSCompositeChart` gives me my scales, and `CMChart>>canvasOf:hiding:` hides my shapes.

## Public API and Key Messages

- `steps:spreads:` gives the steps and the numbers of each step.
- `place:of:` gives my place among the boxes of a step.
- `fiveNumbersOf:` returns the five numbers of a box.

```smalltalk
| chart |
chart := RSCompositeChart new.
chart add: (CMBoxesPlot new
		 steps: #( 0 1 2 ) spreads: #( #( 1 2 3 ) #( 2 4 6 ) #( 3 5 9 ) );
		 yourself).
chart
	minChartValueX: -1;
	maxChartValueX: 3;
	minChartValueY: 0;
	maxChartValueY: 10.
chart open
```

## Internal Representation

- `xValues`: the steps; `spreads`: the collection of numbers of each step; `yValues`: all the numbers, which set the extent of the chart.
- `place`, `numberOfPlaces`: my place among the boxes of a step.
- `boxShapes`: the shapes I drew.
"
Class {
	#name : 'CMBoxesPlot',
	#superclass : 'RSAbstractPlot',
	#instVars : [
		'spreads',
		'boxShapes',
		'place',
		'numberOfPlaces'
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

{ #category : 'accessing' }
CMBoxesPlot >> definedValuesX [
	"One step more on each side, so that the boxes of the first and last steps fit"

	^ {
		  (xValues first - 1).
		  (xValues last + 1) }
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
	place := 1.
	numberOfPlaces := 1.
	boxShapes := #(  )
]

{ #category : 'accessing' }
CMBoxesPlot >> place: anIndex of: aNumber [
	"Draw my boxes at the place anIndex of aNumber places side by side within each step"

	place := anIndex.
	numberOfPlaces := aNumber
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
	"Draw at each step a line from the minimum to the maximum, a box from the first to the third quartile, and a white line at the median"

	| stepWidth boxWidth color |
	super renderIn: aCanvas.
	stepWidth := (xScale scale: 1) - (xScale scale: 0).
	boxWidth := stepWidth * 0.8 / numberOfPlaces.
	color := self computeColor.
	boxShapes := OrderedCollection new.
	xValues with: spreads do: [ :step :numbers |
			| five center left right |
			five := (self fiveNumbersOf: numbers) collect: [ :each |
				        yScale scale: each ].
			center := (xScale scale: step) - (stepWidth * 0.4)
			          + (boxWidth * (place - 0.5)).
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
CMBoxesPlot >> steps: someSteps spreads: someCollections [
	"Draw a box at each of someSteps for the numbers of the collection at the same index of someCollections"

	xValues := someSteps.
	spreads := someCollections.
	yValues := someCollections flatCollect: [ :each | each ]
]
