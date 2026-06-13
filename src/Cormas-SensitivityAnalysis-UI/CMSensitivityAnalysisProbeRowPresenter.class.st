Class {
	#name : 'CMSensitivityAnalysisProbeRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableProbes',
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
	
	(self forAvailableProbes: CMMockModel availableProbes) open.
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbeRowPresenter class >> forAvailableProbes: aCollectionOfProbes [
	
	^ self on: aCollectionOfProbes
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbeRowPresenter >> dataCollector [
	
	^ dataCollectorDropList selectedItem new
		probe: probeDropList selectedItem;
		yourself
]

{ #category : 'layout' }
CMSensitivityAnalysisProbeRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 10;
		borderWidth: 2;
		add: 'Measure' expand: false;
		add: dataCollectorDropList width: 170;
		add: 'of' expand: false;
		add: probeDropList width: 250;
		add: '';
		add: deleteButton width: 30;
		yourself.
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbeRowPresenter >> initializePresenters [
		
	dataCollectorDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: 'measurement type' respondingTo: #collectorName;
		items: (CMDataCollector allSubclasses reject: #hasAbstractMethods);
		display: [ :aClass |
			aClass collectorName ];
		yourself.
		
	probeDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: 'probe' respondingTo: #name;
		items: availableProbes;
		display: [ :each | each name ];
		yourself.
		
	deleteButton := self newButton
		icon: (self iconNamed: #remove);
		action: [ owner items: (owner items copyWithout: self) ];
		yourself.
]

{ #category : 'testing' }
CMSensitivityAnalysisProbeRowPresenter >> isFullyDefined [

	^ dataCollectorDropList isPlaceholderSelected not
		and: [ probeDropList isPlaceholderSelected not ]
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbeRowPresenter >> setModelBeforeInitialization: aCollection [

	availableProbes := aCollection
]
