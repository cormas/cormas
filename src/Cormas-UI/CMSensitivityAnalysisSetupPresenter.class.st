"
I am the window where a modeler sets up a sensitivity analysis of a model, and opens its runner.

## Responsibility:

- I edit a simulation of the chosen model: its init and control methods, and its stop condition.
- I keep the design, the replicates, the master seed, the recording and the sampling of each varied parameter.
- I build a new `CMSensitivityAnalysis` from all these choices whenever it is needed.

## Collaborators:

- `CMSensitivityAnalysis` is the analysis I build, on a copy of my simulation.
- `CMRecordingPresenter` chooses the recorded steps and probes, the probes of the entity classes switched off by default.
- `CMSamplingEditorPresenter` edits the sampling of one parameter.
- `CMSensitivityAnalysisRunnerPresenter` runs the analysis I build.

## Public API and Key Messages

- `selectModel: aModelClass`
- `sample: aParameter with: aSampler` varies a parameter, as the Edit link does.
- `newAnalysis` returns an analysis with the current choices.

```smalltalk
(CMSensitivityAnalysisSetupPresenter new
	selectModel: CMModel modelsInThisImage first;
	yourself) open
```

## Internal Representation

- `simulation`: the simulation whose settings each analysis copies.
- `parameterSamplings`: an `OrderedDictionary` from a parameter to its sampler.
"
Class {
	#name : 'CMSensitivityAnalysisSetupPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'modelClassDropList',
		'initSelectorDropList',
		'controlSelectorDropList',
		'finalStepInput',
		'stopConditionDropList',
		'parametersTable',
		'runButton',
		'parameterSamplings',
		'simulation',
		'replicatesInput',
		'masterSeedInput',
		'fullFactorialButton',
		'oneFactorAtATimeButton',
		'recordingPresenter'
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

	replicatesInput whenNumberChangedDo: [ :number |
		self updateRunButton ].

	fullFactorialButton whenChangedDo: [ :isSelected |
		self updateRunButton ].

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
								     build: [ :builder |
										     builder
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
						    add: 'Analysis' expand: false;
						    add: (SpGridLayout new
								     borderWidth: 0;
								     beColumnNotHomogeneous;
								     column: 2 expand: true;
								     build: [ :builder |
										     builder
											     add: 'Design';
											     add: fullFactorialButton;
											     nextRow;
											     add: '';
											     add: oneFactorAtATimeButton;
											     nextRow;
											     add: 'Replicates';
											     add: replicatesInput;
											     nextRow;
											     add: 'Master seed';
											     add: masterSeedInput;
											     nextRow ];
								     yourself);
						    yourself);
				   yourself)
		  height: 180;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 15;
				   add: (SpBoxLayout newTopToBottom
						    spacing: labelSpacing;
						    add: 'Parameters (inputs)' expand: false;
						    add: parametersTable;
						    yourself);
				   add: recordingPresenter width: 300;
				   yourself);
		  add: runButton expand: false;
		  yourself
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> editSamplingFor: aParameter [

	| presenter |
	presenter := CMSamplingEditorPresenter on: aParameter.

	presenter openDialog okAction: [
		self sample: aParameter with: presenter sampler ]
]

{ #category : 'examples' }
CMSensitivityAnalysisSetupPresenter >> example [
	<script: 'self example'>
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> finalStepInput [

	^ finalStepInput
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> fullFactorialButton [

	^ fullFactorialButton
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> initSelectorDropList [

	^ initSelectorDropList
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

	fullFactorialButton := self newRadioButton
		                       label: 'Full factorial';
		                       yourself.
	oneFactorAtATimeButton := self newRadioButton
		                          label: 'One factor at a time';
		                          yourself.
	fullFactorialButton associatedRadioButtons:
		{ oneFactorAtATimeButton }.
	replicatesInput := self newNumberInput
		                   beInteger;
		                   minimum: 1;
		                   number: 1;
		                   yourself.
	masterSeedInput := self newNumberInput
		                   beInteger;
		                   minimum: 0;
		                   number: CMSensitivityAnalysis new masterSeed;
		                   yourself.

	recordingPresenter := self instantiate: CMRecordingPresenter.
	recordingPresenter lastStepOnlyCheckBox state: true.

	self initializeParametersTable.

	runButton := self newButton
		             icon: CMIcons runIcon;
		             yourself.

	modelClassDropList selectedItem ifNotNil: [ :aClass |
		self initializeWithModelClass: aClass ]
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter
		title: 'Sensitivity Analysis';
		initialExtent: 950 @ 650
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetupPresenter >> initializeWithModelClass: aClass [

	simulation := CMSimulation for: aClass new.

	initSelectorDropList items: aClass availableInitSelectors.
	controlSelectorDropList items: aClass availableControlSelectors.
	stopConditionDropList items: aClass availableBooleanSelectors.

	initSelectorDropList selectFirst.
	controlSelectorDropList selectFirst.

	finalStepInput number: 100.
	self updateStopCondition.

	recordingPresenter
		modelClass: aClass;
		doNotRecordEntityProbes.
	parametersTable items: (self relevantParametersFrom: aClass).

	self initializeParameterSamplings.
	self updateTable.
	self updateRunButton
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> masterSeedInput [

	^ masterSeedInput
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> newAnalysis [
	"Return a new analysis of a copy of my simulation with the design, replicates, master seed, recording and parameter samplings chosen. The design is read from the full factorial button, whose change updates the run button before the other button is selected"

	| run analysis |
	run := simulation newSimulationWithSameSettings.
	recordingPresenter applyTo: run.
	analysis := (CMSensitivityAnalysis on: run)
		            replicates: replicatesInput number;
		            masterSeed: masterSeedInput number;
		            recordedSteps: recordingPresenter recordedSteps;
		            yourself.
	fullFactorialButton state ifFalse: [ analysis beOneFactorAtATime ].
	parameterSamplings keysAndValuesDo: [ :parameter :sampler |
			analysis
				parameter: parameter getterSelector
				of: parameter targetClass
				values: sampler generate ].
	^ analysis
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> oneFactorAtATimeButton [

	^ oneFactorAtATimeButton
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> openRunner [

	(self
		 instantiate: CMSensitivityAnalysisRunnerPresenter
		 on: self newAnalysis) open
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> parametersTable [

	^ parametersTable
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> recordingPresenter [

	^ recordingPresenter
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

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> replicatesInput [

	^ replicatesInput
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> resetSamplingFor: aParameter [

	parameterSamplings removeKey: aParameter.
	
	self updateTable.
	self updateRunButton
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> runButton [

	^ runButton
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetupPresenter >> sample: aParameter with: aSampler [
	"Vary aParameter in the analysis over the values aSampler generates"

	parameterSamplings at: aParameter put: aSampler.
	self updateTable.
	self updateRunButton
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetupPresenter >> selectModel: aModelClass [

	modelClassDropList selectItem: aModelClass
]

{ #category : 'private' }
CMSensitivityAnalysisSetupPresenter >> updateRunButton [

	runButton label:
		'Run ' , self newAnalysis numberOfRuns asString , ' simulations'
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
	selectedItem ifNotNil: [ parametersTable selectItem: selectedItem ]
]
