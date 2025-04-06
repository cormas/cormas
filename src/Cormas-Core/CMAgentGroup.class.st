Class {
	#name : #CMAgentGroup,
	#superclass : #CMAgent,
	#instVars : [
		'children'
	],
	#category : 'Cormas-Core-Entities'
}

{ #category : #adding }
CMAgentGroup >> addChild: anEntity [

	children add: anEntity.
	anEntity group: self
]

{ #category : #adding }
CMAgentGroup >> addChildren: aCollection [

	aCollection do: [ :each | self addChild: each ]
]

{ #category : #accessing }
CMAgentGroup >> children [

	^ children
]

{ #category : #initialization }
CMAgentGroup >> initialize [

	super initialize.
	children := OrderedCollection new.
]
