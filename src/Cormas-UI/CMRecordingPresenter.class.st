"
I let the modeler choose which steps are recorded (every n steps, or the last step only) and which probes are recorded, for a simulation window or for a sensitivity analysis.

## Responsibility:

- I show a table of the model probes and a table of the probes of the entity classes, by class name, each row with a checkbox. A probe inherited from another class of the model has a row only in that class, and switching it off there switches it off in the subclasses.
- A class none of whose probes is recorded is not recorded at all.
- I keep the choices across inits, and give them to each new simulation.

## Collaborators:

- `CMSimulationPresenter` shows me in its sidebar and asks me to `applyTo:` each simulation it initializes.
- `CMSensitivityAnalysisSetupPresenter` applies me to the simulation of its analysis, and gives my `recordedSteps` to the analysis.
- `CMSimulation` receives the recorded steps and the probes that are switched off.

## Public API and Key Messages

- `modelClass:` shows the probes of a model class, all of them recorded; `doNotRecordEntityProbes` switches off the probes of the entity classes, which may produce a lot of data.
- `applyTo: aSimulation` and `recordedSteps`
- `doNotRecord:of:`, `record:of:` and `isRecorded:of:`, as the checkboxes do.
- `modelProbesTable`, `entityProbesTable`, `intervalInput`, `lastStepOnlyCheckBox`

```smalltalk
(CMRecordingPresenter new
	modelClass: CMMockModel;
	yourself) open
```

## Internal Representation

- `modelClass`: the model class whose probes and entity class probes I show.
- `excludedProbes`: a `Set` of class -> selector associations, one for each row whose checkbox is unchecked.
"
Class {
	#name : 'CMRecordingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'intervalInput',
		'modelProbesTable',
		'entityProbesTable',
		'excludedProbes',
		'modelClass',
		'lastStepOnlyCheckBox'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'accessing' }
CMRecordingPresenter >> applyTo: aSimulation [
	"Give aSimulation the steps to record and the probes that are not recorded. A class none of whose probes is recorded is not recorded at all"

	aSimulation recordedSteps: self recordedSteps.
	excludedProbes do: [ :each |
		aSimulation doNotRecord: each value of: each key ]
]

{ #category : 'initialization' }
CMRecordingPresenter >> connectPresenters [

	lastStepOnlyCheckBox whenChangedDo: [ :isLastStepOnly |
		intervalInput enabled: isLastStepOnly not ]
]

{ #category : 'initialization' }
CMRecordingPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 12;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 1;
				   add: 'Record every (steps)' expand: false;
				   add: (SpBoxLayout newLeftToRight
						    spacing: 10;
						    add: intervalInput;
						    add: lastStepOnlyCheckBox expand: false;
						    yourself)
				   expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 1;
				   add: 'Model probes to record' expand: false;
				   add: modelProbesTable;
				   yourself);
		  add: (SpBoxLayout newTopToBottom
				   spacing: 1;
				   add: 'Entity probes to record (they may produce a lot of data)'
				   expand: false;
				   add: entityProbesTable;
				   yourself);
		  yourself
]

{ #category : 'recording' }
CMRecordingPresenter >> doNotRecord: aSelector of: aClass [

	excludedProbes add: aClass -> aSelector
]

{ #category : 'recording' }
CMRecordingPresenter >> doNotRecordEntityProbes [
	"Switch off all the probes of the entity classes, which may produce a lot of data"

	entityProbesTable items do: [ :each |
		self doNotRecord: each value of: each key ].
	entityProbesTable refresh
]

{ #category : 'accessing' }
CMRecordingPresenter >> entityProbesTable [

	^ entityProbesTable
]

{ #category : 'initialization' }
CMRecordingPresenter >> initialize [

	excludedProbes := Set new.
	super initialize
]

{ #category : 'initialization' }
CMRecordingPresenter >> initializePresenters [

	lastStepOnlyCheckBox := self newCheckBox
		                        label: 'Last step only';
		                        yourself.
	intervalInput := self newNumberInput
		                 beInteger;
		                 minimum: 1;
		                 number: 1;
		                 yourself.
	modelProbesTable := self newProbesTable.
	entityProbesTable := self newProbesTable
]

{ #category : 'accessing' }
CMRecordingPresenter >> intervalInput [

	^ intervalInput
]

{ #category : 'recording' }
CMRecordingPresenter >> isRecorded: aSelector of: aClass [

	^ (excludedProbes includes: aClass -> aSelector) not
]

{ #category : 'accessing' }
CMRecordingPresenter >> lastStepOnlyCheckBox [

	^ lastStepOnlyCheckBox
]

{ #category : 'accessing' }
CMRecordingPresenter >> modelClass: aModelClass [
	"Show the probes of aModelClass and of its entity classes, all of them recorded"

	| rows |
	modelClass := aModelClass.
	excludedProbes := Set new.
	rows := self probeRows.
	modelProbesTable items:
		(rows select: [ :each | each key = modelClass ]).
	entityProbesTable items:
		(rows reject: [ :each | each key = modelClass ])
]

{ #category : 'accessing' }
CMRecordingPresenter >> modelProbesTable [

	^ modelProbesTable
]

{ #category : 'initialization' }
CMRecordingPresenter >> newProbesTable [

	^ self newTable
		  addColumn: ((SpCheckBoxTableColumn
				    title: 'Record'
				    evaluated: [ :row | self isRecorded: row value of: row key ])
				   onActivation: [ :row | self record: row value of: row key ];
				   onDeactivation: [ :row |
					   self doNotRecord: row value of: row key ];
				   width: 60;
				   yourself);
		  addColumn:
		  (SpStringTableColumn
			   title: 'Class'
			   evaluated: [ :row | row key name ]);
		  addColumn:
		  (SpStringTableColumn
			   title: 'Probe'
			   evaluated: [ :row | row value ]);
		  yourself
]

{ #category : 'private' }
CMRecordingPresenter >> probeRows [
	"Answer an association from a class to one of its probes for each probe of the model and of the entity classes. A probe inherited from another class of the model has a row only in that class, since switching it off there switches it off in its subclasses"

	| classes |
	classes := self recordableClasses.
	^ classes flatCollect: [ :class |
			  (class probeSelectors reject: [ :selector |
					   classes anySatisfy: [ :other |
							   (class inheritsFrom: other) and: [
								   other probeSelectors includes: selector ] ] ]) collect: [
				  :selector | class -> selector ] ]
]

{ #category : 'recording' }
CMRecordingPresenter >> record: aSelector of: aClass [

	excludedProbes remove: aClass -> aSelector ifAbsent: [ ]
]

{ #category : 'private' }
CMRecordingPresenter >> recordableClasses [
	"The model, then the entity classes that have probes, by name"

	^ { modelClass } , ((modelClass allEntityClasses select: [ :each |
		    each probeSelectors notEmpty ]) asSortedCollection: [ :a :b |
		   a name < b name ]) asArray
]

{ #category : 'accessing' }
CMRecordingPresenter >> recordedSteps [
	"Return the steps to record, as chosen"

	^ lastStepOnlyCheckBox state
		  ifTrue: [ CMLastStepRecording new ]
		  ifFalse: [ CMIntervalRecording every: intervalInput number ]
]
