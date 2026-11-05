"
I am a network for testing `CMNetwork`, and I can be given any point of view.
"
Class {
	#name : 'CMMockNetwork',
	#superclass : 'CMNetwork',
	#instVars : [
		'customPov'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'pov' }
CMMockNetwork >> pov [
	"Each test gives a network the point of view it needs through pov:, as with a mock road"

	<pov>
	^ customPov ifNil: [ super pov ]
]

{ #category : 'pov' }
CMMockNetwork >> pov: aPointOfView [

	customPov := aPointOfView
]
