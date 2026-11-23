Extension { #name : 'CMLineSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMLineSeries >> addSeriesDataOfTables: someDataTables to: someSeriesData [
	"A line for each instance when I show all the instances of a class"

	showsAllInstances ifFalse: [
		^ super addSeriesDataOfTables: someDataTables to: someSeriesData ].
	self addSeriesDataOfEachTable: someDataTables to: someSeriesData
]

{ #category : '*Cormas-UI-Roassal3' }
CMLineSeries class >> plotsOf: someSeriesData on: aChart [
	"A line through the points of each series data that has values, in the order of their steps"

	^ (someSeriesData select: [ :each | each values isNotEmpty ])
		  collect: [ :each |
				  each -> ((RSLinePlot new
					    x: (each values collect: [ :point | point x ])
					    y: (each values collect: [ :point | point y ]))
					   color: each color;
					   width: 2.5;
					   yourself) ]
]
