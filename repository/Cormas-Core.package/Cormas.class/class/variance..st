+ utilities - mathematics
variance: aCollectionOfNumbers
	"Purpose: Returns the variance of set of numbers. Measure of the dispersal of a series with regard to their average. The dispersal of a statistical distribution is obtained by dividing the sum of the squares of the distances in the average by the number N from elements. For instance the average of 1, 2 and 3 is 2 , but the variance is 0,667.
	[(1 - 2)2 + (2 - 2)2 + (3 - 2)2] √∑ 3 = 0,667
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example: Cormas variance: #( 1 2 3)		=> 0.666667  "

	| moy |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	moy := self average: aCollectionOfNumbers.
	^ ((aCollectionOfNumbers inject: 0 into: [ :subTotal :next | subTotal + (next - moy) squared ])
		/ aCollectionOfNumbers size) asFloat