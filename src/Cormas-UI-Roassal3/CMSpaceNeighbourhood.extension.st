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
CMSpaceNeighbourhood >> cellShapeOriginOffset [
	"Some figures like RSBox have origin in the top-left corner. Others like RSPolygon have origin in the top-middle. Return a point with the relative offset for the origin.
	
	For example, 0@0 means that the origin is at the top-left corner
	0.5@0 means that it's in the top-middle because 0.5 represents 50% of the shape's width"
	
	^ 0@0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> organizeShapesPositions: aRSGroup [
	"Do nothing, except for grid of hexagons and triangles"

	
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> roassalMasterShape [

	self subclassResponsibility
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpaceNeighbourhood >> rotateShapes: aRSGroup [
	"Do nothing, except for grid of triangles"

	
]
