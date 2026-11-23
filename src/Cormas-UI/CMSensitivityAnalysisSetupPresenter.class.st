Class {
	#name : 'CMSensitivityAnalysisSetupPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'modelClassDropList',
		'initSelectorDropList',
		'controlSelectorDropList',
		'finalStepInput',
		'stopConditionDropList',
		'probesList',
		'parametersTable',
		'summaryLabel',
		'runButton',
		'parameterSamplings',
		'simulation',
		'analysis'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'examples' }
CMSensitivityAnalysisSetupPresenter class >> example [
	<example>
	self new open
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> connectPresenters [

	modelClassDropList whenSelectedItemChangedDo: [ :aClass |
		self initializeWithModelClass: aClass ].

	initSelectorDropList whenSelectedItemChangedDo: [ :selector |
		simulation activeInitSelector: selector ].

	controlSelectorDropList whenSelectedItemChangedDo: [ :selector |
		simulation activeControlSelector: selector ].

	stopConditionDropList whenSelectedItemChangedDo: [ :selector |
		self updateStopCondition ].

	finalStepInput whenNumberChangedDo: [ :number |
		self updateStopCondition ].

	runButton action: [ self openRunner ]
]

{ #category : 'layout' }
CMSensitivityAnalysisSetupPresenter >> defaultLayout [

	| labelSpacing |
	labelSpacing := 8.

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			spacing: 15;
			add: (SpBoxLayout newTopToBottom
				spacing: labelSpacing;
				add: 'Model initialization' expand: false;
				add: (SpGridLayout new
					borderWidth: 0;
					beColumnNotHomogeneous;
					column: 2 expand: true;
					build: [ :builder | builder
						add: 'Model';
						add: modelClassDropList;
						nextRow;
						add: 'Init method';
						add: initSelectorDropList;
						nextRow;
						add: 'Control method';
						add: controlSelectorDropList;
						nextRow;
						add: 'Stop condition';
						add: stopConditionDropList;
						nextRow;
						add: 'Max steps';
						add: finalStepInput;
						nextRow ];
					yourself);
				yourself);
			add: (SpBoxLayout newTopToBottom
				spacing: labelSpacing;
				add: 'Probes to measure (outputs)' expand: false;
				add: probesList;
				yourself);
			yourself) height: 180;
		add: (SpBoxLayout newTopToBottom
			spacing: labelSpacing;
			add: 'Parameters (inputs)' expand: false;
			add: parametersTable;
			yourself);
		add: runButton expand: false;
		yourself
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> editSamplingFor: aParameter [

	| presenter |	
	presenter := CMSamplingEditorPresenter on: aParameter.
	
	presenter openDialog okAction: [
		parameterSamplings
			at: aParameter 
			put: presenter sampler.
			
		self updateTable.
		self updateRunButton ].
]

{ #category : 'examples' }
CMSensitivityAnalysisSetupPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeParameterSamplings [

	parameterSamplings := OrderedDictionary new
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeParametersTable [
	
	parametersTable := self newTable.
	
	parametersTable addColumn: (SpStringTableColumn 
		title: 'Target'
		evaluated: [ :parameter | parameter targetClass name ] ).
		
	parametersTable addColumn: (SpStringTableColumn 
		title: 'Parameter name'
		evaluated: [ :parameter | parameter name ]).
		
	parametersTable addColumn: ((SpStringTableColumn 
		title: 'Sampling'
		evaluated: [ :parameter |
			(parameterSamplings includesKey: parameter)
				ifTrue: [ (parameterSamplings at: parameter) class samplingName ]
				ifFalse: [ '' ] ])
		width: 110;
		yourself).
		
	parametersTable addColumn: (SpStringTableColumn 
		title: 'Values'
		evaluated: [ :parameter |
			(parameterSamplings includesKey: parameter)
				ifTrue: [ (parameterSamplings at: parameter) asString ]
				ifFalse: [ parameter defaultValue asString ] ] ).
		
	parametersTable columns do: [ :column |
		column displayColor: [ :parameter |
			(parameterSamplings includesKey: parameter)
				ifTrue: [ self theme textColor ]
				ifFalse: [ self theme ghostTextColor ] ] ].
	
	parametersTable addColumn: ((SpLinkTableColumn
		title: ''
		evaluated: [ :parameter | 'Edit' ]
		action: [ :parameter | self editSamplingFor: parameter ])
		width: 30;
		yourself).
		
	parametersTable addColumn: ((SpLinkTableColumn
		title: ''
		evaluated: [ :parameter | 'Reset' ]
		action: [ :parameter | self resetSamplingFor: parameter ])
		width: 45;
		yourself).
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializePresenters [

	self initializeParameterSamplings.

	modelClassDropList := self newDropList
		                      items: CMModel modelsInThisImage;
		                      display: [ :aClass | aClass modelName ];
		                      displayIcon: [ :aClass |
			                      CMIcons cormasModelIcon ];
		                      yourself.

	initSelectorDropList := self newDropList.
	controlSelectorDropList := self newDropList.
	finalStepInput := self newNumberInput.

	stopConditionDropList := (self instantiate:
			                          CMDropListWithPlaceholderPresenter)
		                         placeholder: 'boolean method'
		                         respondingTo: #value;
		                         display: [ :each | each value ];
		                         yourself.

	probesList := self newTable
		              hideColumnHeaders;
		              addColumn:
			              ((SpCheckBoxTableColumn evaluated: [ :probe |
						                (simulation recordedProbesOf:
								                 simulation cormasModel class) includes: probe ])
				               onActivation: [ :probe |
					               simulation
						               record: probe
						               of: simulation cormasModel class ];
				               onDeactivation: [ :probe |
					               simulation
						               doNotRecord: probe
						               of: simulation cormasModel class ];
				               width: 20;
				               yourself);
		              addColumn:
		              (SpStringTableColumn evaluated: [ :probe | probe ]);
		              yourself.

	self initializeParametersTable.

	runButton := self newButton
		             icon: CMIcons runIcon;
		             disable;
		             yourself.

	modelClassDropList selectedItem ifNotNil: [ :aClass |
		self initializeWithModelClass: aClass ]
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: 'Sensitivity Analysis';
		initialExtent: 800@600
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeWithModelClass: aClass [

	simulation := CMSimulation for: aClass new.
	analysis := CMSensitivityAnalysis on: simulation.

	initSelectorDropList items: aClass availableInitSelectors.
	controlSelectorDropList items: aClass availableControlSelectors.
	stopConditionDropList items: aClass availableBooleanSelectors.

	initSelectorDropList selectFirst.
	controlSelectorDropList selectFirst.

	finalStepInput number: 100.
	self updateStopCondition.

	probesList items: aClass probeSelectors.
	parametersTable items: (self relevantParametersFrom: aClass).

	self initializeParameterSamplings.
	self updateTable.
	self updateRunButton
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> openRunner [

	(self instantiate: CMSensitivityAnalysisRunnerPresenter on: analysis)
		open
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> relevantParametersFrom: aModelClass [

	| parameters entityClassParameters |
	parameters := OrderedCollection withAll: aModelClass parameters.
	parameters sort: [ :a :b | a name < b name ].
	
	entityClassParameters := aModelClass allEntityClasses flatCollect: [ :each |
		each classSideParameters collect: [ :parameter |
			"To make sure that superclass parameters can be set differently on every subclass"
			parameter copy
				targetClass: each;
				yourself ] ].
	
	entityClassParameters sort: [ :a :b | a name < b name ].
	entityClassParameters sort: [ :a :b | a targetClass name < b targetClass name ].
	
	parameters addAll: entityClassParameters.
	^ parameters 
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> resetSamplingFor: aParameter [

	parameterSamplings removeKey: aParameter.
	
	self updateTable.
	self updateRunButton
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> sampleParameterValues [
	"Vary in a new analysis each parameter that has a sampling, over the values it generates"

	analysis := CMSensitivityAnalysis on: simulation.
	parameterSamplings keysAndValuesDo: [ :parameter :sampler |
			analysis
				parameter: parameter getterSelector
				of: parameter targetClass
				values: sampler generate ]
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> selectModel: aModelClass [

	modelClassDropList selectItem: aModelClass
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> updateRunButton [

	runButton label:
		'Run ' , analysis numberOfRuns asString , ' simulations'.
	parameterSamplings
		ifEmpty: [ runButton disable ]
		ifNotEmpty: [ runButton enable ]
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> updateStopCondition [
	"Stop the runs after the number of steps chosen, or earlier when the chosen boolean method returns true"

	stopConditionDropList isPlaceholderSelected ifTrue: [
		^ simulation stopAfterStep: finalStepInput number ].
	simulation stopWhen: (self class compiler evaluate:
			 ('[ :model | model currentTimeStep >= {1} or: [ model {2} ] ]'
				  format: {
						  finalStepInput number printString.
						  stopConditionDropList selectedItem }))
]

{ #category : 'updating - presenters' }
CMSensitivityAnalysisSetupPresenter >> updateTable [

	| items selectedItem |
	
	items := parametersTable items.
	selectedItem := parametersTable selectedItem.

	parametersTable items: items.
	selectedItem ifNotNil: [ parametersTable selectItem: selectedItem ].
	
	self sampleParameterValues
]
