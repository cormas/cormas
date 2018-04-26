+ utilities - mathematics
giniIndexOf: aCollec absoluteCorrection: aNumber
	"Purpose: Returns the gini of a set of numbers, which can include negative values
See the 'giniIndexOf: method for more details on Gini index.
As the calculation of the Gini index requieres that individuals cannot have a negative value for the assessed attribute, the following method operates a translation of the attribute value in case the attribute you want to assess has negative value.
Enter in the absoluteCorrection argument an amount equals or higher to the minimum negative value that your attribute may take.
Beware that this translation affects the absolute value of the Gini index.
(e.g. the Gini index calculated with an ''absoluteCorrection'' value of 1000 will not be the same than one calculated with a  ''absoluteCorrection'' value of 5000).
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Negative value are accepted .
Example: Cormas giniIndexOf: #( 4.5 -88.7 456 -12 64 89.1 44 781) absoluteCorrection: 100  -> 50.8776"
	
	| tot sort cumAttributeShare previousValue value areaAcollec areaAbyreaBcollec tot2 index |
	tot := 0.
	aCollec do: [:i | tot := tot + i + aNumber].
	sort := SortedCollection
		withAll: aCollec
		sortBlock: [:x :y | x < y].
	cumAttributeShare := OrderedCollection new.
	previousValue := 0.
	sort
		do:
			[:i | 
			value := (i + aNumber) / tot.
			cumAttributeShare add: value + previousValue.
			previousValue := cumAttributeShare last].
	cumAttributeShare last rounded ~= 1 ifTrue: [self halt].
	areaAcollec := OrderedCollection new.
	1
		to: cumAttributeShare size
		do:
			[:i | 
			i = 1
				ifTrue: [areaAcollec add: (cumAttributeShare at: i)]
				ifFalse:
					[areaAcollec add: (cumAttributeShare at: i) + (cumAttributeShare at: i - 1)]].
	areaAbyreaBcollec := OrderedCollection new.
	areaAcollec do: [:i | areaAbyreaBcollec add: i * (1 / areaAcollec size)].
	tot2 := 0.
	areaAbyreaBcollec do: [:i | tot2 := tot2 + i].
	index := (1 - tot2) * 100.
	index < 0 | (index > 100) ifTrue: [self halt].
	^index