"
I am the data table of one recorded object, such as the model or one hunting unit: a row for each recorded step, and a column for each probe of its class.

## Responsibility:

- I keep the values of each probe as a column, in the order the steps were recorded, so that a chart reads a column at once.
- I keep the step of each row: an object has rows only for the steps when it was alive, so its curves start and stop by themselves.
- I refuse a row that breaks a rule, by raising a `CMRecordingError`, and leave the table unchanged.

## Collaborators:

- `CMRecordingError` is what I raise for a step that is not after the last one, a value that is not a number, a boolean or a string, a value of another kind than its column, and a column that was not recorded.

## Public API and Key Messages

- `CMDataTable withColumns: aCollectionOfNames` creates an empty table.
- `addStep:values:` adds a row.
- `steps`, `column:`, `columnNames`, `rows` and `size` read the table.
- `label:` names the recorded object, and `label` returns it.
- `writeCsvOn:` writes the table as CSV: a header, then a line for each row; strings are written between double quotes.

```smalltalk
| table |
table := CMDataTable withColumns: #( #bag #boars ).
table addStep: 0 values: #( 3 40 ).
table addStep: 1 values: #( 5 38 ).
table column: #boars ""an OrderedCollection(40 38)""
```

## Internal Representation

- `columnNames`: an `Array` of the probe selectors.
- `steps`: an `OrderedCollection` of the step of each row.
- `columns`: an `Array` of `OrderedCollection`, one per column, in the order of `columnNames`.
- `label`: a string naming the recorded object, or nil.

### Implementation Points

- A column keeps the kind of its first value: number (integers and floats together), boolean or string (symbols included).
- Small integers and most floats are immediate objects, and booleans and symbols are unique, so recording a row allocates nothing but the growth of its collections.
"
Class {
	#name : 'CMDataTable',
	#superclass : 'Object',
	#instVars : [
		'columnNames',
		'steps',
		'columns',
		'label'
	],
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'instance creation' }
CMDataTable class >> withColumns: aCollectionOfNames [

	^ self new
		  columnNames: aCollectionOfNames;
		  yourself
]

{ #category : 'writing' }
CMDataTable class >> writeCsvValues: aCollection on: aStream [
	"Write aCollection as one line of CSV on aStream. A string is written between double quotes, with its own double quotes doubled"

	aCollection
		do: [ :each |
				each isString
					ifTrue: [
							aStream
								nextPut: $";
								nextPutAll: (each copyReplaceAll: '"' with: '""');
								nextPut: $" ]
					ifFalse: [ aStream print: each ] ]
		separatedBy: [ aStream nextPut: $, ].
	aStream lf
]

{ #category : 'adding' }
CMDataTable >> addStep: aStep values: aCollection [
	"Add the row of the values measured at aStep, given in the order of the columns. A row that breaks a rule raises a CMRecordingError and is not added"

	self checkStep: aStep.
	aCollection withIndexDo: [ :value :index |
		self checkValue: value inColumnAt: index ].
	steps add: aStep.
	columns with: aCollection do: [ :column :value | column add: value ]
]

{ #category : 'private' }
CMDataTable >> checkStep: aStep [

	(steps notEmpty and: [ aStep <= steps last ]) ifTrue: [
			CMRecordingError signal:
				'Step ' , aStep printString
				, ' is not after the last recorded step ' , steps last printString ]
]

{ #category : 'private' }
CMDataTable >> checkValue: aValue inColumnAt: anIndex [
	"A column keeps the kind of its first value"

	| kind column |
	kind := self kindOf: aValue inColumnAt: anIndex.
	column := columns at: anIndex.
	(column isEmpty or: [
		 (self kindOf: column first inColumnAt: anIndex) = kind ]) ifFalse: [
			CMRecordingError signal:
				(columnNames at: anIndex) printString , ' returned the ' , kind
				, ' ' , aValue printString , ', but it returned a '
				, (self kindOf: column first inColumnAt: anIndex) , ' before' ]
]

{ #category : 'accessing' }
CMDataTable >> column: aName [
	"Return the values of the column named aName, one per row"

	^ columns at: (columnNames
			   indexOf: aName
			   ifAbsent: [
			   CMRecordingError signal: aName printString , ' was not recorded' ])
]

{ #category : 'accessing' }
CMDataTable >> columnNames [

	^ columnNames
]

{ #category : 'initialization' }
CMDataTable >> columnNames: aCollectionOfNames [

	columnNames := aCollectionOfNames asArray.
	columns := columnNames collect: [ :each | OrderedCollection new ]
]

{ #category : 'initialization' }
CMDataTable >> initialize [

	super initialize.
	steps := OrderedCollection new
]

{ #category : 'private' }
CMDataTable >> kindOf: aValue inColumnAt: anIndex [

	aValue isNumber ifTrue: [ ^ 'number' ].
	aValue isString ifTrue: [ ^ 'string' ].
	(aValue == true or: [ aValue == false ]) ifTrue: [ ^ 'boolean' ].
	CMRecordingError signal:
		(columnNames at: anIndex) printString , ' returned '
		, aValue printString
		, ', but a probe must return a number, a boolean or a string'
]

{ #category : 'accessing' }
CMDataTable >> label [
	"Return the text that names the recorded object, such as the printString of an entity"

	^ label
]

{ #category : 'accessing' }
CMDataTable >> label: aString [

	label := aString
]

{ #category : 'accessing' }
CMDataTable >> rows [
	"Return each row as an Array of its step followed by its values, in the order of the columns"

	^ (1 to: self size) collect: [ :index |
			  (Array with: (steps at: index))
			  , (columns collect: [ :column | column at: index ]) ]
]

{ #category : 'accessing' }
CMDataTable >> size [

	^ steps size
]

{ #category : 'accessing' }
CMDataTable >> steps [

	^ steps
]

{ #category : 'writing' }
CMDataTable >> writeCsvOn: aStream [
	"Write me as CSV on aStream: a header with step and the names of my columns, then a line for each recorded step"

	aStream
		nextPutAll: (',' join:
					 #( 'step' ) , (columnNames collect: [ :each | each asString ]));
		lf.
	self rows do: [ :each | self class writeCsvValues: each on: aStream ]
]
