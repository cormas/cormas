"
I am the Recording page of a simulation window: I let the modeler choose how often data is recorded, and which probes are recorded.

## Responsibility:

- I show a flat table with a row for each probe of the model and of the entity classes, the model first, then the classes by name, each row with a checkbox. A probe inherited from another class of the model has a row only in that class, and switching it off there switches it off in the subclasses.
- A class none of whose probes is recorded is not recorded at all.
- I keep the choices across inits, and give them to each new simulation.

## Collaborators:

- `CMSimulationPresenter` shows me in its sidebar and asks me to `applyTo:` each simulation it initializes.
- `CMSimulation` receives the recording interval and the probes that are switched off.

## Public API and Key Messages

- `applyTo: aSimulation`
- `doNotRecord:of:`, `record:of:` and `isRecorded:of:`, as the checkboxes do.
- `probesTable`, `intervalInput`

```smalltalk
| application |
application := CMSimulationApplication new.
application cormasModel: CMMockModel new.
(application newPresenter: CMRecordingPresenter) open
```

## Internal Representation

- `excludedProbes`: a `Set` of class -> selector associations, one for each row whose checkbox is unchecked.
"
Class {
	#name : 'CMRecordingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'intervalInput',
		'probesTable',
		'excludedProbes'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'accessing' }
CMRecordingPresenter >> applyTo: aSimulation [
	"Give aSimulation the recording interval and the probes that are not recorded. A class none of whose probes is recorded is not recorded at all"

	aSimulation recordEvery: intervalInput number.
	excludedProbes do: [ :each |
		aSimulation doNotRecord: each value of: each key ]
]

{ #category : 'initialization' }
CMRecordingPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 12;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 1;
				   add: 'Record every (steps)' expand: false;
				   add: intervalInput expand: false;
				   yourself)
		  expand: false;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 1;
				   add: 'Probes to record' expand: false;
				   add: probesTable;
				   yourself);
		  yourself
]

{ #category : 'recording' }
CMRecordingPresenter >> doNotRecord: aSelector of: aClass [

	excludedProbes add: aClass -> aSelector
]

{ #category : 'initialization' }
CMRecordingPresenter >> initialize [

	excludedProbes := Set new.
	super initialize
]

{ #category : 'initialization' }
CMRecordingPresenter >> initializePresenters [

	intervalInput := self newNumberInput
		                 beInteger;
		                 minimum: 1;
		                 number: 1;
		                 yourself.
	probesTable := self newTable
		               addColumn: ((SpCheckBoxTableColumn
				                 title: 'Record'
				                 evaluated: [ :row |
					                 self isRecorded: row value of: row key ])
				                onActivation: [ :row |
					                self record: row value of: row key ];
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
		               items: self probeRows;
		               yourself
]

{ #category : 'accessing' }
CMRecordingPresenter >> intervalInput [

	^ intervalInput
]

{ #category : 'recording' }
CMRecordingPresenter >> isRecorded: aSelector of: aClass [

	^ (excludedProbes includes: aClass -> aSelector) not
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

{ #category : 'accessing' }
CMRecordingPresenter >> probesTable [

	^ probesTable
]

{ #category : 'recording' }
CMRecordingPresenter >> record: aSelector of: aClass [

	excludedProbes remove: aClass -> aSelector ifAbsent: [ ]
]

{ #category : 'private' }
CMRecordingPresenter >> recordableClasses [
	"The model, then the entity classes that have probes, by name"

	| modelClass |
	modelClass := self application cormasModel class.
	^ { modelClass } , ((modelClass allEntityClasses select: [ :each |
		    each probeSelectors notEmpty ]) asSortedCollection: [ :a :b |
		   a name < b name ]) asArray
]
