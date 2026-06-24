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
		'randomSeedParameter',
		'setup'
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
		setup initSelector: selector ].
	
	controlSelectorDropList whenSelectedItemChangedDo: [ :selector |
		setup controlSelector: selector ].
	
	stopConditionDropList whenSelectedItemChangedDo: [ :selector |
		setup stopConditionSelector: (
			stopConditionDropList isPlaceholderSelected
				ifTrue: [ nil ]
				ifFalse: [ selector ]) ].
	
	finalStepInput whenNumberChangedDo: [ :number |
		setup finalTimeStep: number ].
	
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

	parameterSamplings := Dictionary new.
		
	parameterSamplings at: randomSeedParameter put: (
		CMListSamplingMethod new
			values: { randomSeedParameter defaultValue };
			yourself)
	
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

	setup := CMSensitivityAnalysisSetup new.
	
	self initializeRandomSeedParameter.
	self initializeParameterSamplings.

	modelClassDropList := self newDropList
		items: CMModel modelsInThisImage;
		display: [ :aClass | aClass modelName ];
		displayIcon: [ :aClass | CMIcons cormasModelIcon ];
		yourself.
		
	initSelectorDropList := self newDropList.
	controlSelectorDropList := self newDropList.
	finalStepInput := self newNumberInput.
	
	stopConditionDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		placeholder: 'boolean method' respondingTo: #value;
		display: [ :each | each value ];
		yourself.
	
	probesList := self newTable
		hideColumnHeaders;
		addColumn: ((SpCheckBoxTableColumn
			evaluated: [ :probe | setup probes includes: probe ])
			onActivation: [ :probe |
				setup probes add: probe.
				self updateRunButton ];
			onDeactivation: [ :probe |
				setup probes remove: probe.
				self updateRunButton ];
			width: 20;
			yourself);
		addColumn: (SpStringTableColumn
			evaluated: [ :probe | probe name ]);
		yourself.
		
	self initializeParametersTable.
	
	runButton := self newButton
		icon: CMIcons runIcon;
		yourself.
		
	self updateRunButton.
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeRandomSeedParameter [

	randomSeedParameter := CMIntegerParameter new
		targetClass: CMSimulationContext;
		getterSelector: #randomSeed;
		setterSelector: #randomSeed:;
		minValue: 1;
		maxValue: SmallInteger maxVal;
		defaultValue: (Random new nextInteger: SmallInteger maxVal);
		isClassSide: false;
		yourself
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

	setup modelClass: aClass.

	initSelectorDropList items: aClass availableInitSelectors.	
	controlSelectorDropList items: aClass availableControlSelectors.
	stopConditionDropList items: aClass availableBooleanSelectors.
	
	initSelectorDropList selectFirst.
	controlSelectorDropList selectFirst.
	
	finalStepInput number: 100.
	
	probesList items: aClass availableProbes.
	parametersTable items: ((self relevantParametersFrom: aClass) copyWithFirst: randomSeedParameter).
	
	setup probes: probesList items asSet.
	
	self initializeParameterSamplings.
	self updateTable.
	self updateRunButton
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> openRunner [

	(self instantiate: CMSensitivityAnalysisRunnerPresenter on: setup) open
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

{ #category : 'updating - presenters' }
CMSensitivityAnalysisSetupPresenter >> sampleParameterValues [

	setup parameterSamplings: (parameterSamplings collect: [ :sampler | 
		sampler generate ])
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> selectModel: aModelClass [

	modelClassDropList selectItem: aModelClass
]

{ #category : 'updating - presenters' }
CMSensitivityAnalysisSetupPresenter >> updateRunButton [

	runButton label: ('Run ', setup numberOfSimulations asString, ' simulations').

	setup isComplete
		ifTrue: [ runButton enable ]
		ifFalse: [ runButton disable ]
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
