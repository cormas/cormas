Class {
	#name : 'CMSensitivityAnalysisChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'data',
		'xColumnDropList',
		'yColumnDropList',
		'chartPresenter',
		'chart'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSensitivityAnalysisChartPresenter class >> example [
	
	(self on: CMDataFixture new data) open
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartPresenter >> connectPresenters [

	xColumnDropList whenSelectedItemChangedDo: [ :columnName |
		self drawChart ].
	
	yColumnDropList whenSelectedItemChangedDo: [ :columnName |
		self drawChart ].
]

{ #category : 'layout' }
CMSensitivityAnalysisChartPresenter >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
		spacing: 15;
		add: (SpBoxLayout newLeftToRight
			spacing: 10;
			add: 'X column:' expand: false;
			add: xColumnDropList;
			add: 'Y column:' expand: false;
			add: yColumnDropList;
			yourself) expand: false;
		add: chartPresenter;
		yourself
]

{ #category : 'public' }
CMSensitivityAnalysisChartPresenter >> drawChart [

	| x y spine |
	x := self xCollection.
	y := self yCollection.
	
	chart := RSScatterPlot new x: x y: y.
	chart color: CMColor green.
	chart extent: 800 @ 400.
	chart spineDecoration: (spine := RSLineSpineDecoration new).
	spine shape format: '^'.
	chart padding: 0.
	
	chart build.
	chartPresenter canvas: chart container.
]

{ #category : 'examples' }
CMSensitivityAnalysisChartPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartPresenter >> initializePresenters [

	xColumnDropList := self newDropList
		items: data first keys;
		yourself.
		
	yColumnDropList := self newDropList
		items: data first keys;
		yourself.
		
	chartPresenter := SpRoassalInspectorPresenter new.
	self drawChart.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisChartPresenter >> setModelBeforeInitialization: aCollectionOfDicts [

	data := aCollectionOfDicts
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartPresenter >> xCollection [

	^ data collect: [ :row | row at: xColumnDropList selectedItem ]
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartPresenter >> yCollection [

	^ data collect: [ :row | row at: yColumnDropList selectedItem ]
]
