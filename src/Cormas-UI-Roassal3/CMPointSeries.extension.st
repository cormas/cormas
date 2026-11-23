Extension { #name : 'CMPointSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMPointSeries >> addSeriesDataOfAll: someDataTables to: someSeries [

	self addSeriesDataGatheringEachStepOf: someDataTables to: someSeries
]

{ #category : '*Cormas-UI-Roassal3' }
CMPointSeries >> valuesIn: aDataTable [
	"My points, x at y"

	^ (self numbersOf: xProbe in: aDataTable)
		  with: (self numbersOf: probe in: aDataTable)
		  collect: [ :x :y | x @ y ]
]
