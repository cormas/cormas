Class {
	#name : 'CMChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'translator',
		'probesCheckboxes',
		'chart',
		'isProbeVisibleDictionary'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'examples' }
CMChartPresenter class >> example [
	<example>
	
	| simulation |
	
	simulation := (CMSimulation for: CMMockModel)
		activeInitMethod: (CMMockModel >> #initFixed);
		activeControlMethod: (CMMockModel >> #step:);
		initializeSimulation;
		yourself.
		
	10 timesRepeat: [ simulation runStep ].
	
	(self forSimulation: simulation translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMChartPresenter class >> forSimulation: aSimulation translator: aTranslator [

	^ self on: { aSimulation . aTranslator }
]

{ #category : 'layout' }
CMChartPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 2;
		add: probesCheckboxes width: 250;
		add: chart;
		yourself
]

{ #category : 'public' }
CMChartPresenter >> drawChart [

	| chartBuilder x y |
	
	chartBuilder := CMR3ChartBuilder new
		maxChartValueX: simulation finalTimeStep + 1;
		yourself.
		
	(isProbeVisibleDictionary values noneSatisfy: #yourself)
		ifTrue: [ chartBuilder addPlotX: { 0 } y: { 0 } color: Color black ]
		ifFalse: [
			x := (1 to: simulation data size) asArray.
	
			simulation probes do: [ :probe |
				(isProbeVisibleDictionary at: probe) ifTrue: [
					y := simulation data collect: [ :row | row at: probe name ].
					chartBuilder addPlotX: x y: y color: probe color ] ] ].

	chartBuilder chart build.
	chart canvas: chartBuilder chart container.
]

{ #category : 'initialization' }
CMChartPresenter >> initializePresenters [

	isProbeVisibleDictionary := (simulation probes collect: [ :probe |
		probe -> true ]) asDictionary.

	probesCheckboxes := self newTable
		addColumn: ((SpCheckBoxTableColumn evaluated: [ :probe | isProbeVisibleDictionary at: probe ])
			onActivation: [ :probe |
				isProbeVisibleDictionary at: probe put: true.
				self updateCharts ];
			onDeactivation: [ :probe |
				isProbeVisibleDictionary at: probe put: false.
				self updateCharts ];
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn evaluated: [ :probe | probe name ]).
		
	probesCheckboxes items: simulation probes.

	chart := SpRoassalInspectorPresenter new.
	self drawChart.
]

{ #category : 'initialization' }
CMChartPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Chart';
		initialExtent: 1000@600
]

{ #category : 'running' }
CMChartPresenter >> runStep [

	10 timesRepeat: [ simulation runStep ].
	self updateCharts.
]

{ #category : 'accessing - model' }
CMChartPresenter >> setModelBeforeInitialization: aCollection [

	simulation := aCollection first.
	translator := aCollection second
]

{ #category : 'as yet unclassified' }
CMChartPresenter >> updateCharts [

	self drawChart.
	chart update
]
