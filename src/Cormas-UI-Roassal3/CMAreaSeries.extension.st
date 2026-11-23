Extension { #name : 'CMAreaSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMAreaSeries class >> plotX: someValues from: someBottoms to: someTops [

	^ RSAreaPlot new x: someValues y1: someTops y2: someBottoms
]
