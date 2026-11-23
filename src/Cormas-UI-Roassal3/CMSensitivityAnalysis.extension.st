Extension { #name : 'CMSensitivityAnalysis' }

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> canvasOf: anOutput against: aParameterName [
	"Return a canvas with a point for each run that varies the parameter named aParameterName, its value on x and the value of anOutput on y"

	^ self
		  canvasOf: anOutput
		  against: aParameterName
		  showing: { (anOutput -> (self resultsVarying: aParameterName)) }
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> canvasOf: anOutput against: aParameterName groupedBy: anotherParameterName [
	"Return a canvas with a point for each run, the value of the parameter named aParameterName on x and the value of anOutput on y, in a color for each value of the parameter named anotherParameterName"

	^ self
		  canvasOf: anOutput
		  against: aParameterName
		  showing:
			  ((self resultsGroupedBy: anotherParameterName) associations
				   collect: [ :each |
					   anotherParameterName , ' = ' , each key asString -> each value ])
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> canvasOf: anOutput against: aParameterName showing: someNamedResults [
	"Return a canvas with a series of points for each association of someNamedResults, from its name to the results of its runs"

	^ (CMScatterplot new
		   xTitle: aParameterName;
		   yTitle: anOutput;
		   yourself)
		  canvasOf: (someNamedResults withIndexCollect: [ :each :index |
					   CMSeriesData
						   named: each key
						   color: (NSScale category10 range atWrap: index)
						   steps: (each value collect: [ :row | row at: 'run' ]) asArray
						   values: (each value collect: [ :row |
								    Point x: (row at: aParameterName) y: (row at: anOutput) ])
								   asArray ])
		  hiding: Set new
]

{ #category : '*Cormas-UI-Roassal3' }
CMSensitivityAnalysis >> spreadCanvasOf: anOutput [
	"Return a canvas with a box for each combination of my design, the spread of anOutput over its replicates, named after the values of my parameters"

	| spreads |
	spreads := self spreadsOf: anOutput.
	^ (CMBoxplot new
		   xTitle: (', ' join: self parameterNames);
		   yTitle: anOutput;
		   hideLegend;
		   yourself)
		  canvasOf: { (CMSeriesData
				   named: anOutput
				   color: NSScale category10 range first
				   steps: (spreads collect: [ :each |
						    ', ' join: (each key collect: [ :value | value asString ]) ])
				   values: (spreads collect: [ :each | each value asArray ])) }
		  hiding: Set new
]
