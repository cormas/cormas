Class {
	#name : #CMModelForTest,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theAgentLocationForTests',
		'theCellForTests'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #'initialize-release' }
CMModelForTest >> init [ 
	self initRandom
]

{ #category : #initialization }
CMModelForTest >> initAlive [
self theCellForTests do: #initAlive
]

{ #category : #initialization }
CMModelForTest >> initDead [
	self theCellForTests do: #initDead
]

{ #category : #initialization }
CMModelForTest >> initRandom [
	self theCellForTests do: #initRandom
]

{ #category : #probes }
CMModelForTest >> numAlives [
	"return the population size of the alive"

	<probe>
	| count |
	count := 0.
	self allTheEntities
		do: [ :cell | 
			cell state = #alive
				ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #probes }
CMModelForTest >> numDeads [
	"return the population size of the dead"

	<probe>
	| count |
	count := 0.
	self allTheEntities
		do: [ :cell | 
			cell state = #dead
				ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #accessing }
CMModelForTest >> theAgentLocationForTests [
	^ theAgentLocationForTests ifNil: [ theAgentLocationForTests := IndexedSet new ]
]

{ #category : #accessing }
CMModelForTest >> theCellForTests [
	^ theCellForTests ifNil: [ theCellForTests := OrderedCollection new ]
]
