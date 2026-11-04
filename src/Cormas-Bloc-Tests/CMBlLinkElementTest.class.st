"
I test that `CMBlLinkElement` draws a line between the ends of a link, on every type of grid.
"
Class {
	#name : 'CMBlLinkElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlLinkElementTest >> assertLineBetweenCellCentersInGrid: aNeighbourhood [

	| first second element |
	self gridWithNeighbourhood: aNeighbourhood.
	first := model cellAt: 2 at: 2.
	second := model cellAt: 2 at: 3.

	element := self elementOfRoadFrom: first to: second.

	self
		assert: element startPoint
		equals: (self centerOfVertices: (element verticesOfCell: first)).
	self
		assert: element endPoint
		equals: (self centerOfVertices: (element verticesOfCell: second)).
	self deny: (self
			 isTransparentIn: (self parentOf: element)
			 at: element startPoint + element endPoint / 2)
]

{ #category : 'private' }
CMBlLinkElementTest >> centerOfVertices: aCollectionOfPoints [

	^ (aCollectionOfPoints
		   inject: 0 @ 0
		   into: [ :sum :each | sum + each ]) / aCollectionOfPoints size
]

{ #category : 'private' }
CMBlLinkElementTest >> colorIn: anElement at: aPoint [

	^ (self formOf: anElement) colorAt: aPoint rounded
]

{ #category : 'private' }
CMBlLinkElementTest >> elementOfRoadFrom: anEntity to: anotherEntity [

	^ CMBlLinkElement for:
		  (model newEntity: CMMockRoad from: anEntity to: anotherEntity)
]

{ #category : 'private' }
CMBlLinkElementTest >> parentOf: anElement [

	^ BlElement new
		  extent: 300 @ 300;
		  addChild: anElement;
		  yourself
]

{ #category : 'private' }
CMBlLinkElementTest >> parentOfHorizontalRoadWithPov: aPointOfView [
	"The line goes from 48@48 to 80@48"

	self gridWithNeighbourhood: 4.
	^ self parentOf: (CMBlLinkElement for: ((model
				     newEntity: CMMockRoad
				     from: (model cellAt: 2 at: 2)
				     to: (model cellAt: 2 at: 3))
				    pov: aPointOfView;
				    yourself))
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testArrowheadFollowsADiagonalLine [

	| parent |
	self gridWithNeighbourhood: 4.
	parent := self parentOf: (self
			           elementOfRoadFrom: (model cellAt: 2 at: 2)
			           to: (model cellAt: 3 at: 3)).

	self deny: (self isTransparentIn: parent at: 76 @ 74).
	self deny: (self isTransparentIn: parent at: 74 @ 76).
	self assert: (self isTransparentIn: parent at: 58 @ 56).
	self assert: (self isTransparentIn: parent at: 84 @ 78)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testArrowheadGrowsWithTheThicknessOfTheLine [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red size: 0.25).

	self
		assert: (self hexColorIn: parent at: 60 @ 40)
		equals: Color red asHexString.
	self
		assert: (self hexColorIn: parent at: 60 @ 56)
		equals: Color red asHexString.
	self assert: (self isTransparentIn: parent at: 50 @ 40)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testArrowheadHasTheColorOfTheLine [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red).

	self
		assert: (self hexColorIn: parent at: 74 @ 46)
		equals: Color red asHexString
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testArrowheadPointsToTheEndOfTheLink [

	| parent |
	self gridWithNeighbourhood: 4.
	parent := self parentOf: (self
			           elementOfRoadFrom: (model cellAt: 2 at: 3)
			           to: (model cellAt: 2 at: 2)).

	self deny: (self isTransparentIn: parent at: 54 @ 46).
	self assert: (self isTransparentIn: parent at: 74 @ 46)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testColorWithoutASizeDrawsAThinLineOfThatColor [

	| parent color |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red).
	color := self colorIn: parent at: 64 @ 48.

	self assert: color alpha > 0.
	self assert: color red > color green.
	self assert: (self isTransparentIn: parent at: 64 @ 51)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testDefaultPovDrawsAThinDarkLine [

	| parent color |
	parent := self parentOfHorizontalRoadWithPov: CMPointOfView new.
	color := self colorIn: parent at: 64 @ 48.

	self assert: color alpha > 0.
	self assert: color brightness < 0.3.
	self assert: (self isTransparentIn: parent at: 64 @ 51)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testDirectedLinkHasAnArrowheadAtItsEnd [

	| parent |
	self gridWithNeighbourhood: 4.
	parent := self parentOf: (self
			           elementOfRoadFrom: (model cellAt: 2 at: 2)
			           to: (model cellAt: 2 at: 3)).

	self deny: (self isTransparentIn: parent at: 74 @ 46).
	self deny: (self isTransparentIn: parent at: 74 @ 50).
	self assert: (self isTransparentIn: parent at: 54 @ 46).
	self assert: (self isTransparentIn: parent at: 84 @ 46)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testDrawsAHorizontalLine [

	| parent |
	self gridWithNeighbourhood: 4.

	parent := self parentOf: (self
			           elementOfRoadFrom: (model cellAt: 2 at: 2)
			           to: (model cellAt: 2 at: 3)).

	self deny: (self isTransparentIn: parent at: 64 @ 48).
	self assert: (self isTransparentIn: parent at: 96 @ 48).
	self assert: (self isTransparentIn: parent at: 64 @ 64)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testDrawsAStraightLineBetweenCellCenters [

	| element parent |
	self gridWithNeighbourhood: 4.

	element := self
		           elementOfRoadFrom: (model cellAt: 2 at: 2)
		           to: (model cellAt: 3 at: 3).
	parent := self parentOf: element.

	self assert: element startPoint equals: 48 @ 48.
	self assert: element endPoint equals: 80 @ 80.
	self deny: (self isTransparentIn: parent at: 64 @ 64).
	self assert: (self isTransparentIn: parent at: 80 @ 48).
	self assert: (self isTransparentIn: parent at: 48 @ 80).
	self assert: (self isTransparentIn: parent at: 96 @ 96)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testDrawsNothingWhileAnEndIsNotOnTheGrid [

	| cow element |
	self gridWithNeighbourhood: 4.
	cow := model newEntity: CMMockCow.

	element := self elementOfRoadFrom: cow to: (model cellAt: 2 at: 2).

	self assert: element startPoint isNil.
	self assert: element endPoint isNil.
	self assert:
		(self isTransparentIn: (self parentOf: element) at: 48 @ 48)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testEndOffTheGridDrawsNoArrowhead [

	| element |
	self gridWithNeighbourhood: 4.

	element := self
		           elementOfRoadFrom: (model cellAt: 2 at: 3)
		           to: (model newEntity: CMMockCow).

	self assert:
		(self isTransparentIn: (self parentOf: element) at: 74 @ 46)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testEndsAtTheSamePositionDrawWithoutAnError [

	| cell element |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 2 at: 2.

	element := self
		           elementOfRoadFrom: (self newCowOn: cell)
		           to: (self newCowOn: cell).

	self assert: element startPoint equals: element endPoint.
	self assert:
		(self isTransparentIn: (self parentOf: element) at: 100 @ 100)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testExampleBetweenTwoCellsAnswersAnElementWithALine [

	self assert:
		CMBlLinkElement exampleBetweenTwoCells startPoint isPoint
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testIgnoresBorder [

	| parent |
	parent := self parentOfHorizontalRoadWithPov: (CMPointOfView new
			           color: Color red;
			           borderColor: Color green;
			           borderWidth: 0.25;
			           yourself).

	self assert: (self colorIn: parent at: 64 @ 48) red
		> (self colorIn: parent at: 64 @ 48) green.
	self assert: (self isTransparentIn: parent at: 64 @ 51)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testIgnoresShapeAndTile [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView shape: #star).

	self deny: (self isTransparentIn: parent at: 64 @ 48).
	self assert: (self isTransparentIn: parent at: 64 @ 51)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineBetweenCellCentersInGridOfFlatTopHexagons [

	self assertLineBetweenCellCentersInGrid: #flat6
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineBetweenCellCentersInGridOfPointyTopHexagons [

	self assertLineBetweenCellCentersInGrid: 6
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineBetweenCellCentersInGridOfSquares [

	self assertLineBetweenCellCentersInGrid: 4
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineBetweenCellCentersInGridOfSquaresWithDiagonals [

	self assertLineBetweenCellCentersInGrid: 8
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineBetweenCellCentersInGridOfTriangles [

	self assertLineBetweenCellCentersInGrid: 3
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineEndsAtTheAverageOfTheCellCentersOfAnAggregate [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := model createAggregate: CMMockAggregate from: {
			             (model cellAt: 2 at: 2).
			             (model cellAt: 2 at: 3) }.

	element := self
		           elementOfRoadFrom: aggregate
		           to: (model cellAt: 1 at: 1).

	self assert: element startPoint equals: 64 @ 48
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineEndsAtTheCellsOfNestedAggregates [

	| inner outer element |
	self gridWithNeighbourhood: 4.
	inner := model createAggregate: CMMockAggregate from: {
			         (model cellAt: 2 at: 2).
			         (model cellAt: 2 at: 3) }.
	outer := model createAggregate: CMMockAggregate from: { inner }.

	element := self elementOfRoadFrom: outer to: (model cellAt: 1 at: 1).

	self assert: element startPoint equals: 64 @ 48
]

{ #category : 'tests' }
CMBlLinkElementTest >> testLineEndsAtTheExactPositionOfAnAgent [

	| cow element |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 2).
	cow positionInCell: 0.25 @ 0.75.

	element := self elementOfRoadFrom: cow to: (model cellAt: 3 at: 3).

	self assert: element startPoint equals: 40 @ 56
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testLineReachesTheArrowheadWithoutAGap [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red size: 0.25).

	{ 55. 56. 57 } do: [ :x |
			self
				assert: (self hexColorIn: parent at: x @ 48)
				equals: Color red asHexString ]
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testMovingAnEndMovesTheLineAndTheArrowhead [

	| element parent |
	self gridWithNeighbourhood: 4.
	element := self
		           elementOfRoadFrom: (model cellAt: 2 at: 2)
		           to: (model cellAt: 2 at: 3).
	parent := self parentOf: element.
	self deny: (self isTransparentIn: parent at: 74 @ 46).

	element moveEnd: (model cellAt: 2 at: 3) to: 80 @ 112.

	self assert: element endPoint equals: 80 @ 112.
	self assert: (self isTransparentIn: parent at: 74 @ 46).
	self deny: (self isTransparentIn: parent at: 64 @ 80)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testPovInvisibleOfALinkDrawsNothingVisible [

	| road parent |
	self gridWithNeighbourhood: 4.
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 2 at: 2)
		        to: (model cellAt: 2 at: 3).

	road pov: road povInvisible.
	parent := self parentOf: (CMBlLinkElement for: road).

	self assert: (self isTransparentIn: parent at: 64 @ 48)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testRefreshFollowsAChangeOfDirection [

	| highway element parent |
	self gridWithNeighbourhood: 4.
	highway := model
		           newEntity: CMMockHighway
		           from: (model cellAt: 2 at: 2)
		           to: (model cellAt: 2 at: 3).
	element := CMBlLinkElement for: highway.
	parent := self parentOf: element.
	self deny: (self isTransparentIn: parent at: 74 @ 46).

	highway isOneWay: false.
	element refresh.

	self assert: (self isTransparentIn: parent at: 74 @ 46)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testRefreshFollowsAChangeOfPov [
	"This looks at the start of the line, because the arrowhead of a thick line is long"

	| road element parent |
	self gridWithNeighbourhood: 4.
	road := model
		        newEntity: CMMockRoad
		        from: (model cellAt: 2 at: 2)
		        to: (model cellAt: 2 at: 3).
	element := CMBlLinkElement for: road.
	parent := self parentOf: element.
	self assert: (self isTransparentIn: parent at: 52 @ 51).

	road pov: (CMPointOfView color: Color red size: 0.25).
	element refresh.

	self
		assert: (self hexColorIn: parent at: 52 @ 51)
		equals: Color red asHexString
]

{ #category : 'tests' }
CMBlLinkElementTest >> testRefreshFollowsAnAgentThatMoves [

	| cow element |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 2).
	element := self elementOfRoadFrom: cow to: (model cellAt: 1 at: 1).

	cow moveTo: (model cellAt: 3 at: 3).
	element refresh.

	self assert: element startPoint equals: 80 @ 80
]

{ #category : 'tests' }
CMBlLinkElementTest >> testRefreshFollowsAnAggregateThatChanges [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 2 at: 2) }.
	element := self
		           elementOfRoadFrom: aggregate
		           to: (model cellAt: 1 at: 1).
	self assert: element startPoint equals: 48 @ 48.

	aggregate addComponents:
		{ (model cellAt: 2 at: 3) } asOrderedCollection.
	element refresh.

	self assert: element startPoint equals: 64 @ 48
]

{ #category : 'tests' }
CMBlLinkElementTest >> testRefreshFollowsAnEndLeavingAndComingBackToTheGrid [

	| cow element parent |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 2).
	element := self elementOfRoadFrom: cow to: (model cellAt: 2 at: 3).
	parent := self parentOf: element.

	cow leave.
	element refresh.
	self assert: (self isTransparentIn: parent at: 64 @ 48).

	cow moveTo: (model cellAt: 2 at: 2).
	element refresh.
	self deny: (self isTransparentIn: parent at: 64 @ 48)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testSizeIsTheThicknessAsAFractionOfTheCell [
	"This looks at the start of the line, because the arrowhead of a thick line is long"

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red size: 0.25).

	self
		assert: (self hexColorIn: parent at: 52 @ 48)
		equals: Color red asHexString.
	self
		assert: (self hexColorIn: parent at: 52 @ 51)
		equals: Color red asHexString.
	self assert: (self isTransparentIn: parent at: 52 @ 54)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testSizeWithoutAColorDrawsAThickDarkLine [
	"This looks at the start of the line, because the arrowhead of a thick line is long"

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView size: 0.25).

	self assert: (self colorIn: parent at: 52 @ 51) brightness < 0.3.
	self assert: (self colorIn: parent at: 52 @ 51) alpha > 0.9
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testTipOfTheArrowheadIsSharpOnAThickLine [
	"The line would show as a square behind the tip if it went all the way to the end"

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color red size: 0.25).

	self assert: (self isTransparentIn: parent at: 78 @ 44).
	self assert: (self isTransparentIn: parent at: 78 @ 52)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testTranslucentLineDoesNotShowThroughTheArrowhead [
	"Under the arrowhead, a translucent line would make it stronger"

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: (Color red alpha: 0.5) size: 0.25).

	self assert: (((self formOf: parent) colorAt: 70 @ 48) red
			 closeTo: 1
			 precision: 0.05).
	self assert: (((self formOf: parent) colorAt: 70 @ 48) alpha
			 closeTo: 0.5
			 precision: 0.05)
]

{ #category : 'tests - point of view' }
CMBlLinkElementTest >> testTransparentColorDrawsNothingVisible [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color transparent size: 0.25).

	self assert: (self isTransparentIn: parent at: 64 @ 48)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testTransparentColorHidesTheArrowhead [

	| parent |
	parent := self parentOfHorizontalRoadWithPov:
		          (CMPointOfView color: Color transparent).

	self assert: (self isTransparentIn: parent at: 74 @ 46)
]

{ #category : 'tests' }
CMBlLinkElementTest >> testTwoAgentsOnOneCellHaveDifferentLineEnds [

	| cow goat cell element |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 2 at: 2.
	cow := self newCowOn: cell.
	goat := self newCowOn: cell.
	cow positionInCell: 0 @ 0.
	goat positionInCell: 1 @ 1.

	element := self elementOfRoadFrom: cow to: goat.

	self assert: element startPoint equals: 32 @ 32.
	self assert: element endPoint equals: 64 @ 64
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testUndirectedLineGoesAllTheWayToItsEnd [

	| friendship element parent |
	self gridWithNeighbourhood: 4.
	friendship := model
		              newEntity: CMMockFriendship
		              from: (model cellAt: 2 at: 2)
		              to: (model cellAt: 2 at: 3).
	element := CMBlLinkElement for: friendship.
	parent := self parentOf: element.

	self deny: (self isTransparentIn: parent at: 78 @ 48)
]

{ #category : 'tests - arrowhead' }
CMBlLinkElementTest >> testUndirectedLinkHasNoArrowhead [

	| parent |
	self gridWithNeighbourhood: 4.
	parent := self parentOf: (CMBlLinkElement for: (model
				            newEntity: CMMockFriendship
				            from: (model cellAt: 2 at: 2)
				            to: (model cellAt: 2 at: 3))).

	self deny: (self isTransparentIn: parent at: 64 @ 48).
	self assert: (self isTransparentIn: parent at: 74 @ 46).
	self assert: (self isTransparentIn: parent at: 54 @ 46)
]
