Extension { #name : 'CMSpaceNeighbourhood' }

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
