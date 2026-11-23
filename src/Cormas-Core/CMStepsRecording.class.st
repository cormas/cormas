"
I say which steps of a simulation are recorded. I am abstract: `CMIntervalRecording` records init and every n steps, `CMLastStepRecording` records the last step only. The last step of a run is always recorded, whatever I say.

## Responsibility:

- Tell whether a step that is not the last one is recorded.
- Write myself as a tagged JSON object, whose `type` names my kind.
- Read the kind given by such an object back.

## Collaborators:

- `CMSimulation` holds one of my instances and asks me before recording a step.
- `CMRunMetadata` writes me in `run.json` and reads me back for a rerun.

## Public API and Key Messages

- `includes: aStep` whether aStep is recorded when it is not the last one
- `asDictionary` my JSON object
- `CMStepsRecording fromDictionary: aDictionary` the recording a JSON object describes

```
(CMIntervalRecording every: 5) asDictionary. ""a Dictionary('every'->5 'type'->'interval')""
CMStepsRecording fromDictionary: (Dictionary with: 'type' -> 'last'). ""a CMLastStepRecording""
```

A simulation is given me through its own messages: `simulation recordEvery: 5` or `simulation recordLastStepOnly`.
"
Class {
	#name : 'CMStepsRecording',
	#superclass : 'Object',
	#category : 'Cormas-Core-Data',
	#package : 'Cormas-Core',
	#tag : 'Data'
}

{ #category : 'instance creation' }
CMStepsRecording class >> fromDictionary: aDictionary [
	"Return the recording that aDictionary describes, as asDictionary writes it"

	| type |
	type := aDictionary at: 'type'.
	^ (self subclasses detect: [ :each | each type = type ] ifNone: [
		   CMRecordingError signal:
			   'No recording of steps has the type ' , type ]) fromDictionary:
		  aDictionary
]

{ #category : 'instance creation' }
CMStepsRecording class >> type [
	"Return the name of my kind in JSON"

	^ self subclassResponsibility
]

{ #category : 'converting' }
CMStepsRecording >> asDictionary [
	"Return my JSON object, tagged with my type"

	^ OrderedDictionary new
		  at: 'type' put: self class type;
		  yourself
]

{ #category : 'testing' }
CMStepsRecording >> includes: aStep [
	"Return whether aStep is recorded when it is not the last step"

	^ self subclassResponsibility
]

{ #category : 'testing' }
CMStepsRecording >> isLastStepOnly [
	"Return whether I record the last step only, so that nothing can be shown over time"

	^ false
]
