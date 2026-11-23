Extension { #name : 'CMPointSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMPointSeries class >> plotsOf: someSeriesData on: aChart [
	"Translucent points for each series data that has values, so that the points behind them show"

	^ (someSeriesData select: [ :each | each values isNotEmpty ])
		  collect: [ :each |
				  each -> ((CMPointsPlot new
					    x: (each values collect: [ :point | point x ])
					    y: (each values collect: [ :point | point y ]))
					   color: (each color alpha: 0.5);
					   yourself) ]
]
