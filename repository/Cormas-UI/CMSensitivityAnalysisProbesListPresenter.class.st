Class {
	#name : 'CMSensitivityAnalysisProbesListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'probesList',
		'toolbar'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisProbesListPresenter class >> example [ 
	<example>
	| simulation |
	simulation := CMSimulation for: CMMockModel new.
	
	(self on: simulation) open.

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
		label: 'Add';
		icon: (self iconNamed: #add);
		help: 'Add new probe measurement';
		action: [ probesList addPresenter: (CMSensitivityAnalysisProbeRowPresenter on: simulation) ];
		yourself.
		
	toolbar := self newToolbar
		add: addButton;
		yourself.
	

]

{ #category : 'accessing - model' }
CMSensitivityAnalysisProbesListPresenter >> setModelBeforeInitialization: aSimulation [

	simulation := aSimulation
]
