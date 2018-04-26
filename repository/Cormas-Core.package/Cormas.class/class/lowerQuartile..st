+ utilities - mathematics
lowerQuartile: aCollectionOfNumbers
	"Purpose : Returns the lower quartile of a numbers distribution. 
The lower quartile (or first quartile or Q1) is the value of the sorted series of numbers which splits the lowest 25% of data
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the first quartile is x = round(0.25*(20+1)) = round(5.25) = 5, which means that Q1 is the 5th value of the sorted series, namely Q1 = 0.
Example: Cormas lowerQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"

	| sortedColl |
	aCollectionOfNumbers size = 0
		ifTrue: [ ^ 0 ].
	sortedColl := aCollectionOfNumbers asSortedCollection: [ :a :b | a < b ].
	^ sortedColl at: (0.25 * (sortedColl size + 1)) rounded