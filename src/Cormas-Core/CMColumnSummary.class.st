"
I am the summary statistics of a column of numbers recorded by a probe: how many values, their range, their mean and spread, and their quartiles.

## Responsibility:

- I know the values of one column, sorted.
- I answer the count, minimum, maximum, mean and standard deviation of a sample.
- I answer the quartiles, interpolated between values as R and pandas do by default.

## Collaborators:

- `CMDataTable` creates one of me for each of its columns of numbers.
- The data views of the simulation show my statistics.

## Public API and Key Messages

- `CMColumnSummary of: aCollectionOfNumbers` creates me.
- `count`, `minimum`, `maximum`, `mean`, `standardDeviation`
- `firstQuartile`, `median`, `thirdQuartile`

```
(CMColumnSummary of: #( 4 1 10 3 2 )) median. ""3""
```

## Internal Representation

- `sortedValues`: the values of the column in increasing order, never empty.
"
Class {
	#name : 'CMColumnSummary',
	#superclass : 'Object',
	#instVars : [
		'sortedValues'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMColumnSummary class >> of: aCollectionOfNumbers [

	^ self new
		  setValues: aCollectionOfNumbers;
		  yourself
]

{ #category : 'statistics' }
CMColumnSummary >> count [

	^ sortedValues size
]

{ #category : 'statistics' }
CMColumnSummary >> firstQuartile [

	^ self quantile: 1 / 4
]

{ #category : 'statistics' }
CMColumnSummary >> maximum [

	^ sortedValues last
]

{ #category : 'statistics' }
CMColumnSummary >> mean [

	^ sortedValues average
]

{ #category : 'statistics' }
CMColumnSummary >> median [

	^ self quantile: 1 / 2
]

{ #category : 'statistics' }
CMColumnSummary >> minimum [

	^ sortedValues first
]

{ #category : 'statistics' }
CMColumnSummary >> quantile: aFraction [
	"Return the value below which aFraction of the values fall, interpolated linearly between the two closest values"

	| position lower |
	position := sortedValues size - 1 * aFraction.
	lower := position floor.
	lower = position ifTrue: [ ^ sortedValues at: lower + 1 ].
	^ (sortedValues at: lower + 1) + (position - lower
	   * ((sortedValues at: lower + 2) - (sortedValues at: lower + 1)))
]

{ #category : 'initialization' }
CMColumnSummary >> setValues: aCollectionOfNumbers [

	sortedValues := aCollectionOfNumbers asArray sorted
]

{ #category : 'statistics' }
CMColumnSummary >> standardDeviation [
	"Return the standard deviation of the values as a sample, dividing by one less than their count"

	^ sortedValues stdev
]

{ #category : 'statistics' }
CMColumnSummary >> thirdQuartile [

	^ self quantile: 3 / 4
]
