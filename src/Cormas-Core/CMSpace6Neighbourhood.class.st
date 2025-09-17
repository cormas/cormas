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

{ #category : 'as yet unclassified' }
CMSpace6Neighbourhood >> axialCoordinatesToCube: aPoint [
	"Convert hexagonal axial coordinates (q, r) to cube coordinates (q, r, s)"
	
	| q r |
	
	q := aPoint x.
	r := aPoint y.
	
	^ { q . r . (-1 * q - r) }
]

{ #category : 'utilities - space metrics' }
CMSpace6Neighbourhood >> distanceInClosedEnvironmentFromPoint: pointA toPoint: pointB [
	"Source: https://www.redblobgames.com/grids/hexagons/#distances-axial"
	
	| aAxial bAxial aQ aR bQ bR |
	
	aAxial := self offsetCoordinatesToAxial: pointA.
	bAxial := self offsetCoordinatesToAxial: pointB.
	
	aQ := aAxial x.
	aR := aAxial y.
	
	bQ := bAxial x.
	bR := bAxial y.
	
	^ ((aQ - bQ) abs + (aQ + aR - bQ - bR) abs + (aR - bR) abs) / 2
]

{ #category : 'as yet unclassified' }
CMSpace6Neighbourhood >> offsetCoordinatesToAxial: aPoint [
	"Convert hexagonal offset coordinates (x, y) to axial coordinates (q, r)"
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
CMSpace6Neighbourhood >> offsetCoordinatesToCube: aPoint [
	"Convert hexagonal offset coordinates (x, y) to cube coordinates (q, r, s)"
	^ self axialCoordinatesToCube: (self offsetCoordinatesToAxial: aPoint)
]
