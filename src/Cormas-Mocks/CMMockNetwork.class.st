"
I am a network for testing `CMNetwork`, and I can be given any look with `aspect:`.
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
