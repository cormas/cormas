Class {
	#name : 'CMSensitivityAnalysisProbeRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'translator',
		'dataCollectorDropList',
		'probeDropList',
		'deleteButton'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbeRowPresenter class >> example [
	<example>
	| model simulation |
	
	model := CMMockModel new.
	simulation := CMSimulation for: model.
	
	(self forSimulation: simulation translator: CMEnglishTranslator new) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbeRowPresenter class >> forSimulation: aSimulation translator: aTranslator [
	
	^ self on: { aSimulation . aTranslator }
]

{ #category : 'layout' }
CMSensitivityAnalysisProbeRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 10;
		borderWidth: 2;
		add: translator tMeasure expand: false;
		add: dataCollectorDropList width: 170;
		add: translator tMeasureOf expand: false;
		add: probeDropList width: 250;
		add: '';
		add: deleteButton width: 30;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbeRowPresenter >> initializePresenters [
		
	dataCollectorDropList := self newDropList
		items: (CMDataCollector allSubclasses reject: #hasAbstractMethods);
		display: [ :aClass |
			aClass collectorNameFromTranslator: translator ];
		yourself.
		
	probeDropList := self newDropList
		items: simulation probes;
		display: [ :each | each name ];
		yourself.
		
	deleteButton := self newButton
		icon: (self iconNamed: #remove);
		action: [ owner items: (owner items copyWithout: self) ];
		yourself.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbeRowPresenter >> setModelBeforeInitialization: aCollection [

	simulation := aCollection first.
	translator :=  aCollection second
]
