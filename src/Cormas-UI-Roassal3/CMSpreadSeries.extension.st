Extension { #name : 'CMSpreadSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpreadSeries >> addSeriesDataOfAll: someDataTables to: someSeries [

	self addSeriesDataGatheringEachStepOf: someDataTables to: someSeries
]
