Extension { #name : 'CMLineSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMLineSeries >> addSeriesDataOfAll: someDataTables to: someSeries [

	self addSeriesDataOfEachInstanceIn: someDataTables to: someSeries
]
