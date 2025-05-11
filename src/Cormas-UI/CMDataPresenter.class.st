Class {
	#name : 'CMDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table',
		'toolbar',
		'translator'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMDataPresenter class >> example [
	<example>
	(self on: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMDataPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> columnNames: aCollection [

	table columns: #().

	aCollection do: [ :name |
		table
			addColumn: (SpStringTableColumn
				title: name
				evaluated: [ :dataRow | dataRow at: name ]) ].
]

{ #category : 'accessing' }
CMDataPresenter >> data [

	^ table items
]

{ #category : 'layout' }
CMDataPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: table;
		yourself
]

{ #category : 'initialization' }
CMDataPresenter >> initializePresenters [

	table := self newTable.
	self initializeToolbar.
]

{ #category : 'initialization' }
CMDataPresenter >> initializeToolbar [
	
	toolbar := self newToolbar.

	CMDataPresenterCommand sortedSubclasses do: [ :aClass |
		| command |
		command := aClass forOwner: self translator: translator.
		toolbar add: command button ].
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> saveToCsv [
	(StSaveFilePresenter extensions: {'csv'})
		okAction: [ :fileReference | 
			| csvStream keys |
			csvStream := fileReference writeStream.
			keys := self data first keys asSortedCollection.
			csvStream nextPutAll: (keys joinUsing: ';'); cr.
			self data do: [ :dict |
    			| row |
    			row := keys collect: [:key | (dict at: key ifAbsent: ['']) asString ].
    			csvStream nextPutAll: (row joinUsing: ';'); cr.
				].
			csvStream close.
			]
]

{ #category : 'accessing - model' }
CMDataPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> showData: aCollection [
		
	table items: aCollection
]
