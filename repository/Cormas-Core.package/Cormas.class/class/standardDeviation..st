+ utilities - mathematics
standardDeviation: aCollectionOfNumbers
	"Purpose : Returns the standardDeviation of set of numbers. Measure of the dispersal of a series with regard to their average. Its value is obtained by calculating the square root of the variance (see ''variance:').
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Example:		Cormas standardDeviation: #( 1 2 3)	=> 0.816497"
	
	^(self variance: aCollectionOfNumbers) sqrt