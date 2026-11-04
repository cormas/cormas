"
I am a directed link for testing `CMLink`, which is its default behaviour.
"
Class {
	#name : 'CMMockRoad',
	#superclass : 'CMLink',
	#instVars : [
		'customPov'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'pov' }
CMMockRoad >> pov [
	"Each test gives a road the point of view it needs through pov:, so that it does not take a separate pov method and a change of the selected point of view of the class, which all the roads share"

	<pov>
	^ customPov ifNil: [ super pov ]
]

{ #category : 'pov' }
CMMockRoad >> pov: aPointOfView [

	customPov := aPointOfView
]

{ #category : 'actions' }
CMMockRoad >> repair [

	<action>
	
]
