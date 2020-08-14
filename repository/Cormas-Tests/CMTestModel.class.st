Class {
	#name : #CMTestModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theAgentLocations',
		'theCells'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #'initialize-release' }
CMTestModel >> init [ 
	self initRandom
]

{ #category : #initialization }
CMTestModel >> initAlive [
self theCells do: #initAlive
]

{ #category : #initialization }
CMTestModel >> initDead [
	self theCells do: #initDead
]

{ #category : #initialization }
CMTestModel >> initRandom [
	self theCells do: #initRandom
]

{ #category : #probes }
CMTestModel >> numAlives [
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
CMTestModel >> numDeads [
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
CMTestModel >> theAgentLocations [
	^ theAgentLocations ifNil: [ theAgentLocations := OrderedCollection new ]
]

{ #category : #accessing }
CMTestModel >> theCells [
	^ theCells ifNil: [ theCells := OrderedCollection new ]
]
