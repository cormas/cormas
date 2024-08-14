Class {
	#name : 'CMSensitivityAnalysisProbePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'probe',
		'simulation',
		'checkbox',
		'dataCollectorDropList'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbePresenter class >> example [
	<example>
	
	| model simulation presenter |
	
	model := CMMockModel new.
	simulation := CMSimulation for: model.
		
	presenter := (self forProbe: simulation probes first on: simulation).
	presenter inspect.
	presenter open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbePresenter class >> forProbe: aProbe on: aSimulation [

	^ self on: { aProbe . aSimulation }
]

{ #category : 'layout' }
CMSensitivityAnalysisProbePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: checkbox;
		add: dataCollectorDropList width: 140;
		yourself
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbePresenter >> initializePresenters [

	checkbox := self newCheckBox
		label: probe name;
		whenDeactivatedDo: [ dataCollectorDropList disable ];
		whenActivatedDo: [ dataCollectorDropList enable ];
		yourself.
		
	dataCollectorDropList := self newDropList
		items: (CMDataCollector allSubclasses reject: #hasAbstractMethods);
		display: [ :aClass | aClass collectorName ];
		disable;
		yourself.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbePresenter >> selectedDataCollector [

	^ dataCollectorDropList selectedItem forProbe: probe on: simulation
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbePresenter >> setModelBeforeInitialization: aCollection [

	probe := aCollection first.
	simulation := aCollection second
]
