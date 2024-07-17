"
Neighbourhood configuration for non-squared spaces, for example, polygon shapes (without 3, 4, 6 or 8 sides).

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMNonSquaredSpaceNeighbourhood,
	#superclass : #CMSpaceNeighbourhood,
	#category : 'Cormas-Core-Space'
}

{ #category : #'environment - sensing - space' }
CMNonSquaredSpaceNeighbourhood >> nearestEmptyCellFor: aCMAgentLocation [

	^ aCMAgentLocation nearestCellVerifying: [:p | p hasNoOccupants]
]
