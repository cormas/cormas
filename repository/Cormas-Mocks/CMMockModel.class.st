"
A model to use as example, even more stupid than StupidModel!
 
Internal Representation and Key Implementation Points.

    Instance Variables
	theAgentLocations:		<Object>
	theCells:		<Object>


    Implementation Points
"
Class {
	#name : 'CMMockModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theCells',
		'theCows',
		'theGoats',
		'numberOfRows',
		'numberOfColumns',
		'initialNumberOfCows',
		'initialNumberOfGoats'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'default' }
CMMockModel class >> defaultControl [
	^ #stepSynchronously:
]

{ #category : 'default' }
CMMockModel class >> defaultInitialNumberOfCows [

	^ 3
]

{ #category : 'default' }
CMMockModel class >> defaultInitialNumberOfGoats [

	^ 3
]

{ #category : 'default' }
CMMockModel class >> defaultNumberOfColumns [

	^ 4
]

{ #category : 'default' }
CMMockModel class >> defaultNumberOfRows [

	^ 4
]

{ #category : 'accessing' }
CMMockModel class >> friendlyName [

	^ 'MockModel'
]

{ #category : 'examples' }
CMMockModel class >> showEmpty [
	<example>
	self showModelWithInit: #initEmpty
]

{ #category : 'examples' }
CMMockModel class >> showFixed [
	<example>
	self showModelWithInit: #initFixed
]

{ #category : 'examples' }
CMMockModel class >> showInit [
	<example>
	self showModelWithInit: #init
]

{ #category : 'examples' }
CMMockModel class >> showModelWithInit: aSymbol [

	| model builder |
	
	model := self new.
	model perform: aSymbol.
	
	builder := CMR3SpaceDiagramBuilder new
		cormasModel: model;
		asPresenter.
	
	builder open.
]

{ #category : 'as yet unclassified' }
CMMockModel >> cellMatrix [
	| matrix |
	
	matrix := #(
		(0 0 1 1)
		(1 0 1 1)
		(1 0 1 1)
		(1 1 1 0)).

	(matrix size = numberOfRows and: [ matrix allSatisfy: [ :row | row size = numberOfColumns ] ])
		ifFalse: [ self error: 'Matrix has the wrong dimensions' ].
		
	^ matrix
]

{ #category : 'init' }
CMMockModel >> init [ 

	self initEmpty.
		
	self
		createN: initialNumberOfCows
		randomlyLocatedAloneEntities: CMMockCow.
		
	self
		createN: initialNumberOfGoats
		randomlyLocatedAloneEntities: CMMockGoat.
]

{ #category : 'init' }
CMMockModel >> initAlive [

	self theCells do: #initAlive
]

{ #category : 'init' }
CMMockModel >> initDead [

	self theCells do: #initDead
]

{ #category : 'init' }
CMMockModel >> initEmpty [

	self
		createGridNumberOfRows: numberOfRows
		numberOfColumns: numberOfColumns
		neighbourhood: 8
		closed: true.
		
	self initRandom
]

{ #category : 'init' }
CMMockModel >> initFixed [

	| cow goat |

	self initEmpty.
	self initializeCellsFromMatrix.
		
	cow := self newEntity: CMMockCow.
	goat := self newEntity: CMMockGoat.
	
	cow moveTo: (self pickCellAt: 1 @ 2).
	goat moveTo: (self pickCellAt: 3 @ 3).
]

{ #category : 'init' }
CMMockModel >> initRandom [

	self theCells do: #initRandom
]

{ #category : 'accessing - parameters' }
CMMockModel >> initialNumberOfCows [

	^ initialNumberOfCows
]

{ #category : 'accessing - parameters' }
CMMockModel >> initialNumberOfCows: aNumber [

	initialNumberOfCows := aNumber
]

{ #category : 'accessing - parameters' }
CMMockModel >> initialNumberOfGoats [

	^ initialNumberOfGoats
]

{ #category : 'accessing - parameters' }
CMMockModel >> initialNumberOfGoats: aNumber [

	initialNumberOfGoats := aNumber
]

{ #category : 'initialization' }
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

{ #category : 'initialization' }
CMMockModel >> initializeCellsFromMatrix [

	| matrixCellValue modelCell |
	
	1 to: numberOfRows do: [ :i | 
		1 to: numberOfColumns do: [ :j | 
			matrixCellValue := (self cellMatrix at: i) at: j.
			modelCell := self pickCellAt: j @ i.
			
			matrixCellValue = 0 ifTrue: [ modelCell initDead ].
			matrixCellValue = 1 ifTrue: [ modelCell initAlive ] ] ]
]

{ #category : 'probes' }
CMMockModel >> numberOfAliveAgents [
	"return the population size of the alive"

	<probe>
	^ (self theAgents select: [ :agent | agent isAlive ]) size
]

{ #category : 'accessing - parameters' }
CMMockModel >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing - parameters' }
CMMockModel >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{ #category : 'probes' }
CMMockModel >> numberOfDeadAgents [
	"return the population size of the dead"

	<probe>
	^ (self theAgents select: [ :agent | agent isDead ]) size
]

{ #category : 'accessing - parameters' }
CMMockModel >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing - parameters' }
CMMockModel >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{ #category : 'control' }
CMMockModel >> step: t [

	self askRandom: CMMockAnimal toDo: #step.
	self stepSynchronouslyCA: t.
]

{ #category : 'accessing' }
CMMockModel >> theCells [

	<getterFor: #CMMockCell>
	^ theCells
]

{ #category : 'accessing' }
CMMockModel >> theCows [

	<getterFor: #CMMockCow>
	^ theCows
]

{ #category : 'accessing' }
CMMockModel >> theGoats [
	
	<getterFor: #CMMockGoat>
	^ theGoats
]
