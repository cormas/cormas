"
I am a mock model without probes and without charts, for tests of what a simulation shows when a model defines no data.

## Responsibility:

- I have an init method and a control method, and nothing to record or chart.

## Collaborators:

- `CMSimulation` runs me in tests.

## Public API and Key Messages

- `initGrid` creates a small grid; `step` does nothing.

```smalltalk
(CMSimulation for: CMMockModelWithoutData new)
	activeInitSelector: #initGrid;
	activeControlSelector: #step;
	initializeSimulation
```
"
Class {
	#name : 'CMMockModelWithoutData',
	#superclass : 'CMModel',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'init' }
CMMockModelWithoutData >> initGrid [

	<init>
	self
		createGridNumberOfRows: 2
		numberOfColumns: 2
		neighbourhood: 4
		closed: true
]

{ #category : 'control' }
CMMockModelWithoutData >> step [

	<control>
	
]
