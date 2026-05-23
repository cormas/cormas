Class {
	#name : 'CMSensitivityAnalysisSimulationRowPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'parameterClassName',
		'parameterName',
		'parameterValue',
		'progressBar',
		'openSimulationButton',
		'inspectButton'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisSimulationRowPresenter class >> example [
	<example>
	
	| parameter simulation |
	
	parameter := CMMockModel parameters first.
	simulation := CMSimulation for: CMMockModel.
	
	simulation initialParameterValues at: parameter put: 42.
	
	(self forSimulation: simulation) open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSimulationRowPresenter class >> forSimulation: aSimulation [

	^ self on: aSimulation
]

{ #category : 'layout' }
CMSensitivityAnalysisSimulationRowPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 10;
		borderWidth: 2;
		add: parameterClassName expand: false;
		add: parameterName expand: false;
		add: parameterValue;
		"add: progressBar;"
		add: (SpBoxLayout newTopToBottom
			add: inspectButton height: 30;
			yourself) width: 30;
		add: (SpBoxLayout newTopToBottom
			add: openSimulationButton height: 30;
			yourself) width: 30;
		yourself
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisSimulationRowPresenter >> initializePresenters [ 

	parameterClassName := self newLabel
		label: self parameter receiver name;
		yourself.
		
	parameterName := self newLabel
		label: self parameter name;
		yourself.
		
	parameterValue := self newLabel
		label: self parameterValue asString;
		yourself.
		
	progressBar := self newProgressBar.
		
	inspectButton := self newButton
		icon: (self iconNamed: #smallInspectIt);
		action: [ simulation inspect ];
		yourself.
		
	openSimulationButton := self newButton
		icon: (self iconNamed: #paint);
		action: [
			CMSimulationRunnerPresenter
				openForSimulation: (simulation initializeSimulation; yourself) ];
		yourself.
]

{ #category : 'accessing' }
CMSensitivityAnalysisSimulationRowPresenter >> parameter [
	"The dictionary is expected to have exactly one element"
	^ simulation initialParameterValues keys anyOne
]

{ #category : 'accessing' }
CMSensitivityAnalysisSimulationRowPresenter >> parameterValue [
	"The dictionary is expected to have exactly one element"
	^ simulation initialParameterValues values anyOne
]

{ #category : 'accessing - model' }
CMSensitivityAnalysisSimulationRowPresenter >> setModelBeforeInitialization: aSimulation [

	simulation := aSimulation.
	
	simulation initialParameterValues size = 1 ifFalse: [ 
		self error: 'Each simulation is supposed to set exactly one initial parameter value' ].
]
