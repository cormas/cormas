+ utilities - mathematics
nextCyclicElementOf: anArray currentElement: currentElement
	"Purpose : return the next element of anArray. 
If currentElement is the last of anArray, then return the first element.
Arguments: anArray = <Array>
currentElement = <Object>.
Examples: 
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 3 => 4
	Cormas nextCyclicElementOf: #(1 2 3 4 5 6 7) currentElement: 7 => 1
	Cormas nextCyclicElementOf: #(monday tuesday wednesday thursday friday saturday sunday) currentElement: #sunday => #monday"
	
	| index |
	index := anArray indexOf: currentElement.
	index = anArray size
		ifTrue: [index := 1]
		ifFalse: [index := index + 1].
	^anArray at: index