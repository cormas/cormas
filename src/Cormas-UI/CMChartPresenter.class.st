Class {
	#name : #CMChartPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'simulation',
		'translator',
		'toolbar',
		'showProbesButton',
		'saveToPngButton',
		'saveToGifButton',
		'probesCheckboxes',
		'chart',
		'isProbeVisibleDictionary',
		'isProbesListVisible'
	],
	#category : #'Cormas-UI'
}

{ #category : #examples }
CMChartPresenter class >> example [
	<example>
	
	| simulation |
	
	simulation := (CMSimulation for: CMMockModel)
		activeInitSelector: #initFixed;
		activeControlSelector: #step:;
		initializeSimulation;
		yourself.
		
	10 timesRepeat: [ simulation runStep ].
	
	(self forSimulation: simulation translator: CMEnglishTranslator new) open
]

{ #category : #'as yet unclassified' }
CMChartPresenter class >> forSimulation: aSimulation translator: aTranslator [

	^ self on: { aSimulation . aTranslator }
]

{ #category : #initialization }
CMChartPresenter >> connectPresenters [

	showProbesButton action: [
		isProbesListVisible := isProbesListVisible not.
		self updateProbesListVisibility.
		self updateShowProbesButtonIcon.
		self update ].
	
	saveToPngButton action: [ self saveToPng ].
	"saveToGifButton action: [ ""do nothing"" ]."
]

{ #category : #layout }
CMChartPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: chart;
			add: probesCheckboxes width: 250;
			yourself);
		yourself
]

{ #category : #public }
CMChartPresenter >> drawChart [

	| chartBuilder size x y |
	
	chartBuilder := CMR3ChartBuilder new
		maxChartValueX: simulation finalTimeStep + 1;
		yourself.
		
	(isProbeVisibleDictionary values noneSatisfy: #yourself)
		ifTrue: [ chartBuilder addPlotX: { 0 } y: { 0 } color: Color black ]
		ifFalse: [
			size := simulation data size.
			x := (1 to: size) asArray.
	
			simulation probes do: [ :probe |
				(isProbeVisibleDictionary at: probe) ifTrue: [
					y := (simulation data first: size) collect: [ :row | row at: probe name ].
					chartBuilder addPlotX: x y: y color: probe color ] ] ].

	chartBuilder chart build.
	chart canvas: chartBuilder chart container.
]

{ #category : #initialization }
CMChartPresenter >> initializePresenters [

	isProbesListVisible := false.

	isProbeVisibleDictionary := (simulation probes collect: [ :probe |
		                             probe -> true ]) asDictionary.

	probesCheckboxes := self newTable
		                    hideColumnHeaders;
		                    addColumn:
			                    ((SpCheckBoxTableColumn evaluated: [ :probe |
					                      isProbeVisibleDictionary at: probe ])
				                     onActivation: [ :probe |
					                     isProbeVisibleDictionary at: probe put: true.
					                     self updateCharts ];
				                     onDeactivation: [ :probe |
					                     isProbeVisibleDictionary
						                     at: probe
						                     put: false.
					                     self updateCharts ];
				                     width: 20;
				                     yourself);
		                    addColumn:
			                    ((SpImageTableColumn evaluated: [ :probe |
					                      | form |
					                      form := Form extent: 16 @ 16 depth: 32.
					                      form getCanvas fillColor: probe color.
					                      form ])
				                     width: 20;
				                     yourself);
		                    addColumn:
		                    (SpStringTableColumn evaluated: [ :probe |
			                     probe name ]).

	probesCheckboxes items: simulation probes.

	showProbesButton := self newToolbarButton
		                    label: 'Probes';
		                    yourself.

	saveToPngButton := self newToolbarButton
		                   label: 'Save to PNG';
		                   icon: (self iconNamed: #smallSave);
		                   yourself.

	"saveToGifButton := self newToolbarButton
		label: 'Save to GIF';
		icon: CMIcons gifIcon;
		yourself."

	toolbar := self newToolbar
		           add: saveToPngButton;
		           "add: saveToGifButton;"addItemRight: showProbesButton;
		           yourself.

	self updateProbesListVisibility.
	self updateShowProbesButtonIcon.

	chart := SpRoassalPresenter new.
	chart layout: (SpBoxLayout new
			 add: RSCompositeChart new canvas height: 400;
			 yourself).

	self drawChart
]

{ #category : #initialization }
CMChartPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Chart';
		initialExtent: 1000@600
]

{ #category : #running }
CMChartPresenter >> runStep [

	10 timesRepeat: [ simulation runStep ].
	self updateCharts.
]

{ #category : #'as yet unclassified' }
CMChartPresenter >> saveToPng [

	(StSaveFilePresenter extensions: {'png'})
		okAction: [ :fileReference | 
			RSPNGExporter new
				canvas: chart canvas;
				exportToFile: fileReference ]
]

{ #category : #'accessing - model' }
CMChartPresenter >> setModelBeforeInitialization: aCollection [

	simulation := aCollection first.
	translator := aCollection second
]

{ #category : #'as yet unclassified' }
CMChartPresenter >> updateCharts [

	self drawChart.
	chart update
]

{ #category : #'as yet unclassified' }
CMChartPresenter >> updateProbesListVisibility [

	isProbesListVisible
		ifTrue: [ probesCheckboxes show ]
		ifFalse: [ probesCheckboxes hide ].
]

{ #category : #'as yet unclassified' }
CMChartPresenter >> updateShowProbesButtonIcon [

	showProbesButton icon: (isProbesListVisible
		ifTrue: [ CMIcons grayEyeIcon ]
		ifFalse: [ CMIcons eyeIcon ] )
]
