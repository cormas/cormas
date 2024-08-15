Class {
	#name : 'CMSensitivityAnalysisProbeRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'dataCollectorDropList',
		'probeDropList',
		'deleteButton'
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
		spacing: 10;
		borderWidth: 2;
		add: 'Record' expand: false;
		add: dataCollectorDropList width: 150;
		add: 'of' expand: false;
		add: probeDropList width: 250;
		add: '';
		add: deleteButton width: 30;
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
		
	deleteButton := self newButton
		icon: (self iconNamed: #remove);
		action: [ owner items: (owner items copyWithout: self) ];
		yourself.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbeRowPresenter >> setModelBeforeInitialization: aSimulation [

	simulation := aSimulation
]
