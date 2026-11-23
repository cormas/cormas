Extension { #name : 'CMBarSeries' }

{ #category : '*Cormas-UI-Roassal3' }
CMBarSeries class >> plotX: someValues from: someBottoms to: someTops [

	^ CMBarsPlot new x: someValues from: someBottoms to: someTops
]

{ #category : '*Cormas-UI-Roassal3' }
CMBarSeries class >> xMargin [
	"Half a tick on each side, so that the first and last bars fit"

	^ 1 / 2
]
