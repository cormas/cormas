+ utilities - mathematics
interquartileRange: aCollectionOfNumbers
	"Purpose : Returns the interquartile range quartile of a collection of numbers 
The interquartile range is the difference between the upper and lower quartiles
Example: Cormas interquartileRange: #(21 -15 7 -20 22 -8 5 -1 7 15 8 4 -4 11 24 12 47 12 18 1)"
	
	aCollectionOfNumbers size = 0 ifTrue: [^0].
	^(self upperQuartile: aCollectionOfNumbers)
		- (self lowerQuartile: aCollectionOfNumbers)