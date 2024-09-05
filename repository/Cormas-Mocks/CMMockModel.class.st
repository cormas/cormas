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
		'theGoats'
	],
	#classInstVars : [
		'initialNumberOfCows',
		'initialNumberOfGoats',
		'numberOfRows',
		'numberOfColumns'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'accessing' }
CMMockModel class >> aboutThisModel [

	^ ''
]

{ #category : 'parameters' }
CMMockModel class >> initialNumberOfCows [

	^ initialNumberOfCows
]

{ #category : 'parameters' }
CMMockModel class >> initialNumberOfCows: aNumber [

	initialNumberOfCows := aNumber
]

{ #category : 'parameters' }
CMMockModel class >> initialNumberOfGoats [

	^ initialNumberOfGoats
]

{ #category : 'parameters' }
CMMockModel class >> initialNumberOfGoats: aNumber [

	initialNumberOfGoats := aNumber
]

{ #category : 'instance creation' }
CMMockModel class >> initializeParameters [

	super initializeParameters.
	
	initialNumberOfCows := 3.
	initialNumberOfGoats := 3.
	numberOfRows := 4.
	numberOfColumns := 4.
]

{ #category : 'parameters' }
CMMockModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'parameters' }
CMMockModel class >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{ #category : 'parameters' }
CMMockModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'parameters' }
CMMockModel class >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{ #category : 'tests - printing' }
CMMockModel class >> prefix [

	^ 'CMMock'
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
	
	^ #(
		(0 0 1 1)
		(1 0 1 1)
		(1 0 1 1)
		(1 1 1 0))
]

{ #category : 'init' }
CMMockModel >> init [ 
	<init>
	self initEmpty.
		
	self
		createN: self class initialNumberOfCows
		randomlyLocatedAloneEntities: CMMockCow.
		
	self
		createN: self class initialNumberOfGoats
		randomlyLocatedAloneEntities: CMMockGoat.
]

{ #category : 'init' }
CMMockModel >> initAlive [
	<init>
	self theCells do: #initAlive
]

{ #category : 'init' }
CMMockModel >> initDead [
	<init>
	self theCells do: #initDead
]

{ #category : 'init' }
CMMockModel >> initEmpty [
	<init>
	self
		createGridNumberOfRows: self class numberOfRows
		numberOfColumns: self class numberOfColumns
		neighbourhood: 8
		closed: true.
		
	self initRandom
]

{ #category : 'init' }
CMMockModel >> initFixed [
	<init>
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
	<init>
	self theCells do: #initRandom
]

{ #category : 'initialization' }
CMMockModel >> initialize [

	super initialize.
	
	theCows := OrderedCollection new.
	theGoats := OrderedCollection new.
	theCells := OrderedCollection new.
]

{ #category : 'initialization' }
CMMockModel >> initializeCellsFromMatrix [

	| matrixCellValue modelCell |
	
	1 to: self class numberOfRows do: [ :i | 
		1 to: self class numberOfColumns do: [ :j | 
			matrixCellValue := (self cellMatrix at: i) at: j.
			modelCell := self pickCellAt: j @ i.
			
			matrixCellValue = 0 ifTrue: [ modelCell initDead ].
			matrixCellValue = 1 ifTrue: [ modelCell initAlive ] ] ]
]

{ #category : 'as yet unclassified' }
CMMockModel >> invertedCellMatrix [
	
	^ self cellMatrix collect: [ :each | 1 - each ].
]

{ #category : 'probes' }
CMMockModel >> numberOfAliveCells [

	<probeNamed: 'Number of alive cells' color: '0000FF'>
	^ (self theCells select: [ :cell | cell isAliveCell ]) size
]

{ #category : 'probes' }
CMMockModel >> numberOfDeadCells [

	<probeNamed: 'Number of dead cells' color: 'FF0000'>
	^ (self theCells select: [ :cell | cell isDeadCell ]) size
]

{ #category : 'control' }
CMMockModel >> step: t [
	<control>
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
