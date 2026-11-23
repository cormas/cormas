Extension { #name : 'CMHistogramSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMHistogramSeries class >> binsOf: someNumbers on: aChart [
	"Return the limits of about thirty bins, evenly spaced over someNumbers, at round numbers, so that the bars draw the shape of the distribution. Whole numbers each have a bin of their own when they are close enough. Other limits are floats, so that a float equal to a limit is compared with it exactly"

	(someNumbers allSatisfy: [ :each | each isInteger ]) ifTrue: [
			^ aChart
				  ticksFrom: someNumbers min
				  to: someNumbers max + 1
				  about: 30
				  wholeNumbers: true ].
	^ (aChart
		   ticksFrom: someNumbers min
		   to: someNumbers max
		   about: 30
		   wholeNumbers: false) collect: [ :each | each asFloat ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMHistogramSeries >> place: someValues in: someCategories [
	"My values are numbers, never categories"

	^ someValues
]

{ #category : '*Cormas-UI-Roassal3' }
CMHistogramSeries class >> plotsOf: someSeriesData on: aChart [
	"Bars for each series data that has values, counting its values in the same bins for all"

	| drawn bins |
	drawn := someSeriesData select: [ :each | each values isNotEmpty ].
	drawn ifEmpty: [ ^ #(  ) ].
	bins := self
		        binsOf: (drawn flatCollect: [ :each | each values ])
		        on: aChart.
	^ drawn collect: [ :each |
			  each -> (RSHistogramPlot new
				   bins: bins;
				   x: each values;
				   color: each color;
				   yourself) ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMHistogramSeries >> valuesIn: aDataTable [

	^ self numbersOf: x in: aDataTable
]

{ #category : '*Cormas-UI-Roassal3' }
CMHistogramSeries >> xValuesOf: someValues [

	^ someValues
]
