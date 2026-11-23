"
I represent what is needed to reproduce a run of a simulation: its settings when it was initialized, the versions of the code it ran, and the last step it reached.

## Responsibility:

- I know the model, the init and control selectors, the seed and the seed chosen after init, the stop condition and the parameter values of a run, as they were at init.
- I know what the run did not record, its recording interval, and the versions of Cormas and of the model's code.
- I write myself as the JSON file `run.json` of a saved run.

## Collaborators:

- `CMSimulation` creates me at each init and writes me when its data is saved.
- `CMModel` gives the values of its parameters and of the parameters of its entity classes, and the git state of its folder.
- `CMVersion` gives the version of Cormas.

## Public API and Key Messages

- `CMSimulation>>#initializeSimulation` creates me with setters, from the settings of the run it starts.
- `lastStep:` records the last step the run reached.
- `writeJsonOn:` writes me as JSON, and `CMRunMetadata fromJson:` reads me back.
- `warnIfCodeDiffersFrom:` signals a `CMRerunWarning` when a rerun runs other code than mine.

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
		'lastStep',
		'seedAfterInit'
	],
	#category : 'Cormas-Core-Simulation',
	#package : 'Cormas-Core',
	#tag : 'Simulation'
}

{ #category : 'instance creation' }
CMRunMetadata class >> fromJson: aString [
	"Return the settings of a run read from its run.json"

	| settings run |
	settings := STONJSON fromString: aString.
	run := self new
		       model: (settings at: 'model');
		       started: (DateAndTime fromString: (settings at: 'started'));
		       init: (settings at: 'init');
		       control: (settings at: 'control');
		       seed: (settings at: 'seed');
		       stopCondition: (settings at: 'stopCondition');
		       lastStep: (settings at: 'lastStep');
		       parameters: (settings at: 'parameters');
		       recording: (settings at: 'recording');
		       versions: (settings at: 'versions');
		       yourself.
	settings
		at: 'seedAfterInit'
		ifPresent: [ :seed | run seedAfterInit: seed ].
	^ run
]

{ #category : 'instance creation' }
CMRunMetadata class >> versionsOf: aModelClass [
	"Return the version of Cormas and the git state of the folder of aModelClass"

	^ OrderedDictionary new
		  at: 'cormas' put: CMVersion current printString;
		  addAll: aModelClass codeVersion;
		  yourself
]

{ #category : 'writing' }
CMRunMetadata >> asDictionary [
	"Return my JSON object, which leaves out the seed after init when the seed is kept after init"

	| dictionary |
	dictionary := OrderedDictionary new
		              at: 'model' put: model;
		              at: 'started' put: started printString;
		              at: 'init' put: init;
		              at: 'control' put: control;
		              at: 'seed' put: seed;
		              yourself.
	seedAfterInit ifNotNil: [
		dictionary at: 'seedAfterInit' put: seedAfterInit ].
	^ dictionary
		  at: 'stopCondition' put: stopCondition;
		  at: 'lastStep' put: lastStep;
		  at: 'parameters' put: parameters;
		  at: 'recording' put: recording;
		  at: 'versions' put: versions;
		  yourself
]

{ #category : 'accessing' }
CMRunMetadata >> classNamed: aString [
	"Return the class of the image named aString, which a run names in its settings"

	^ self class environment at: aString asSymbol ifAbsent: [
			  self error:
				  'The run names a class ' , aString
				  , ' that the image does not have' ]
]

{ #category : 'private' }
CMRunMetadata >> commitIn: someVersions [
	"Return the commit named in someVersions, or say that there is none"

	^ someVersions
		  at: 'git'
		  ifPresent: [ :git | git at: 'commit' ]
		  ifAbsent: [ 'none (no git)' ]
]

{ #category : 'accessing' }
CMRunMetadata >> control [

	^ control
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
CMRunMetadata >> hasUncommittedChangesIn: someVersions [

	^ someVersions
		  at: 'git'
		  ifPresent: [ :git | git at: 'uncommittedChanges' ]
		  ifAbsent: [ false ]
]

{ #category : 'accessing' }
CMRunMetadata >> init [

	^ init
]

{ #category : 'private' }
CMRunMetadata >> init: aSelector [

	init := aSelector
]

{ #category : 'accessing' }
CMRunMetadata >> lastStep [

	^ lastStep
]

{ #category : 'accessing' }
CMRunMetadata >> lastStep: anInteger [

	lastStep := anInteger
]

{ #category : 'accessing' }
CMRunMetadata >> model [

	^ model
]

{ #category : 'private' }
CMRunMetadata >> model: aClassName [

	model := aClassName
]

{ #category : 'accessing' }
CMRunMetadata >> parameters [

	^ parameters
]

{ #category : 'private' }
CMRunMetadata >> parameters: aDictionary [

	parameters := aDictionary
]

{ #category : 'accessing' }
CMRunMetadata >> recording [

	^ recording
]

{ #category : 'private' }
CMRunMetadata >> recording: aDictionary [

	recording := aDictionary
]

{ #category : 'accessing' }
CMRunMetadata >> seed [

	^ seed
]

{ #category : 'private' }
CMRunMetadata >> seed: aNumber [

	seed := aNumber
]

{ #category : 'accessing' }
CMRunMetadata >> seedAfterInit [

	^ seedAfterInit
]

{ #category : 'accessing' }
CMRunMetadata >> seedAfterInit: aNumber [

	seedAfterInit := aNumber
]

{ #category : 'private' }
CMRunMetadata >> started: aDateAndTime [

	started := aDateAndTime
]

{ #category : 'private' }
CMRunMetadata >> stopCondition: aString [

	stopCondition := aString
]

{ #category : 'accessing' }
CMRunMetadata >> versions [

	^ versions
]

{ #category : 'private' }
CMRunMetadata >> versions: aDictionary [

	versions := aDictionary
]

{ #category : 'rerunning' }
CMRunMetadata >> warnIfCodeDiffersFrom: currentVersions [
	"Signal a CMRerunWarning naming each difference between the versions of the code I was made with and currentVersions"

	| differences |
	differences := OrderedCollection new.
	(versions at: 'cormas') = (currentVersions at: 'cormas') ifFalse: [
			differences add:
				('it was made with Cormas {1}, this is Cormas {2}' format: {
						 (versions at: 'cormas').
						 (currentVersions at: 'cormas') }) ].
	(self commitIn: versions) = (self commitIn: currentVersions)
		ifFalse: [
				differences add:
					('it was made at commit {1}, the model is at {2}' format: {
							 (self commitIn: versions).
							 (self commitIn: currentVersions) }) ].
	(self hasUncommittedChangesIn: versions) ifTrue: [
		differences add: 'it was made with uncommitted changes' ].
	(self hasUncommittedChangesIn: currentVersions) ifTrue: [
		differences add: 'the model has uncommitted changes' ].
	differences ifNotEmpty: [
			CMRerunWarning signal:
				'The run is rerun with other code than its own: '
				, ('; ' join: differences) ]
]

{ #category : 'writing' }
CMRunMetadata >> writeJsonOn: aStream [

	STONJSON put: self asDictionary onStreamPretty: aStream
]
