"
Abstract class for hexagonal neighbourhood.
It is specialized as Flat or Pointed hexagon
"
Class {
	#name : 'CMSpace6Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
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
