Class {
	#name : #CormasModelForTest,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theAgentLocationForTests',
		'theCellForTests'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #'initialize-release' }
CormasModelForTest >> init [ 
	self initRandom
]

{ #category : #initialization }
CormasModelForTest >> initAlive [
self theCellForTests do: #initAlive
]

{ #category : #initialization }
CormasModelForTest >> initDead [
	self theCellForTests do: #initDead
]

{ #category : #initialization }
CormasModelForTest >> initRandom [
	self theCellForTests do: #initRandom
]

{ #category : #probes }
CormasModelForTest >> numAlives [
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
CormasModelForTest >> numDeads [
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
CormasModelForTest >> theAgentLocationForTests [
	^ theAgentLocationForTests ifNil: [ theAgentLocationForTests := IndexedSet new ]
]

{ #category : #accessing }
CormasModelForTest >> theCellForTests [
	^ theCellForTests ifNil: [ theCellForTests := OrderedCollection new ]
]
