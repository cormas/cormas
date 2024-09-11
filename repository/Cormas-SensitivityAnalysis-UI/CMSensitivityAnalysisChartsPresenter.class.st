Class {
	#name : 'CMSensitivityAnalysisChartsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'data',
		'numberOfRepetitions',
		'measurementNames',
		'parameters',
		'notebook'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartsPresenter >> chartForParameter: aParameter [

	| dataSubset |
	
	dataSubset := data select: [ :row |
		(row at: 'Parameter class') = aParameter receiver name and: [ 
			(row at: 'Parameter name') = aParameter name ] ].
		
	^ (self instantiate: CMSensitivityAnalysisChartPresenter)
		data: dataSubset;
		numberOfRepetitions: numberOfRepetitions;
		measurementNames: measurementNames;
		drawChart;
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartsPresenter >> data: aCollection [

	data := aCollection
]

{ #category : 'layout' }
CMSensitivityAnalysisChartsPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: notebook;
		yourself
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisChartsPresenter >> drawCharts [
	
	parameters do: [ :parameter |
		notebook addPage: (SpNotebookPage
			title: ('(', parameter receiver name,  ') ', parameter name)
			provider: [ self chartForParameter: parameter ]) ]
]

{ #category : 'initialization' }
CMSensitivityAnalysisChartsPresenter >> initializePresenters [ 

	notebook := self newNotebook.
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartsPresenter >> measurementNames: aCollection [

	measurementNames := aCollection 
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartsPresenter >> numberOfRepetitions: aNumber [

	numberOfRepetitions := aNumber
]

{ #category : 'accessing' }
CMSensitivityAnalysisChartsPresenter >> parameters: aCollection [
	
	parameters := aCollection 
]
