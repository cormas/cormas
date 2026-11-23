Class {
	#name : 'CMDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table',
		'columnNames',
		'saveToCsvButton',
		'modelClass',
		'summary'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMDataPresenter class >> example [
	<example>
	self new open
]

{ #category : 'accessing' }
CMDataPresenter >> columnNames: aCollection [
	"Show a column for each name of aCollection. Each row shown is an Array of values in the same order"

	columnNames := aCollection.
	table columns: #(  ).
	columnNames doWithIndex: [ :name :index |
			table addColumn:
				(SpStringTableColumn
					 title: name
					 evaluated: [ :row | row at: index ]) ]
]

{ #category : 'initialization' }
CMDataPresenter >> connectPresenters [

	saveToCsvButton action: [ self saveDataToCsv ]
]

{ #category : 'accessing' }
CMDataPresenter >> data [

	^ table items
]

{ #category : 'initialization' }
CMDataPresenter >> defaultLayout [

	^ self layoutShowing: (SpPanedLayout newTopToBottom
			   positionOfSlider: 0.4;
			   add: summary;
			   add: table;
			   yourself)
]

{ #category : 'examples' }
CMDataPresenter >> example [
	<script: 'self example'>
]

{ #category : 'updating' }
CMDataPresenter >> hideSummary [
	"Show only the rows, for data that is not a data table and has no statistics"

	self layout: (self layoutShowing: table)
]

{ #category : 'initialization' }
CMDataPresenter >> initializePresenters [

	summary := self instantiate: CMSummaryPresenter.
	table := self newTable.

	saveToCsvButton := self newButton
		                   label: 'Save to CSV';
		                   icon: CMIcons csvIcon;
		                   yourself
]

{ #category : 'initialization' }
CMDataPresenter >> layoutShowing: aPresenterOrLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 3;
		  add: aPresenterOrLayout;
		  add: saveToCsvButton expand: false;
		  yourself
]

{ #category : 'accessing' }
CMDataPresenter >> modelClass: aModelClass [

	modelClass := aModelClass
]

{ #category : 'actions' }
CMDataPresenter >> saveDataToCsv [
	"Save the data in the output folder of the model"

	CMExport
		of: modelClass
		named: 'data'
		extension: 'csv'
		writing: [ :file | self saveDataToFile: file ]
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> saveDataToFile: aFileReference [ 

	| data |
	data := self data.

	data ifNil: [ ^ self ].
	aFileReference ifNil: [ ^ self ].
	
	aFileReference exists ifTrue: [ 
		aFileReference delete ].
	
	aFileReference writeStreamDo: [ :stream |
		stream nextPutAll: (',' join: columnNames); cr.
		
		data do: [ :row |
			stream nextPutAll: (',' join: row); cr ] ].


]

{ #category : 'as yet unclassified' }
CMDataPresenter >> showData: aCollection [
		
	table items: aCollection
]

{ #category : 'updating' }
CMDataPresenter >> showTable: aDataTable [
	"Show the rows of aDataTable and the statistics of its columns of numbers"

	self showData: aDataTable rows.
	summary showSummariesOf: aDataTable
]

{ #category : 'accessing' }
CMDataPresenter >> summary [

	^ summary
]
