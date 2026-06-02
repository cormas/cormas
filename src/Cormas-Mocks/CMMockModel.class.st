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
	#superclass : 'CMModel',
	#instVars : [
		'theCells',
		'theCows',
		'theGoats',
		'weather',
		'initialNumberOfCows',
		'initialNumberOfGoats',
		'numberOfColumns',
		'numberOfRows'
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

{ #category : 'tests - printing' }
CMMockModel class >> prefix [

	^ 'CMMock'
]

{ #category : 'as yet unclassified' }
CMMockModel class >> screenshotContents [
	"Screenshot of model's spatial grid provided as a string in Base 64 encoding"
	^ 'iVBORw0KGgoAAAANSUhEUgAAAEQAAABFCAYAAADzT0AXAAAABmJLR0QA/wD/AP+gvaeTAAADj0lEQVR4nO2awU7bShRAjx0rtQkgSFSeskm2wEe8fkF/gu7oRwA7lmzKrvzEk9i//gNBQixIFpEaBMkCy1PF9nRhHMpQQpp4jKnnbCyP4zvjk/E4vjfW4eGhFEIwL67rArBoDNd1GY1Gc8dYW1sDWDiGI4Rgf39/7iDpuYvGEEKwt7c3d4yDgwOAhWPYc5/9l2KEKBghCm9CyPfv8O0bDAb6+yq8kK9fod2GDx+S7cmJ3v4KLWQwgM+f4cePZF+IZP/6Wl+fhRbS6TzISBEiaddFoYVsb8O7d4/bXDdp10WhhWxswPFxIgGS7fExvH+vr09HX+hs2NmBjx/h/By2tvTKgDcgBBIJukWkFPqWeQ2MEAUjRMEy+ZDHMez0guZl0fOLhjMajTJJzJgE0V+KEaJghChoF/IP8C+wobujjNAq5BPQBf6/3+7o7CwjtAnZAL4A6du7e7+f0yvJ3GgTss2DjBT3vr3IaBPSAZRkF+K+vchoe/0fALskt4lLImMX0JgOnYk4jrm9vcX3fQBqtRr1eh3bTuaG1nzICfAfsAWc8/oyfN+n1+shpaRSqUzaBoMB7XYbyCFBdM3riwAYj8dcXV3hOI8vORXT7XaxLKs8P8z6/f7k4n+Hbdu4rlseIUEQYFnWs8cty6JSqZRHSBzHL37Gtm2so6MjuWhSRQhR+ATR6urqi1JqtVp5ZsislCZB1Ol0pi6qAKenp+WZIekPr2nEcVweIZ7nIaV89riUkiiKyiOk2WxOXVSjKEIIUR4h1WqVVqtFFEWEYThpD8OQKIpot9tIKd9GbTcrlpeX2dzcZDgccnd3B+T8cldEbNum0WjQaDR+fzzn8RQeI0TBCFEwQhSMEAUjRMEIUTBCFEqTIJo1RiYzpCj/QlrkS0nPzyxBVJQYiyaqzBqiYIQoGCEKRoiCEaLwKgmi8XhMv98nCAKiKGJlZQWAs7MzKpUKnufRbDapVqu5jy33GeL7PhcXF5Naq+M4SCmTfKbjYFkWQRBweXk5+Q9HnuQqJI5jer3e5MKfIy08d7vdmWqyWZKrkJubm6m1ERUpJcPhUOOInpKrkCAIXiwn/orjOLnfNuYpo5CrkKWlJaIomvnzYRhSq9U0jugpuQqp1+tTF1MVy7JYX1/XOKKn5CrEtm1arRZhGM5UeG61WjNV7bMkkwQR/HlixvO8yQLreR6QLLrwUHj+kydSVokqg8JPSYeJSWxxVB8AAAAASUVORK5CYII='
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
		createN: self initialNumberOfCows
		randomlyLocatedAloneEntities: CMMockCow.
		
	self
		createN: self initialNumberOfGoats
		randomlyLocatedAloneEntities: CMMockGoat.
]

{ #category : 'init' }
CMMockModel >> initAlive [
	<init>	
	self cells do: #initAlive
]

{ #category : 'init' }
CMMockModel >> initDead [
	<init>
	self cells do: #initDead
]

{ #category : 'init' }
CMMockModel >> initEmpty [
	<init>
	self
		createGridNumberOfRows: self numberOfRows
		numberOfColumns: self numberOfColumns
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
	self cells do: #initRandom
]

{ #category : 'accessing' }
CMMockModel >> initialNumberOfCows [
	<parameterInteger: 'Number of cows' min: 1 max: 5 default: 3>
	^ initialNumberOfCows
]

{ #category : 'accessing' }
CMMockModel >> initialNumberOfCows: aNumber [

	initialNumberOfCows := aNumber
]

{ #category : 'accessing' }
CMMockModel >> initialNumberOfGoats [
	<parameterInteger: 'Number of goats' min: 1 max: 5 default: 3>
	^ initialNumberOfGoats
]

{ #category : 'accessing' }
CMMockModel >> initialNumberOfGoats: aNumber [

	initialNumberOfGoats := aNumber
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
	
	1 to: self numberOfRows do: [ :i | 
		1 to: self numberOfColumns do: [ :j | 
			matrixCellValue := (self cellMatrix at: i) at: j.
			modelCell := self pickCellAt: j @ i.
			
			matrixCellValue = 0 ifTrue: [ modelCell initDead ].
			matrixCellValue = 1 ifTrue: [ modelCell initAlive ] ] ]
]

{ #category : 'as yet unclassified' }
CMMockModel >> invertedCellMatrix [
	
	^ self cellMatrix collect: [ :each | 1 - each ].
]

{ #category : 'testing' }
CMMockModel >> isGoatInFirstCell [

	<boolean>
	^ self cells first hasOccupantsOfClass: CMMockGoat
]

{ #category : 'probes' }
CMMockModel >> numberOfAliveCells [

	<probeNamed: 'Number of alive cells' color: '0000FF'>
	^ (self cells select: [ :cell | cell isAliveCell ]) size
]

{ #category : 'accessing' }
CMMockModel >> numberOfColumns [
	<parameterInteger: 'Number of columns' min: 1 max: 20 default: 4>
	^ numberOfColumns
]

{ #category : 'accessing' }
CMMockModel >> numberOfColumns: aNumber [

	numberOfColumns := aNumber
]

{ #category : 'probes' }
CMMockModel >> numberOfDeadCells [

	<probeNamed: 'Number of dead cells' color: 'FF0000'>
	^ (self cells select: [ :cell | cell isDeadCell ]) size
]

{ #category : 'accessing' }
CMMockModel >> numberOfRows [
	<parameterInteger: 'Number of rows' min: 1 max: 20 default: 4>
	^ numberOfRows
]

{ #category : 'accessing' }
CMMockModel >> numberOfRows: aNumber [

	numberOfRows := aNumber
]

{ #category : 'control' }
CMMockModel >> step: t [
	<control>
	self askRandom: CMMockAnimal toDo: #step.
	self stepSynchronouslyCA: t.
]

{ #category : 'accessing' }
CMMockModel >> weather [
	<parameterValues: #(sunny cloudy rainy snowy) default: #sunny>
	^ weather
]

{ #category : 'accessing' }
CMMockModel >> weather: aSymbol [
	
	weather := aSymbol
]
