Class {
	#name : 'CMDataPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table',
		'toolbar'
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

{ #category : 'layout' }
CMDataPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: table;
		yourself
]

{ #category : 'initialization' }
CMDataPresenter >> initializePresenters [

	| saveToCsvButton saveToExcelButton |

	table := self newTable.
	
	saveToCsvButton := self newToolbarButton
		label: 'Save to CSV';
		icon: CMIcons csvIcon;
		help: 'Save data table to CSV file';
		action: [ "do nothing" ];
		yourself.
		
	saveToExcelButton := self newToolbarButton
		label: 'Save to Excel';
		icon: CMIcons excelIcon;
		help: 'Save data table to Excel file';
		action: [ "do nothing" ];
		yourself.
	
	toolbar := self newToolbar
		add: saveToCsvButton;
		add: saveToExcelButton;
		yourself.
]

{ #category : 'as yet unclassified' }
CMDataPresenter >> showData: aCollection [
		
	table items: aCollection
]
