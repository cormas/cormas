"
I test the views of a `CMSensitivityAnalysisChartPresenter` on a sensitivity analysis of `CMMockModel`.
"
Class {
	#name : 'CMSensitivityAnalysisChartPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis',
		'output'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> pointsIn: aPresenter [

	^ aPresenter chartView canvas allChildren count: [ :each |
		  each isKindOf: RSEllipse ]
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> setUp [

	super setUp.
	analysis := (CMSensitivityAnalysis on:
			             ((CMSimulation for: CMMockModel new)
				              activeInitSelector: #init;
				              activeControlSelector: #step;
				              stopAfterStep: 1;
				              yourself))
		            masterSeed: 42;
		            parameter: #initialNumberOfCows
		            of: CMMockModel
		            values: #( 1 2 );
		            parameter: #initialNumberOfGoats
		            of: CMMockModel
		            values: #( 4 5 );
		            yourself.
	output := FileSystem memory / 'output'
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> testAFullFactorialCanColorThePointsByAParameter [

	| presenter |
	analysis run.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	self assert: presenter groupDropList isVisible.
	self
		assert: presenter groupDropList items asArray
		equals: #( 'None' 'initialNumberOfCows' 'initialNumberOfGoats' ).
	presenter groupDropList selectItem: 'initialNumberOfGoats'.
	self assert: (self pointsIn: presenter) equals: analysis numberOfRuns
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> testOneFactorAtATimeCannotColorThePoints [

	| presenter |
	analysis beOneFactorAtATime.
	analysis run.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	self deny: presenter groupDropList isVisible
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> testTheViewsShowTheOutputsAgainstAParameter [

	| presenter |
	analysis run.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	self
		assert: presenter outputDropList items asArray
		equals: #( 'numberOfAliveCells' 'numberOfDeadCells' ).
	self
		assert: presenter xDropList items asArray
		equals: #( 'initialNumberOfCows' 'initialNumberOfGoats' ).
	self assert: (self pointsIn: presenter) equals: analysis numberOfRuns.
	presenter xDropList selectItem: 'initialNumberOfGoats'.
	self assert: (self pointsIn: presenter) equals: analysis numberOfRuns
]
