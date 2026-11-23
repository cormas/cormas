Extension { #name : 'CMLineChart' }

{ #category : '*Cormas-UI-Roassal3' }
CMLineChart >> plotsOf: someSeries [
	"A line for each series that has values"

	^ (someSeries select: [ :each | each steps isNotEmpty ]) collect: [
			  :each |
			  each -> ((RSLinePlot new x: each steps y: each values)
				   color: each color;
				   width: 2.5;
				   yourself) ]
]
