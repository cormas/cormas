Extension { #name : 'CMHistogram' }

{ #category : '*Cormas-UI-Roassal3' }
CMHistogram >> binsOf: someNumbers [
	"Return the limits of the bins, evenly spaced over someNumbers. Whole numbers each have a bin of their own when they are close enough. Other limits are floats, so that a float equal to a limit is compared with it exactly"

	(someNumbers allSatisfy: [ :each | each isInteger ]) ifTrue: [
			^ self
				  ticksFrom: someNumbers min
				  to: someNumbers max + 1
				  wholeNumbers: true ].
	^ (self
		   ticksFrom: someNumbers min
		   to: someNumbers max
		   wholeNumbers: false) collect: [ :each | each asFloat ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMHistogram >> plotsOf: someSeries [
	"Bars for each series that has values at the last of their steps, counting its values in the same bins for all"

	| lastStep drawn bins |
	drawn := someSeries select: [ :each | each steps isNotEmpty ].
	drawn ifEmpty: [ ^ #(  ) ].
	lastStep := (drawn collect: [ :each | each steps last ]) max.
	drawn := drawn select: [ :each | each steps last = lastStep ].
	bins := self binsOf:
		        (drawn flatCollect: [ :each | each values last ]).
	^ drawn collect: [ :each |
			  each -> (RSHistogramPlot new
				   bins: bins;
				   x: each values last;
				   color: each color;
				   yourself) ]
]
