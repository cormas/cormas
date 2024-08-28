Class {
	#name : 'CMSensitivityAnalysisProbeRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableProbes',
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
	
	(self
		forAvailableProbes: CMMockModel availableProbes
		translator: CMEnglishTranslator new) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbeRowPresenter class >> forAvailableProbes: aCollectionOfProbes translator: aTranslator [
	
	^ self on: { aCollectionOfProbes . aTranslator }
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
		
	dataCollectorDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: translator tMeasurementType asLowercase respondingTo: #collectorNameFromTranslator:;
		items: (CMDataCollector allSubclasses reject: #hasAbstractMethods);
		display: [ :aClass |
			aClass collectorNameFromTranslator: translator ];
		yourself.
		
	probeDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: translator tProbe asLowercase respondingTo: #name;
		items: availableProbes;
		display: [ :each | each name ];
		yourself.
		
	deleteButton := self newButton
		icon: (self iconNamed: #remove);
		action: [ owner items: (owner items copyWithout: self) ];
		yourself.
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbeRowPresenter >> setModelBeforeInitialization: aCollection [

	availableProbes := aCollection first.
	translator :=  aCollection second
]
