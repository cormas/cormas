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
CMSensitivityAnalysisChartPresenterTest >> testAFullFactorialCanGroupThePointsByAParameter [

	| presenter |
	analysis runIn: output.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	self
		assert: presenter groupDropList items asArray
		equals: #( 'None' 'initialNumberOfCows' 'initialNumberOfGoats' ).
	self deny: presenter groupDropList isEnabled.
	presenter xDropList selectItem: 'initialNumberOfCows'.
	self assert: presenter groupDropList isEnabled.
	presenter groupDropList selectItem: 'initialNumberOfGoats'.
	self assert: (self pointsIn: presenter) equals: analysis numberOfRuns
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> testOneFactorAtATimeCannotGroupThePoints [

	| presenter |
	analysis beOneFactorAtATime.
	analysis runIn: output.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	presenter xDropList selectItem: 'initialNumberOfCows'.
	self deny: presenter groupDropList isEnabled
]

{ #category : 'tests' }
CMSensitivityAnalysisChartPresenterTest >> testTheViewsShowTheOutputsAgainstTheCombinationsOrAParameter [

	| presenter |
	analysis runIn: output.
	presenter := CMSensitivityAnalysisChartPresenter on: analysis.
	self
		assert: presenter outputDropList items asArray
		equals: #( 'numberOfAliveCells' 'numberOfDeadCells' ).
	self
		assert: presenter xDropList items asArray
		equals:
		#( 'Combination' 'initialNumberOfCows' 'initialNumberOfGoats' ).
	self assert: (self pointsIn: presenter) equals: 0.
	presenter xDropList selectItem: 'initialNumberOfGoats'.
	self assert: (self pointsIn: presenter) equals: analysis numberOfRuns
]
