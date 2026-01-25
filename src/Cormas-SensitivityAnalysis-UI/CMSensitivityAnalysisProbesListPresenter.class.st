Class {
	#name : 'CMSensitivityAnalysisProbesListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'availableProbes',
		'probesList',
		'toolbar'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbesListPresenter class >> example [ 
	<example>
	
	(self forAvailableProbes: CMMockModel availableProbes) open.

]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbesListPresenter class >> forAvailableProbes: aCollectionOfProbes [

	^ self on: aCollectionOfProbes
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProbesListPresenter >> dataCollectors [

	^ probesList items select: #isFullyDefined thenCollect: #dataCollector
]

{ #category : 'layout' }
CMSensitivityAnalysisProbesListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: probesList;
		yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysisProbesListPresenter >> enabled: aBoolean [

	super enabled: aBoolean.
	probesList items do: [ :each | each enabled: aBoolean ].
	toolbar items do: [ :each | each enabled: aBoolean ]
]

{ #category : 'initialization' }
CMSensitivityAnalysisProbesListPresenter >> initializePresenters [

	| addButton |
		
	probesList := self newComponentList.
		
	addButton := self newToolbarButton
		label: 'Add';
		icon: (self iconNamed: #add);
		help: 'Add new probe measurement';
		action: [
			probesList addPresenter: (
				CMSensitivityAnalysisProbeRowPresenter
					forAvailableProbes: availableProbes) ];
		yourself.
		
	toolbar := self newToolbar
		add: addButton;
		yourself.
	

]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbesListPresenter >> setModelBeforeInitialization: aCollection [

	availableProbes := aCollection
]
