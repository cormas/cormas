"
I am the Recording page of a simulation window: I let the modeler choose how often data is recorded, and which classes and probes are recorded.

## Responsibility:

- I list the model, then each entity class that has probes, with its probes, each with a checkbox.
- I keep the choices across inits, and give them to each new simulation.

## Collaborators:

- `CMSimulationPresenter` shows me in its sidebar and asks me to `applyTo:` each simulation it initializes.
- `CMSimulation` receives the recording interval and the switches.

## Public API and Key Messages

- `applyTo: aSimulation`
- `doNotRecord:`, `record:`, `doNotRecord:of:`, `record:of:`, `isRecorded:` and `isRecorded:of:`, as the checkboxes do.

```smalltalk
| application |
application := CMSimulationApplication new.
application cormasModel: CMMockModel new.
(application newPresenter: CMRecordingPresenter) open
```

## Internal Representation

- `excludedClasses`: a `Set` of classes; `excludedProbes`: a `Set` of class -> selector associations.
"
Class {
	#name : 'CMRecordingPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'intervalInput',
		'classesTree',
		'excludedClasses',
		'excludedProbes'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'recording' }
CMRecordingPresenter >> applyTo: aSimulation [
	"Give aSimulation the recording interval and the classes and probes that are not recorded"

	aSimulation recordEvery: intervalInput number.
	excludedClasses do: [ :each | aSimulation doNotRecord: each ].
	excludedProbes do: [ :each |
		aSimulation doNotRecord: each value of: each key ]
]

{ #category : 'accessing' }
CMRecordingPresenter >> classesTree [

	^ classesTree
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
				   add: classesTree;
				   yourself);
		  yourself
]

{ #category : 'recording' }
CMRecordingPresenter >> doNotRecord: aClass [

	excludedClasses add: aClass
]

{ #category : 'recording' }
CMRecordingPresenter >> doNotRecord: aSelector of: aClass [

	excludedProbes add: aClass -> aSelector
]

{ #category : 'private' }
CMRecordingPresenter >> doNotRecordItem: anItem [

	anItem isClass
		ifTrue: [ self doNotRecord: anItem ]
		ifFalse: [ self doNotRecord: anItem value of: anItem key ]
]

{ #category : 'initialization' }
CMRecordingPresenter >> initialize [

	excludedClasses := Set new.
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
	classesTree := self newTreeTable
		               hideColumnHeaders;
		               addColumn:
			               ((SpCheckBoxTableColumn evaluated: [ :item |
					                 self isRecordedItem: item ])
				                onActivation: [ :item | self recordItem: item ];
				                onDeactivation: [ :item |
					                self doNotRecordItem: item ];
				                width: 20;
				                yourself);
		               addColumn:
		               (SpStringTableColumn evaluated: [ :item |
			                self nameOfItem: item ]);
		               roots: self recordableClasses;
		               children: [ :item |
				               item isClass
					               ifTrue: [
					               item probeSelectors collect: [ :each |
						               item -> each ] ]
					               ifFalse: [ #(  ) ] ];
		               yourself
]

{ #category : 'accessing' }
CMRecordingPresenter >> intervalInput [

	^ intervalInput
]

{ #category : 'recording' }
CMRecordingPresenter >> isRecorded: aClass [

	^ (excludedClasses includes: aClass) not
]

{ #category : 'recording' }
CMRecordingPresenter >> isRecorded: aSelector of: aClass [

	^ (excludedProbes includes: aClass -> aSelector) not
]

{ #category : 'private' }
CMRecordingPresenter >> isRecordedItem: anItem [

	^ anItem isClass
		  ifTrue: [ self isRecorded: anItem ]
		  ifFalse: [ self isRecorded: anItem value of: anItem key ]
]

{ #category : 'private' }
CMRecordingPresenter >> nameOfItem: anItem [

	^ anItem isClass
		  ifTrue: [ anItem name ]
		  ifFalse: [ anItem value ]
]

{ #category : 'recording' }
CMRecordingPresenter >> record: aClass [

	excludedClasses remove: aClass ifAbsent: [ ]
]

{ #category : 'recording' }
CMRecordingPresenter >> record: aSelector of: aClass [

	excludedProbes remove: aClass -> aSelector ifAbsent: [ ]
]

{ #category : 'private' }
CMRecordingPresenter >> recordItem: anItem [

	anItem isClass
		ifTrue: [ self record: anItem ]
		ifFalse: [ self record: anItem value of: anItem key ]
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
