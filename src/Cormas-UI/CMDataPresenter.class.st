Class {
	#name : 'CMDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table',
		'saveToCsvButton'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMDataPresenter class >> example [
	<example>
	self new open
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

{ #category : 'initialization' }
CMDataPresenter >> connectPresenters [

	saveToCsvButton action: [ self saveDataToCsv ]
]

{ #category : 'accessing' }
CMDataPresenter >> data [

	^ table items
]

{ #category : 'layout' }
CMDataPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 3;
		add: table;
		add: saveToCsvButton expand: false;
		yourself
]

{ #category : 'examples' }
CMDataPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMDataPresenter >> initializePresenters [

	table := self newTable.
	
	saveToCsvButton := self newButton
		label: 'Save to CSV';
		icon: CMIcons csvIcon;
		yourself
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> saveDataToCsv [

	| message |

	(StSaveFilePresenter extensions: {'csv'})
		okAction: [ :fileReference | 
			self saveDataToFile: fileReference.
			
			message := String streamContents: [ :stream |
				stream
					<< 'Data saved to '
					<< fileReference asString;
					cr; cr;
					<< 'Click to open location' ].
			
			UIManager default
				inform: message
			 	actionOnClick: [ fileReference openInOSFileBrowser ]]
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> saveDataToFile: aFileReference [ 

	| data columnNames |
	data := self data.

	data ifNil: [ ^ self ].
	data ifEmpty: [ ^ self ].
	aFileReference ifNil: [ ^ self ].
	
	aFileReference writeStreamDo: [ :stream |
		columnNames := data first keys.
		stream nextPutAll: (',' join: columnNames); cr.
		
		data do: [ :row |
			stream nextPutAll: (',' join: row); cr ] ].


]

{ #category : 'as yet unclassified' }
CMDataPresenter >> showData: aCollection [
		
	table items: aCollection
]
