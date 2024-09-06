Class {
	#name : 'CMSensitivityAnalysisChartPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'data',
		'numberOfRepetitions',
		'columnName',
		'chart',
		'measurementNames'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisChartPresenter class >> example [
	<example>
	
	self new
		data: self exampleData;
		numberOfRepetitions: 3;
		columnName: 'Value';
		measurementNames: { 'Average biomass' . 'Average income' };
		drawChart;
		open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartPresenter class >> exampleData [
	<script: 'self exampleData inspect'>

	| parameterValue rand |
	rand := Random new.

	^ ((1 to: 3) flatCollect: [ :i |
		parameterValue := rand next.
			
		(1 to: 3) collect: [ :repetition |
			{
				'Parameter value' -> parameterValue .
				'Repetition' -> repetition .
				'Average biomass' -> rand next .
				'Average income' -> rand next
			} asOrderedDictionary ] ]
	) sorted: [ :a :b | (a at: 'Parameter value') < (b at: 'Parameter value') ]
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> columnName: aString [

	columnName := aString
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> data: aCollection [

	data := aCollection
]

{ #category : 'layout' }
CMSensitivityAnalysisChartPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: chart;
		yourself
]

{ #category : 'public' }
CMSensitivityAnalysisChartPresenter >> drawChart [

	| chartBuilder size x |
	
	chartBuilder := CMR3ChartBuilder new
		plotWidth: 0.5;
		yourself.
		
	data
		ifEmpty: [ chartBuilder addPlotX: { 0 } y: { 0 } color: Color black ]
		ifNotEmpty: [
			size := data size / numberOfRepetitions.
			
			x := data
				select: [ :row | (row at: 'Repetition') = 1 ]
				thenCollect: [ :row | row at: 'Parameter value' ].
				
			chartBuilder maxChartValueX: x max.
	
			measurementNames do: [ :each |
				self
					drawChartForMeasurementNamed: each
					chartBuilder: chartBuilder
					x: x ] ].

	chartBuilder chart build.
	chart canvas: chartBuilder chart container.
]

{ #category : 'public' }
CMSensitivityAnalysisChartPresenter >> drawChartForMeasurementNamed: aString chartBuilder: aBuilder x: xCollection [

	| color y |
	
	color := RSColorPalette qualitative flatui118 range atRandom.
		
	1 to: numberOfRepetitions do: [ :i |
		y := data
			select: [ :row | (row at: 'Repetition') = i ]
			thenCollect: [ :row | row at: aString ].
					
		aBuilder addPlotX: xCollection y: y color: color ].

]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartPresenter >> initializePresenters [

	chart := SpRoassalInspectorPresenter new.
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> measurementNames: aCollection [

	measurementNames := aCollection 
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartPresenter >> numberOfRepetitions: aNumber [

	numberOfRepetitions := aNumber
]
