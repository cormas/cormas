Class {
	#name : #CMNeighbourhoodTest,
	#superclass : #CMTestObject,
	#instVars : [
		'cellInTheMiddle',
		'cellOnTheTopEdge',
		'cellOnTheBottomEdge',
		'cellOnTheLeftEdge',
		'cellOnTheRightEdge',
		'cellInTheTopLeftCorner',
		'cellInTheBottomLeftCorner',
		'cellInTheTopRightCorner',
		'cellInTheBottomRightCorner'
	],
	#category : #'Cormas-Tests-Space'
}

{ #category : #'instance creation' }
CMNeighbourhoodTest >> newTestModel [
 	
	^ (CMMockModel	newWithActiveInit: #initEmpty)
		randomSeed: 42;
		initializeSimulation;
		yourself
]

{ #category : #initialization }
CMNeighbourhoodTest >> setUp [

	super setUp.
	
	cellInTheMiddle := model cellAt: 2 at: 2.
	
	cellOnTheTopEdge := model cellAt: 1 at: 2.
	cellOnTheBottomEdge := model cellAt: model numberOfRows at: 2.
	cellOnTheLeftEdge := model cellAt: 2 at: 1.
	cellOnTheRightEdge := model cellAt: 2 at: model numberOfColumns.
	
	cellInTheTopLeftCorner := model cellAt: 1 at: 1.
	cellInTheBottomLeftCorner := model cellAt: model numberOfRows at: 1.
	cellInTheTopRightCorner := model cellAt: 1 at: model numberOfColumns.
	cellInTheBottomRightCorner := model cellAt: model numberOfRows at: model numberOfColumns.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellInTheMiddle neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 2.
	actualNeighbour := cellInTheMiddle neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellInTheMiddle neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellInTheMiddle neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellInTheMiddle neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellInTheMiddle neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellInTheMiddle neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 1.
	actualNeighbour := cellInTheMiddle neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := { 
		model cellAt: 1 at: 2 .
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellInTheMiddle neighbourhood.

	self assert: actualNeighbourhood size equals: 8.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := {
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 .
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellInTheMiddle neighbourhoodAndSelf.

	self assert: actualNeighbourhood size equals: 9.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]
