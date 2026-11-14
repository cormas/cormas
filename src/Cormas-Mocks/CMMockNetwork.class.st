"
I am a network for testing `CMNetwork`, and I can be given any point of view.
"
Class {
	#name : 'CMMockNetwork',
	#superclass : 'CMNetwork',
	#instVars : [
		'customPov',
		'customAspect'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockNetwork >> aspect: aBlock [
	"Each test gives a network the look it needs through a block that fills it, instead of a separate aspect method"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMMockNetwork >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	customAspect value: look
]

{ #category : 'actions' }
CMMockNetwork >> clean [

	<action>
	
]

{ #category : 'aspects' }
CMMockNetwork >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]

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
