Extension { #name : 'CMSensitivityAnalysis' }

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> canvasOf: anOutput against: aParameterName [
	"Return a canvas with a point for each run that varies the parameter named aParameterName, its value on x and the value of anOutput on y"

	^ (self scatterplotOf: anOutput against: aParameterName)
		  hideLegend;
		  canvasOf: { (self
				   seriesDataNamed: anOutput
				   color: NSScale category10 range first
				   showing: (self resultsVarying: aParameterName)
				   of: anOutput
				   against: aParameterName) }
		  hiding: Set new
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> canvasOf: anOutput against: aParameterName groupedBy: anotherParameterName [
	"Return a canvas with a point for each run, the value of the parameter named aParameterName on x and the value of anOutput on y, in a color for each value of the parameter named anotherParameterName, named in the legend"

	| groups colors |
	groups := self resultsGroupedBy: anotherParameterName.
	colors := self colorsOf: groups keys.
	^ (self scatterplotOf: anOutput against: aParameterName)
		  canvasOf: (groups associations withIndexCollect: [ :each :index |
					   self
						   seriesDataNamed:
						   anotherParameterName , ' = ' , each key asString
						   color: (colors at: index)
						   showing: each value
						   of: anOutput
						   against: aParameterName ])
		  hiding: Set new
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> colorsOf: someValues [
	"Return a color for each of someValues: distinct colors for categories, and shades of one color, from light to dark, for numbers"

	| base light dark min max |
	(someValues allSatisfy: [ :each | each isNumber ]) ifFalse: [
			^ someValues withIndexCollect: [ :each :index |
				  NSScale category10 range atWrap: index ] ].
	base := NSScale category10 range first.
	light := base mixed: 0.3 with: Color white.
	dark := base mixed: 0.6 with: Color black.
	min := someValues min.
	max := someValues max.
	^ someValues collect: [ :each |
			  max = min
				  ifTrue: [ base ]
				  ifFalse: [ light mixed: max - each / (max - min) with: dark ] ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> scatterplotOf: anOutput against: aParameterName [

	^ CMChart new
		  xTitle: aParameterName;
		  yTitle: anOutput;
		  yourself
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> seriesDataNamed: aString color: aColor showing: someResults of: anOutput against: aParameterName [
	"Return the points of the runs of someResults, the value of the parameter named aParameterName on x and the value of anOutput on y"

	^ CMSeriesData
		  of: (CMPointSeries new x: aParameterName y: anOutput)
		  named: aString
		  color: aColor
		  steps: (someResults collect: [ :row | row at: 'run' ]) asArray
		  values: (someResults collect: [ :row |
				   Point x: (row at: aParameterName) y: (row at: anOutput) ])
				  asArray
]
