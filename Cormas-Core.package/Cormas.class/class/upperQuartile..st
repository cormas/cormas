+ utilities - mathematics
upperQuartile: aCollectionOfNumbers
	"Purpose : Returns the upper quartile of a numbers distribution. 
The upper quartile (or third quartile or Q3) is the value of the sorted series of numbers which splits the highest 25% of data (or lowest 75%)
For example, assume that we have obtained the following 20 observations:
   2, 4, 7, -20, 22, -1, 0, -1, 7, 15, 8, 4, -4, 11, 11, 12, 3, 12, 18, 1
In order to calculate the quartiles we first have to sort the observations:
   -20, -4, -1, -1, 0, 1, 2, 3, 4, 4, 7, 7, 8, 11, 11, 12, 12, 15, 18, 22
The position of the third quartile is x = round(0.25*(20+1)) = round(15.75) = 16, which means that Q3 is the 16th value of the sorted series, namely Q3 = 12.
Example: Cormas upperQuartile: #(2 4 7 -20 22 -1 0 -1 7 15 8 4 -4 11 11 12 3 12 18 1)"
	
	| sortedColl |
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	sortedColl := aCollectionOfNumbers asSortedCollection: [:a :b | a < b].
	^sortedColl at: (0.75 * (sortedColl size + 1)) rounded