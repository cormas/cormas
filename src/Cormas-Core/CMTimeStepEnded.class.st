"
I announce that a time step of a simulation has ended: the model has run its step and the step's data has been recorded.

## Responsibility:

- Tell listeners, such as views and dashboards, that they can now show the state of the model at the end of a step.
- Know the time step that has just ended.
- Be announced once per step, after the model's control method and the recording of the probes.

## Collaborators:

- `CMSimulation`: announces me at the end of `runStep`.
- `CMSimulationContext`: its `timeStepAnnouncer` carries me, next to the `ValueChanged` announced when the time step changes.

## Public API and Key Messages

- `timeStep` answers the step that has just ended.
- Create me with `CMTimeStepEnded timeStep: 3`.

Listen to me from a presenter, and refresh in the UI process, because I am announced in the simulation's process:

```
simulation simulationContext timeStepAnnouncer
	when: CMTimeStepEnded
	do: [ :announcement | self defer: [ self showStep: announcement timeStep ] ]
	for: self
```

## Internal Representation

- `timeStep`: an Integer, the step that has just ended.
"
Class {
	#name : 'CMTimeStepEnded',
	#superclass : 'Announcement',
	#instVars : [
		'timeStep'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'instance creation' }
CMTimeStepEnded class >> timeStep: anInteger [

	^ self new
		  timeStep: anInteger;
		  yourself
]

{ #category : 'accessing' }
CMTimeStepEnded >> timeStep [

	^ timeStep
]

{ #category : 'accessing' }
CMTimeStepEnded >> timeStep: anInteger [

	timeStep := anInteger
]
