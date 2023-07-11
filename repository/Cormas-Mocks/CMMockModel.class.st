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

{ #category : #default }
CMMockModel class >> defaultGridSize [

	^ 4@4
]

{ #category : #default }
CMMockModel class >> defaultNumberOfAgents [

	^ 5
]

{ #category : #accessing }
CMMockModel class >> friendlyName [
	^ 'TestModel'
]

{ #category : #'initialize-release' }
CMMockModel >> init [ 

	self
		createGridLines: self class defaultGridSize x
		columns: self class defaultGridSize y
		neighbourhood: 8
		closed: false.
		
	self
		createN: self class defaultNumberOfAgents
		randomlyLocatedAloneEntities: CMMockAgent.
		
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
	^ (theAgents select: [ :agent | agent isAlive ]) size
]

{ #category : #probes }
CMMockModel >> numberOfDeadAgents [
	"return the population size of the dead"

	<probe>
	^ (theAgents select: [ :agent | agent isDead ]) size
]

{ #category : #'as yet unclassified' }
CMMockModel >> theAgents [
	^ theAgents ifNil: [ theAgents := OrderedCollection new ]
]

{ #category : #accessing }
CMMockModel >> theCells [
	^ theCells ifNil: [ theCells := OrderedCollection new ]
]
