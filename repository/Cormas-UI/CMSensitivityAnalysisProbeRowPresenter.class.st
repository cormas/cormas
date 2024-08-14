Class {
	#name : 'CMSensitivityAnalysisProbeRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'dataCollectorDropList',
		'probeDropList'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbeRowPresenter class >> example [
	<example>
	| model simulation |
	
	model := CMMockModel new.
	simulation := CMSimulation for: model.
	
	(self on: simulation) open.
]

{ #category : 'layout' }
CMSensitivityAnalysisProbeRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: (SpBoxLayout newTopToBottom
			add: '' height: 1;
			add: 'Record' height: self class labelHeight;
			yourself) width: 70;
		add: dataCollectorDropList width: 150;
		add: (SpBoxLayout newTopToBottom
			add: '' height: 1;
			add: ' of ';
			yourself) width: 40;
		add: probeDropList width: 150;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbeRowPresenter >> initializePresenters [
		
	dataCollectorDropList := self newDropList
		items: (CMDataCollector allSubclasses reject: #hasAbstractMethods);
		display: [ :aClass | aClass collectorName ];
		yourself.
		
	probeDropList := self newDropList
		items: simulation probes;
		display: [ :each | each name ];
		yourself.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbeRowPresenter >> setModelBeforeInitialization: aSimulation [

	simulation := aSimulation
]
