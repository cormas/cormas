"
A model to use as example, even more stupid than StupidModel!
 
Internal Representation and Key Implementation Points.

    Instance Variables
	theAgentLocations:		<Object>
	theCells:		<Object>


    Implementation Points
"
Class {
	#name : #CMMockModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theAgents',
		'theCells'
	],
	#category : #'Cormas-Mocks'
}

{ #category : #default }
CMMockModel class >> defaultControl [
	^ #stepSynchronously:
]

{ #category : #accessing }
CMMockModel class >> friendlyName [
	^ 'TestModel'
]

{ #category : #'initialize-release' }
CMMockModel >> init [ 

	self
		createGridLines: 4
		columns: 4
		neighbourhood: 8
		closed: false.
		
	self createN: 5 randomlyLocatedAloneEntities: CMMockAgent.
		
	self initRandom
]

{ #category : #initialization }
CMMockModel >> initAlive [
self theCells do: #initAlive
]

{ #category : #initialization }
CMMockModel >> initDead [
	self theCells do: #initDead
]

{ #category : #initialization }
CMMockModel >> initRandom [
	self theCells do: #initRandom
]

{ #category : #probes }
CMMockModel >> numberOfAliveAgents [
	"return the population size of the alive"

	<probe>
	| count |
	count := 0.
	self theAgents 
		do: [ :agent | 
			agent isAlive
				ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #probes }
CMMockModel >> numberOfDeadAgents [
	"return the population size of the dead"

	<probe>
	| count |
	count := 0.
	self theAgents
		do: [ :agent | 
			agent isDead
				ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #'as yet unclassified' }
CMMockModel >> theAgents [
	^ theAgents ifNil: [ theAgents := OrderedCollection new ]
]

{ #category : #accessing }
CMMockModel >> theCells [
	^ theCells ifNil: [ theCells := OrderedCollection new ]
]
