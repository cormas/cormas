+ utilities - mathematics
giniIndexOf: aCollec
	"Purpose: Returns the gini of a set of numbers
The Gini coefficient is a number between 0 and 1, where 0 corresponds with perfect equality (where everyone has the same income) and 1 corresponds with perfect inequality (where one person has all the income, and everyone else has zero income). The Gini index is the Gini coefficient expressed in percentage form, and is equal to the Gini coefficient multiplied by 100.
Argument: aCollectionOfNumbers = < OrderedCollection> or <Array>
Negative value are not accepted .
Example: Cormas giniIndexOf: #( 4.5 88.7 456 12 64 89.1 44 781)
More: The Gini coefficient is a measure of inequality developed by the Italian statistician Corrado Gini and published in 1912.
It is a commonly used coefficient to measure income inequality in a society by institutions such as the World Bank and others.
While the Gini coefficient is mostly used to measure income inequality, it can also be used to measure other types of inequality.
For more details on the calculation and use of the Gini coefficient and index see http://en.wikipedia.org/wiki/Gini_coefficient"
	
	| tot sort cumAttributeShare previousValue value areaAcollec areaAbyreaBcollec tot2 index |
	tot := 0.
	aCollec do: [:i | tot := tot + i].
	sort := SortedCollection
		withAll: aCollec
		sortBlock: [:x :y | x < y].
	cumAttributeShare := OrderedCollection new.
	previousValue := 0.
	sort
		do:
			[:i | 
			value := i / tot.
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