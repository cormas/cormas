"
I record init and every n steps of a simulation, as well as its last step.

## Responsibility:

- Know how many steps separate two recorded steps.
- Tell that init and every multiple of that number are recorded.
- Write myself as `{ ""type"": ""interval"", ""every"": n }`.

## Collaborators:

- `CMSimulation` asks me which steps to record.
- `CMStepsRecording` reads me back from JSON.

## Public API and Key Messages

- `CMIntervalRecording every: anInteger` creates me
- `includes: aStep`, `asDictionary`

```
(CMIntervalRecording every: 2) includes: 4. ""true""
(CMIntervalRecording every: 2) includes: 3. ""false""
```

## Internal Representation

- `every`: the number of steps between two recorded steps.
"
Class {
	#name : 'CMIntervalRecording',
	#superclass : 'CMStepsRecording',
	#instVars : [
		'every'
	],
	#category : 'Cormas-Core-Data',
	#package : 'Cormas-Core',
	#tag : 'Data'
}

{ #category : 'instance creation' }
CMIntervalRecording class >> every: anInteger [

	^ self new
		  every: anInteger;
		  yourself
]

{ #category : 'instance creation' }
CMIntervalRecording class >> fromDictionary: aDictionary [

	^ self every: (aDictionary at: 'every')
]

{ #category : 'instance creation' }
CMIntervalRecording class >> type [

	^ 'interval'
]

{ #category : 'converting' }
CMIntervalRecording >> asDictionary [

	^ super asDictionary
		  at: 'every' put: every;
		  yourself
]

{ #category : 'initialization' }
CMIntervalRecording >> every: anInteger [

	every := anInteger
]

{ #category : 'testing' }
CMIntervalRecording >> includes: aStep [

	^ aStep \\ every = 0
]
