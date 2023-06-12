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
		'theAgentLocations',
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
CMMockModel >> numAlives [
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
CMMockModel >> numDeads [
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
CMMockModel >> theCells [
	^ theCells ifNil: [ theCells := OrderedCollection new ]
]

{ #category : #accessing }
CMMockModel >> theLocatedAgents [
	^ theAgentLocations ifNil: [ theAgentLocations := OrderedCollection new ]
]
