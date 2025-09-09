Extension { #name : 'CMSpaceNeighbourhood' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalIntersection [
	"A proportion of a bounding rectangle that intersects horizontally - between the columns of a grid.
	By default, return 0, meaning that there is no intersection"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalShiftEven [
	"A proportion of a bounding rectangle that will be shifted for the even rows"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalShiftOdd [
	"A proportion of a bounding rectangle that will be shifted for the odd rows"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleVerticalIntersection [
	"A proportion of a bounding rectangle that intersects vertically - between the rows of a grid.
	By default, return 0, meaning that there is no intersection"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleVerticalShiftEven [
	"A proportion of a bounding rectangle that will be shifted for the even columns"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> boundingRectangleVerticalShiftOdd [
	"A proportion of a bounding rectangle that will be shifted for the odd columns"
	
	^ 0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> organizeShapesPositions: r [
	"Do nothing, except for grid of hexagons and triangles"

	
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> roassalMasterShape [

	self subclassResponsibility
]
