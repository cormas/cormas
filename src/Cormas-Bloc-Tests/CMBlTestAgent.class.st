"
I am an agent whose point of view is set by a test, so that tests can draw any shape, color and size.

## Responsibility:

- Answer the point of view I was given.

## Collaborators:

- `CMPointOfView`: the point of view set by the test.

## Public API and Key Messages

- `testPov:` sets the point of view.
- `pov` answers it.

## Internal Representation

- `testPov`: the point of view to answer.
"
Class {
	#name : 'CMBlTestAgent',
	#superclass : 'CMAgent',
	#instVars : [
		'testPov'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'accessing' }
CMBlTestAgent >> pov [

	<pov>
	^ testPov
]

{ #category : 'accessing' }
CMBlTestAgent >> testPov: aPointOfView [

	testPov := aPointOfView
]
