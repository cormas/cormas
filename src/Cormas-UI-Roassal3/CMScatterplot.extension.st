Extension { #name : 'CMScatterplot' }

{ #category : '*Cormas-UI-Roassal3' }
CMScatterplot >> place: aSeriesData in: someCategories [
	"Return a copy of aSeriesData with each point at the position of its category on the x axis"

	| placed |
	placed := [ :point |
	          Point x: (someCategories indexOf: point x) y: point y ].
	^ CMSeriesData
		  named: aSeriesData name
		  color: aSeriesData color
		  steps: aSeriesData steps
		  values: (self isSingleStep
				   ifTrue: [
				   aSeriesData values collect: [ :points | points collect: placed ] ]
				   ifFalse: [ aSeriesData values collect: placed ])
]

{ #category : '*Cormas-UI-Roassal3' }
CMScatterplot >> plotOf: somePoints color: aColor [
	"Translucent points, so that the points behind them show"

	^ (CMPointsPlot new
		   x: (somePoints collect: [ :each | each x ])
		   y: (somePoints collect: [ :each | each y ]))
		  color: (aColor alpha: 0.5);
		  yourself
]

{ #category : '*Cormas-UI-Roassal3' }
CMScatterplot >> plotsOf: someSeries [
	"Points for each series that has values: at every step, or for the instances of a class at the last of their steps"

	| drawn lastStep |
	drawn := someSeries select: [ :each | each steps isNotEmpty ].
	self isSingleStep ifFalse: [
			^ drawn collect: [ :each |
				  each -> (self plotOf: each values color: each color) ] ].
	drawn ifEmpty: [ ^ #(  ) ].
	lastStep := (drawn collect: [ :each | each steps last ]) max.
	^ (drawn select: [ :each | each steps last = lastStep ]) collect: [
		  :each | each -> (self plotOf: each values last color: each color) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMScatterplot >> pointsOf: aSeriesData [
	"Return all the points of aSeriesData, at all its steps"

	^ self isSingleStep
		  ifTrue: [ aSeriesData values flatCollect: [ :each | each ] ]
		  ifFalse: [ aSeriesData values ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMScatterplot >> xCategoriesOf: someSeries [

	| xValues |
	xValues := (someSeries flatCollect: [ :each | self pointsOf: each ])
		           collect: [ :each | each x ].
	(xValues allSatisfy: [ :each | each isNumber ]) ifTrue: [ ^ #(  ) ].
	^ xValues asOrderedCollection
		  removeDuplicates;
		  yourself
]
