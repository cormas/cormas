"
Hexagonal neighbourhood with Flat top hexagons
"
Class {
	#name : 'CMSpace6NeighbourhoodFlatTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace6NeighbourhoodFlatTop class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 6 "

	^ (super isStartConditionFor: aSymbolOrNumber) ifTrue: [
		  CMSpaceModel flatTopHexagons ]
]
