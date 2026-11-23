"
I test the `CMSensitivityAnalysisRunnerPresenter` of a sensitivity analysis of `CMMockModel`, run in this process.
"
Class {
	#name : 'CMSensitivityAnalysisRunnerPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis',
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMSensitivityAnalysisRunnerPresenterTest >> setUp [

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
		            yourself.
	presenter := CMSensitivityAnalysisRunnerPresenter on: analysis.
	analysis run
]

{ #category : 'tests' }
CMSensitivityAnalysisRunnerPresenterTest >> testAllDataCanBeExportedOnceRunsAreDone [

	self assert: presenter exportButton isEnabled.
	self
		assert: presenter exportButton label
		equals:
			'Export all data ('
			, analysis exportSize humanReadableByteSizeString , ')'
]

{ #category : 'tests' }
CMSensitivityAnalysisRunnerPresenterTest >> testNothingCanBeExportedBeforeARun [

	self deny: (CMSensitivityAnalysisRunnerPresenter on:
			 (CMSensitivityAnalysis on: (CMSimulation for: CMMockModel new)))
			exportButton isEnabled
]

{ #category : 'tests' }
CMSensitivityAnalysisRunnerPresenterTest >> testTheDataTabShowsTheResultsOfTheModelOrOfAClass [

	self assert: presenter tableDropList items asArray equals: {
			CMMockModel.
			CMMockCell.
			CMMockCow.
			CMMockGoat }.
	self assert: presenter table data size equals: 2.
	presenter tableDropList selectItem: CMMockCow.
	self assert: presenter table data size equals: 1 + 2
]
