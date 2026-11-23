"
I record only the last step of a simulation, as a sensitivity analysis needs: its results are final values.

## Responsibility:

- Tell that no step but the last one is recorded.
- Write myself as `{ ""type"": ""last"" }`.

## Collaborators:

- `CMSimulation` asks me which steps to record, and records its last step anyway.
- `CMStepsRecording` reads me back from JSON.

## Public API and Key Messages

- `CMLastStepRecording new` creates me
- `includes: aStep`, `asDictionary`

```
CMLastStepRecording new includes: 0. ""false""
```

An entity that dies before the last step has no recorded rows.
"
Class {
	#name : 'CMLastStepRecording',
	#superclass : 'CMStepsRecording',
	#category : 'Cormas-Core-Data',
	#package : 'Cormas-Core',
	#tag : 'Data'
}

{ #category : 'instance creation' }
CMLastStepRecording class >> fromDictionary: aDictionary [

	^ self new
]

{ #category : 'instance creation' }
CMLastStepRecording class >> type [

	^ 'last'
]

{ #category : 'testing' }
CMLastStepRecording >> includes: aStep [

	^ false
]
