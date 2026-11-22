"
I represent what is needed to reproduce a run of a simulation: its settings when it was initialized, the versions of the code it ran, and the last step it reached.

## Responsibility:

- I know the model, the init and control selectors, the seed, the stop condition and the parameter values of a run, as they were at init.
- I know what the run did not record, its recording interval, and the versions of Cormas and of the model's code.
- I write myself as the JSON file `run.json` of a saved run.

## Collaborators:

- `CMSimulation` creates me at each init and writes me when its data is saved.
- `CMModel` gives the values of its parameters and of the parameters of its entity classes, and the git state of its folder.
- `CMVersion` gives the version of Cormas.

## Public API and Key Messages

- `CMSimulation>>#initializeSimulation` creates me with setters, from the settings of the run it starts.
- `lastStep:` records the last step the run reached.
- `writeJsonOn:` writes me as JSON.

```smalltalk
| simulation |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	stopAfterStep: 3;
	yourself.
simulation initializeSimulation.
simulation runStep.
simulation saveDataIn: FileSystem memory / 'output'
```

## Internal Representation

My values are already in their JSON form: strings, numbers, booleans, nil, arrays and dictionaries, so that a later version can add keys without changing what is already written.
"
Class {
	#name : 'CMRunMetadata',
	#superclass : 'Object',
	#instVars : [
		'model',
		'started',
		'init',
		'control',
		'seed',
		'stopCondition',
		'parameters',
		'recording',
		'versions',
		'lastStep'
	],
	#category : 'Cormas-Core-Simulation',
	#package : 'Cormas-Core',
	#tag : 'Simulation'
}

{ #category : 'writing' }
CMRunMetadata >> asDictionary [

	^ OrderedDictionary new
		  at: 'model' put: model;
		  at: 'started' put: started printString;
		  at: 'init' put: init;
		  at: 'control' put: control;
		  at: 'seed' put: seed;
		  at: 'stopCondition' put: stopCondition;
		  at: 'lastStep' put: lastStep;
		  at: 'parameters' put: parameters;
		  at: 'recording' put: recording;
		  at: 'versions' put: versions;
		  yourself
]

{ #category : 'private' }
CMRunMetadata >> control: aSelector [

	control := aSelector
]

{ #category : 'accessing' }
CMRunMetadata >> folderName [
	"Return the name of the folder of my saved run: when it started, to the second, then its init"

	^ String streamContents: [ :stream |
			  started asDate printOn: stream format: #( 3 2 1 $- 1 1 2 ).
			  stream nextPut: $T.
			  stream nextPutAll:
				  (started asTime print24 copyReplaceAll: ':' with: '-').
			  stream space.
			  stream nextPutAll: init ]
]

{ #category : 'private' }
CMRunMetadata >> init: aSelector [

	init := aSelector
]

{ #category : 'accessing' }
CMRunMetadata >> lastStep: anInteger [

	lastStep := anInteger
]

{ #category : 'private' }
CMRunMetadata >> model: aClassName [

	model := aClassName
]

{ #category : 'private' }
CMRunMetadata >> parameters: aDictionary [

	parameters := aDictionary
]

{ #category : 'private' }
CMRunMetadata >> recording: aDictionary [

	recording := aDictionary
]

{ #category : 'private' }
CMRunMetadata >> seed: aNumber [

	seed := aNumber
]

{ #category : 'private' }
CMRunMetadata >> started: aDateAndTime [

	started := aDateAndTime
]

{ #category : 'private' }
CMRunMetadata >> stopCondition: aString [

	stopCondition := aString
]

{ #category : 'private' }
CMRunMetadata >> versions: aDictionary [

	versions := aDictionary
]

{ #category : 'writing' }
CMRunMetadata >> writeJsonOn: aStream [

	STONJSON put: self asDictionary onStreamPretty: aStream
]
