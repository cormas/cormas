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
		'theCells',
		'numberOfRows',
		'numberOfColumns',
		'initialNumberOfAgents'
	],
	#category : #'Cormas-Mocks'
}

{ #category : #default }
CMMockModel class >> defaultControl [
	^ #stepSynchronously:
]

{ #category : #default }
CMMockModel class >> defaultInitialNumberOfAgents [

	^ 5
]

{ #category : #default }
CMMockModel class >> defaultNumberOfColumns [

	^ 4
]

{ #category : #default }
CMMockModel class >> defaultNumberOfRows [

	^ 4
]

{ #category : #accessing }
CMMockModel class >> friendlyName [
	^ 'TestModel'
]

{ #category : #'initialize-release' }
CMMockModel >> init [ 

	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 8
		closed: false.
		
	self
		createN: initialNumberOfAgents
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

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfAgents [

	^ initialNumberOfAgents
]

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfAgents: aNumber [

	initialNumberOfAgents := aNumber
]

{ #category : #initialization }
CMMockModel >> initialize [

	super initialize.
	
	numberOfRows := self class defaultNumberOfRows.
	numberOfColumns := self class defaultNumberOfColumns.
	initialNumberOfAgents := self class defaultInitialNumberOfAgents.
]

{ #category : #probes }
CMMockModel >> numberOfAliveAgents [
	"return the population size of the alive"

	<probe>
	^ (theAgents select: [ :agent | agent isAlive ]) size
]

{ #category : #'accessing - parameters' }
CMMockModel >> numberOfColumns [

	^ numberOfColumns
]

{ #category : #'accessing - parameters' }
CMMockModel >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{ #category : #probes }
CMMockModel >> numberOfDeadAgents [
	"return the population size of the dead"

	<probe>
	^ (theAgents select: [ :agent | agent isDead ]) size
]

{ #category : #'accessing - parameters' }
CMMockModel >> numberOfRows [

	^ numberOfRows
]

{ #category : #'accessing - parameters' }
CMMockModel >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{ #category : #'utilities - random' }
CMMockModel >> randomSeed: aNumber [

	Cormas seed: aNumber
]

{ #category : #accessing }
CMMockModel >> theAgents [
	^ theAgents ifNil: [ theAgents := OrderedCollection new ]
]

{ #category : #accessing }
CMMockModel >> theCells [
	^ theCells ifNil: [ theCells := OrderedCollection new ]
]
