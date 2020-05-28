Class {
	#name : #CormasModelForTest,
	#superclass : #CormasModel,
	#instVars : [
		'cells',
		'agents'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #'initialize-release' }
CormasModelForTest >> init [ 
	self initRandom
]

{ #category : #initialization }
CormasModelForTest >> initAlive [
	self initCells: #initAlive
]

{ #category : #initialization }
CormasModelForTest >> initDead [
	self initCells: #initDead
]

{ #category : #initialization }
CormasModelForTest >> initRandom [
	self initCells: #initRandom
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
CormasModelForTest >> theCMAgentLocationForTests [
	^ agents ifNil: [ agents := IndexedSet new ]
]

{ #category : #accessing }
CormasModelForTest >> theCMCellForTests [
	^ cells ifNil: [ cells := OrderedCollection new ]
]
