"
I show the views of a sensitivity analysis, drawn from its results: how an output of the model depends on the parameters it varies.

## Responsibility:

- I let the user choose an output, a model probe, and what goes on x: the combinations of the design or one of its parameters.
- With the combinations on x, I show the spread of the output over the replicates of each combination, as boxes.
- With a parameter on x, I show a point per run, which a full factorial can color by the value of a second parameter.

## Collaborators:

- `CMSensitivityAnalysis`: its results, its outputs and parameters, and the canvases of its views.
- `CMSensitivityAnalysisRunnerPresenter`: shows me in a tab once there are results.

## Public API and Key Messages

- `CMSensitivityAnalysisChartPresenter on: anAnalysis` creates me on an analysis that has results.
- `outputDropList`, `xDropList` and `groupDropList` choose what is shown; `chartView` shows it.

```
| simulation analysis |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #init;
	activeControlSelector: #step;
	stopAfterStep: 5;
	yourself.
analysis := (CMSensitivityAnalysis on: simulation)
	parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 3 );
	replicates: 5;
	yourself.
analysis runIn: FileSystem memory / 'output'.
(CMSensitivityAnalysisChartPresenter on: analysis) open
```

## Internal Representation

- `xDropList` holds `'Combination'` then the names of the parameters; `groupDropList` holds `'None'` then the names of the parameters, and is enabled only for a full factorial of several parameters with a parameter on x.
"
Class {
	#name : 'CMSensitivityAnalysisChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'analysis',
		'outputDropList',
		'xDropList',
		'groupDropList',
		'chartView'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSensitivityAnalysisChartPresenter class >> scriptCowsAndGoats [
	"Open the views of an analysis varying the initial numbers of cows and goats of the mock model"

	<script>
	| simulation analysis |
	simulation := (CMSimulation for: CMMockModel new)
		              activeInitSelector: #init;
		              activeControlSelector: #step;
		              stopAfterStep: 5;
		              yourself.
	analysis := (CMSensitivityAnalysis on: simulation)
		            parameter: #initialNumberOfCows
		            of: CMMockModel
		            values: #( 1 2 3 );
		            parameter: #initialNumberOfGoats
		            of: CMMockModel
		            values: #( 1 2 );
		            replicates: 5;
		            yourself.
	analysis runIn: FileSystem memory / 'output'.
	(self on: analysis) open
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> chartView [

	^ chartView
]

{ #category : 'private' }
CMSensitivityAnalysisChartPresenter >> combinationItem [

	^ 'Combination'
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartPresenter >> connectPresenters [

	outputDropList whenSelectedItemChangedDo: [ :output | self drawChart ].
	xDropList whenSelectedItemChangedDo: [ :name |
			groupDropList enabled:
				(analysis canGroupResults and: [ name ~= self combinationItem ]).
			self drawChart ].
	groupDropList whenSelectedItemChangedDo: [ :name | self drawChart ]
]

{ #category : 'layout' }
CMSensitivityAnalysisChartPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 15;
		  borderWidth: 4;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 10;
				   add: 'Output:' expand: false;
				   add: outputDropList;
				   add: 'On x:' expand: false;
				   add: xDropList;
				   add: 'Colored by:' expand: false;
				   add: groupDropList;
				   yourself)
		  expand: false;
		  add: chartView;
		  yourself
]

{ #category : 'private' }
CMSensitivityAnalysisChartPresenter >> drawChart [
	"Show the chosen output against the combinations or against a parameter, colored by a second parameter when one is chosen and can be"

	| output x |
	output := outputDropList selectedItem.
	x := xDropList selectedItem.
	x = self combinationItem ifTrue: [
		^ chartView canvas: (analysis spreadCanvasOf: output) ].
	(groupDropList isEnabled and: [
		 groupDropList selectedItem ~= self noGroupItem ]) ifTrue: [
			^ chartView canvas: (analysis
					   canvasOf: output
					   against: x
					   groupedBy: groupDropList selectedItem) ].
	chartView canvas: (analysis canvasOf: output against: x)
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> groupDropList [

	^ groupDropList
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartPresenter >> initializePresenters [

	outputDropList := self newDropList
		                  items: analysis outputs;
		                  yourself.
	xDropList := self newDropList
		             items:
			             { self combinationItem } , analysis parameterNames;
		             yourself.
	groupDropList := self newDropList
		                 items:
			                 { self noGroupItem } , analysis parameterNames;
		                 disable;
		                 yourself.
	chartView := SpRoassalInspectorPresenter new.
	self drawChart
]

{ #category : 'private' }
CMSensitivityAnalysisChartPresenter >> noGroupItem [

	^ 'None'
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> outputDropList [

	^ outputDropList
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartPresenter >> setModelBeforeInitialization: aSensitivityAnalysis [

	analysis := aSensitivityAnalysis
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> xDropList [

	^ xDropList
]
