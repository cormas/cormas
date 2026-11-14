"
I am a directed link for testing `CMLink`, which is its default behaviour.
"
Class {
	#name : 'CMMockRoad',
	#superclass : 'CMLink',
	#instVars : [
		'customPov',
		'customAspect'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockRoad >> aspect: aBlock [
	"Each test gives a road the look it needs through a block that fills it, instead of a separate aspect method"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMMockRoad >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	customAspect value: look
]

{ #category : 'aspects' }
CMMockRoad >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]

{ #category : 'actions' }
CMMockRoad >> repair [

	<action>
	
]
