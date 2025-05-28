"
Abstract class for hexagonal neighbourhood.
It is specialized as Flat or Pointy hexagon
"
Class {
	#name : 'CMSpace6Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
	#instVars : [
		'flatTopHexagons'
	],
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMSpace6Neighbourhood class >> cardinal [

	^6
]

{ #category : 'accessing' }
CMSpace6Neighbourhood class >> cardinalSymbol [

	^#six
]

{ #category : 'accessing' }
CMSpace6Neighbourhood class >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [

	^ nbLines max: nbCols
]

{ #category : 'accessing' }
CMSpace6Neighbourhood class >> flatTopHexagons [
	"By default, pointedTop hexagons"

	^ flatTopHexagons ifNil: [ flatTopHexagons := false ] 
]

{ #category : 'accessing' }
CMSpace6Neighbourhood class >> flatTopHexagons: aBoolean [

	^ flatTopHexagons := aBoolean
]

{ #category : 'as yet unclassified' }
CMSpace6Neighbourhood >> adaptedNumber: anInteger [
"Adapt anInteger to the size of the grid"
 ^ TCMMath
					   number: anInteger 
					   onCycle: self numberOfColumns * self numberOfRows
]

{ #category : 'set grid' }
CMSpace6Neighbourhood >> organizeShapesPositions: aRSGroup [
	self subclassResponsibility 
]
