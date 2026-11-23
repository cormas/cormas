Extension { #name : 'CMAreaChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMAreaChart >> plotsOf: someSeries [
	"An area for each series that has values, stacked on the areas before it. A series has no value at a step when its object was not alive"

	| drawn steps tops |
	drawn := someSeries select: [ :each | each steps isNotEmpty ].
	steps := (drawn flatCollect: [ :each | each steps ]) asSet sorted
		         asArray.
	tops := steps collect: [ :each | 0 ].
	^ drawn collect: [ :each |
			  | bottoms valuesAtSteps |
			  bottoms := tops.
			  valuesAtSteps := Dictionary
				                   newFromKeys: each steps
				                   andValues: each values.
			  tops := steps
				          with: bottoms
				          collect: [ :step :bottom |
				          bottom + (valuesAtSteps at: step ifAbsent: [ 0 ]) ].
			  each -> ((RSAreaPlot new x: steps y1: tops y2: bottoms)
				   color: each color;
				   yourself) ]
]
