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
CMNeighbourhoodTest >> testBottomNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 3.
	actualNeighbour := cellOnTheBottomEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellOnTheBottomEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellOnTheBottomEdge neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellOnTheBottomEdge neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourS [
	
	self
		should: [ cellOnTheBottomEdge neighbourS ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourSE [
	
	self
		should: [ cellOnTheBottomEdge neighbourSE ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourSW [
	
	self
		should: [ cellOnTheBottomEdge neighbourSW ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 1.
	actualNeighbour := cellOnTheBottomEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 1 .
		model cellAt: 4 at: 1 .
		model cellAt: 4 at: 3 .
		model cellAt: 3 at: 3 }.
	
	actualNeighbourhood := cellOnTheBottomEdge neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 5.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testBottomNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: {
		model cellAt: 4 at: 2 . 
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 1 .
		model cellAt: 4 at: 1 .
		model cellAt: 4 at: 3 .
		model cellAt: 3 at: 3 }.
	
	actualNeighbourhood := cellOnTheBottomEdge neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 6.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellOnTheLeftEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourNW [
	
	self
		should: [ cellOnTheLeftEdge neighbourNW ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellOnTheLeftEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourSW [
	
	self
		should: [ cellOnTheLeftEdge neighbourSW ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourW [
	
	self
		should: [ cellOnTheLeftEdge neighbourW ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 }.
	
	actualNeighbourhood := cellOnTheLeftEdge neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 5.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testLeftNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: {
		model cellAt: 2 at: 1 .
		model cellAt: 1 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 }.
	
	actualNeighbourhood := cellOnTheLeftEdge neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 6.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
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
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 2 .
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellInTheMiddle neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 8.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testMiddleNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: {
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 .
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 3 at: 2 .
		model cellAt: 3 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellInTheMiddle neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 9.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourE [
	
	self
		should: [ cellOnTheRightEdge neighbourE ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 4.
	actualNeighbour := cellOnTheRightEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourNE [
	
	self
		should: [ cellOnTheRightEdge neighbourNE ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 4.
	actualNeighbour := cellOnTheRightEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourSE [
	
	self
		should: [ cellOnTheRightEdge neighbourSE ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 4 .
		model cellAt: 1 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 3 at: 3 .
		model cellAt: 3 at: 4 }.
	
	actualNeighbourhood := cellOnTheRightEdge neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 5.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testRightNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: {
		model cellAt: 2 at: 4 .
		model cellAt: 1 at: 4 .
		model cellAt: 1 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 3 at: 3 .
		model cellAt: 3 at: 4 }.
	
	actualNeighbourhood := cellOnTheRightEdge neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 6.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellOnTheTopEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourN [
	
	self
		should: [ cellOnTheTopEdge neighbourN ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourNE [
	
	self
		should: [ cellOnTheTopEdge neighbourNE ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourNW [
	
	self
		should: [ cellOnTheTopEdge neighbourNW ]
		raise: Error.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 2.
	actualNeighbour := cellOnTheTopEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellOnTheTopEdge neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 1.
	actualNeighbour := cellOnTheTopEdge neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellOnTheTopEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 2 at: 2 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellOnTheTopEdge neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 5.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : #tests }
CMNeighbourhoodTest >> testTopNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 2 .
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 2 at: 2 .
		model cellAt: 2 at: 3 .
		model cellAt: 1 at: 3 }.
	
	actualNeighbourhood := cellOnTheTopEdge neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 6.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]
