Class {
	#name : 'CMNeighbourhoodTest',
	#superclass : 'CMTestObject',
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
	#category : 'Cormas-Tests-Space',
	#package : 'Cormas-Tests',
	#tag : 'Space'
}

{ #category : 'instance creation' }
CMNeighbourhoodTest >> newTestModel [
 	
	^ CMMockModel new
		randomNumberGenerator: (PMFishmanMooreRandomGenerator seed: 42);
		yourself
]

{ #category : 'initialization' }
CMNeighbourhoodTest >> setUp [

	super setUp.
	
	cellInTheMiddle := model cellAt: 2 at: 2.
	
	cellOnTheTopEdge := model cellAt: 1 at: 2.
	cellOnTheBottomEdge := model cellAt: model class numberOfRows at: 2.
	cellOnTheLeftEdge := model cellAt: 2 at: 1.
	cellOnTheRightEdge := model cellAt: 2 at: model class numberOfColumns.
	
	cellInTheTopLeftCorner := model cellAt: 1 at: 1.
	cellInTheBottomLeftCorner := model cellAt: model class numberOfRows at: 1.
	cellInTheTopRightCorner := model cellAt: 1 at: model class numberOfColumns.
	cellInTheBottomRightCorner := model cellAt: model class numberOfRows at: model class numberOfColumns.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 2.
	actualNeighbour := cellInTheBottomLeftCorner neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellInTheBottomLeftCorner neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellInTheBottomLeftCorner neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourNW [
	
	self
		should: [ cellInTheBottomLeftCorner neighbourNW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourS [
	
	self
		should: [ cellInTheBottomLeftCorner neighbourS ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourSE [
	
	self
		should: [ cellInTheBottomLeftCorner neighbourSE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourSW [
	
	self
		should: [ cellInTheBottomLeftCorner neighbourSW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourW [
	
	self
		should: [ cellInTheBottomLeftCorner neighbourW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 3 at: 1 .
		model cellAt: 4 at: 2 .
		model cellAt: 3 at: 2 }.
	
	actualNeighbourhood := cellInTheBottomLeftCorner neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 3.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomLeftNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 4 at: 1 .
		model cellAt: 3 at: 1 .
		model cellAt: 4 at: 2 .
		model cellAt: 3 at: 2 }.
	
	actualNeighbourhood := cellInTheBottomLeftCorner neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 4.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 3.
	actualNeighbour := cellOnTheBottomEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellOnTheBottomEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellOnTheBottomEdge neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellOnTheBottomEdge neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourS [
	
	self
		should: [ cellOnTheBottomEdge neighbourS ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourSE [
	
	self
		should: [ cellOnTheBottomEdge neighbourSE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourSW [
	
	self
		should: [ cellOnTheBottomEdge neighbourSW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 1.
	actualNeighbour := cellOnTheBottomEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourE [
	
	self
		should: [ cellInTheBottomRightCorner neighbourE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 4.
	actualNeighbour := cellInTheBottomRightCorner neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourNE [
	
	self
		should: [ cellInTheBottomRightCorner neighbourNE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellInTheBottomRightCorner neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourS [
	
	self
		should: [ cellInTheBottomRightCorner neighbourS ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourSE [
	
	self
		should: [ cellInTheBottomRightCorner neighbourSE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourSW [
	
	self
		should: [ cellInTheBottomRightCorner neighbourSW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 4 at: 3.
	actualNeighbour := cellInTheBottomRightCorner neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 3 at: 4 .
		model cellAt: 3 at: 3 .
		model cellAt: 4 at: 3 }.
	
	actualNeighbourhood := cellInTheBottomRightCorner neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 3.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testBottomRightNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 4 at: 4 .
		model cellAt: 3 at: 4 .
		model cellAt: 3 at: 3 .
		model cellAt: 4 at: 3 }.
	
	actualNeighbourhood := cellInTheBottomRightCorner neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 4.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellOnTheLeftEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourNW [
	
	self
		should: [ cellOnTheLeftEdge neighbourNW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellOnTheLeftEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellOnTheLeftEdge neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourSW [
	
	self
		should: [ cellOnTheLeftEdge neighbourSW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testLeftNeighbourW [
	
	self
		should: [ cellOnTheLeftEdge neighbourW ]
		raise: Error.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellInTheMiddle neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 2.
	actualNeighbour := cellInTheMiddle neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourNE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellInTheMiddle neighbourNE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellInTheMiddle neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 2.
	actualNeighbour := cellInTheMiddle neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellInTheMiddle neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 1.
	actualNeighbour := cellInTheMiddle neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testMiddleNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 1.
	actualNeighbour := cellInTheMiddle neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourE [
	
	self
		should: [ cellOnTheRightEdge neighbourE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourN [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 4.
	actualNeighbour := cellOnTheRightEdge neighbourN.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourNE [
	
	self
		should: [ cellOnTheRightEdge neighbourNE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourNW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourNW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 4.
	actualNeighbour := cellOnTheRightEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourSE [
	
	self
		should: [ cellOnTheRightEdge neighbourSE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 3 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testRightNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellOnTheRightEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 2.
	actualNeighbour := cellInTheTopLeftCorner neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourN [
	
	self
		should: [ cellInTheTopLeftCorner neighbourN ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourNE [
	
	self
		should: [ cellInTheTopLeftCorner neighbourNE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourNW [
	
	self
		should: [ cellInTheTopLeftCorner neighbourNW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 1.
	actualNeighbour := cellInTheTopLeftCorner neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 2.
	actualNeighbour := cellInTheTopLeftCorner neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourSW [
	
	self
		should: [ cellInTheTopLeftCorner neighbourSW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourW [
	
	self
		should: [ cellInTheTopLeftCorner neighbourW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 2 at: 1 .
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 }.
	
	actualNeighbourhood := cellInTheTopLeftCorner neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 3.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopLeftNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 1 .
		model cellAt: 2 at: 1 .
		model cellAt: 2 at: 2 .
		model cellAt: 1 at: 2 }.
	
	actualNeighbourhood := cellInTheTopLeftCorner neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 4.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellOnTheTopEdge neighbourE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourN [
	
	self
		should: [ cellOnTheTopEdge neighbourN ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourNE [
	
	self
		should: [ cellOnTheTopEdge neighbourNE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourNW [
	
	self
		should: [ cellOnTheTopEdge neighbourNW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 2.
	actualNeighbour := cellOnTheTopEdge neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourSE [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellOnTheTopEdge neighbourSE.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 1.
	actualNeighbour := cellOnTheTopEdge neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 1.
	actualNeighbour := cellOnTheTopEdge neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourE [
	
	self
		should: [ cellInTheTopRightCorner neighbourE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourN [
	
	self
		should: [ cellInTheTopRightCorner neighbourN ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourNE [
	
	self
		should: [ cellInTheTopRightCorner neighbourNE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourNW [
	
	self
		should: [ cellInTheTopRightCorner neighbourNW ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourS [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 4.
	actualNeighbour := cellInTheTopRightCorner neighbourS.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourSE [
	
	self
		should: [ cellInTheTopRightCorner neighbourSE ]
		raise: Error.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourSW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 2 at: 3.
	actualNeighbour := cellInTheTopRightCorner neighbourSW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourW [
	
	| expectedNeighbour actualNeighbour |
	
	expectedNeighbour := model cellAt: 1 at: 3.
	actualNeighbour := cellInTheTopRightCorner neighbourW.

	self assert: actualNeighbour equals: expectedNeighbour.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourhood [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 2 at: 4 }.
	
	actualNeighbourhood := cellInTheTopRightCorner neighbourhood asSet.

	self assert: actualNeighbourhood size equals: 3.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]

{ #category : 'tests' }
CMNeighbourhoodTest >> testTopRightNeighbourhoodAndSelf [
	
	| expectedNeighbourhood actualNeighbourhood |
	
	expectedNeighbourhood := Set withAll: { 
		model cellAt: 1 at: 4 .
		model cellAt: 1 at: 3 .
		model cellAt: 2 at: 3 .
		model cellAt: 2 at: 4 }.
	
	actualNeighbourhood := cellInTheTopRightCorner neighbourhoodAndSelf asSet.

	self assert: actualNeighbourhood size equals: 4.
	self assert: actualNeighbourhood equals: expectedNeighbourhood.
]
