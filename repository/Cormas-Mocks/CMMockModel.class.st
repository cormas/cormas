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
		'theCells',
		'theCows',
		'theGoats',
		'numberOfRows',
		'numberOfColumns',
		'initialNumberOfCows',
		'initialNumberOfGoats'
	],
	#category : #'Cormas-Mocks'
}

{ #category : #default }
CMMockModel class >> defaultControl [
	^ #stepSynchronously:
]

{ #category : #default }
CMMockModel class >> defaultInitialNumberOfCows [

	^ 3
]

{ #category : #default }
CMMockModel class >> defaultInitialNumberOfGoats [

	^ 3
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

	^ 'MockModel'
]

{ #category : #init }
CMMockModel >> init [ 

	self initEmpty.
		
	self
		createN: initialNumberOfCows
		randomlyLocatedAloneEntities: CMMockCow.
		
	self
		createN: initialNumberOfGoats
		randomlyLocatedAloneEntities: CMMockGoat.
]

{ #category : #init }
CMMockModel >> initAlive [

	self theCells do: #initAlive
]

{ #category : #init }
CMMockModel >> initDead [
	self theCells do: #initDead
]

{ #category : #init }
CMMockModel >> initEmpty [

	self
		createGridLines: numberOfRows
		columns: numberOfColumns
		neighbourhood: 8
		closed: false.
		
	self initRandom
]

{ #category : #init }
CMMockModel >> initRandom [

	self theCells do: #initRandom
]

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfCows [

	^ initialNumberOfCows
]

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfCows: aNumber [

	initialNumberOfCows := aNumber
]

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfGoats [

	^ initialNumberOfGoats
]

{ #category : #'accessing - parameters' }
CMMockModel >> initialNumberOfGoats: aNumber [

	initialNumberOfGoats := aNumber
]

{ #category : #initialization }
CMMockModel >> initialize [

	super initialize.
	
	numberOfRows := self class defaultNumberOfRows.
	numberOfColumns := self class defaultNumberOfColumns.

	initialNumberOfCows := self class defaultInitialNumberOfCows.
	initialNumberOfGoats := self class defaultInitialNumberOfGoats.
	
	theCows := OrderedCollection new.
	theGoats := OrderedCollection new.
	theCells := OrderedCollection new.
]

{ #category : #probes }
CMMockModel >> numberOfAliveAgents [
	"return the population size of the alive"

	<probe>
	^ (self theAgents select: [ :agent | agent isAlive ]) size
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
	^ (self theAgents select: [ :agent | agent isDead ]) size
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
CMMockModel >> theCells [

	<getterFor: #CMMockCell>
	^ theCells
]

{ #category : #accessing }
CMMockModel >> theCows [

	<getterFor: #CMMockCow>
	^ theCows
]

{ #category : #accessing }
CMMockModel >> theGoats [
	
	<getterFor: #CMMockGoat>
	^ theGoats
]
