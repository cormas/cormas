"
I show the summary statistics of a data table: a row for each statistic (count, mean, standard deviation, minimum, quartiles, maximum) and a column for each column of numbers.

## Responsibility:

- I show a column for each column of numbers of a `CMDataTable`, and none for its columns of strings or booleans.
- I show whole numbers as they are, and other numbers with three decimals.
- I show nothing for a table without rows.

## Collaborators:

- `CMDataTable>>summaries` gives a `CMColumnSummary` for each column of numbers.
- `CMDataPresenter` and `CMEntityDataPresenter` show me above their data.

## Public API and Key Messages

- `showSummariesOf: aDataTable` shows the statistics of aDataTable.

```
| table |
table := CMDataTable withColumns: #( #boars ).
table addStep: 0 values: #( 5 ).
table addStep: 1 values: #( 8 ).
(CMSummaryPresenter new showSummariesOf: table; yourself) open
```

## Internal Representation

- `table`: an `SpTablePresenter` whose items are the label and the selector of each statistic.
"
Class {
	#name : 'CMSummaryPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'initialization' }
CMSummaryPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: table;
		  yourself
]

{ #category : 'initialization' }
CMSummaryPresenter >> initializePresenters [

	table := self newTable
]

{ #category : 'updating' }
CMSummaryPresenter >> showSummariesOf: aDataTable [
	"Show the summary statistics of each column of numbers of aDataTable"

	table columns: #(  ).
	table addColumn: (SpStringTableColumn
			 title: 'statistic'
			 evaluated: [ :each | each key ]).
	aDataTable summaries keysAndValuesDo: [ :name :summary |
			table addColumn: (SpStringTableColumn
					 title: name
					 evaluated: [ :each | self text: (summary perform: each value) ]) ].
	table items: self statistics
]

{ #category : 'private' }
CMSummaryPresenter >> statistics [
	"Return the label and the selector of each statistic, in the order of the rows"

	^ {
		  ('count' -> #count).
		  ('mean' -> #mean).
		  ('std dev' -> #standardDeviation).
		  ('min' -> #minimum).
		  ('25%' -> #firstQuartile).
		  ('median' -> #median).
		  ('75%' -> #thirdQuartile).
		  ('max' -> #maximum) }
]

{ #category : 'accessing' }
CMSummaryPresenter >> table [

	^ table
]

{ #category : 'private' }
CMSummaryPresenter >> text: aNumber [

	aNumber isInteger ifTrue: [ ^ aNumber printString ].
	^ aNumber asFloat printShowingDecimalPlaces: 3
]
