+ utilities - space metrics
meanNearestNeighbourDistanceAggregate: aClass attribute: anAttribute
	"Purpose: Return the average nearest distance between all aggregates that implement the attribute anAttribute
Argument: aClass is an aggregate class that has several subclasses. 
anAttribute is the name of the attribute, ex #state"
	
	^self spaceModel meanNearestNeighbourDistanceAggregate: aClass attribute:
			anAttribute