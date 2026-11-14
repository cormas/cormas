"
I am a cell whose point of view is set by a test, for points of view that the mock cells do not have.

## Responsibility:

- Answer the point of view a test gave me.

## Collaborators: 

- `CMBlTileTest`: sets my point of view.

## Public API and Key Messages

- `testPov:`
"
Class {
	#name : 'CMBlTestCell',
	#superclass : 'CMCell',
	#instVars : [
		'testPov',
		'customAspect'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'aspects' }
CMBlTestCell >> aspect: aBlock [
	"Each test gives a cell the look it needs through a block that fills it"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMBlTestCell >> aspectDefault: look [

	<aspect>
	customAspect value: look
]

{ #category : 'aspects' }
CMBlTestCell >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]

{ #category : 'accessing' }
CMBlTestCell >> pov [

	<pov>
	^ testPov
]

{ #category : 'accessing' }
CMBlTestCell >> testPov: aPointOfView [

	testPov := aPointOfView
]
