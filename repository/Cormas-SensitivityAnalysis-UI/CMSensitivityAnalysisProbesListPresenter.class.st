Class {
	#name : 'CMSensitivityAnalysisProbesListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'translator',
		'probesList',
		'toolbar'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbesListPresenter class >> example [ 
	<example>
	| simulation |
	simulation := CMSimulation for: CMMockModel new.
	
	(self forSimulation: simulation translator: CMEnglishTranslator new) open.

]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbesListPresenter class >> forSimulation: aSimulation translator: aTranslator [

	^ self on: { aSimulation . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisProbesListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: probesList;
		yourself
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbesListPresenter >> initializePresenters [

	| addButton |
		
	probesList := self newComponentList.
		
	addButton := self newToolbarButton
		label: translator tAdd;
		icon: (self iconNamed: #add);
		help: translator tAddMeasurementHelp;
		action: [
			probesList addPresenter: (
				CMSensitivityAnalysisProbeRowPresenter
					forSimulation: simulation
					translator: translator) ];
		yourself.
		
	toolbar := self newToolbar
		add: addButton;
		yourself.
	

]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbesListPresenter >> setModelBeforeInitialization: aCollection [

	simulation := aCollection first.
	translator := aCollection second
]
