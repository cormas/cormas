Class {
	#name : 'CMSensitivityAnalysisDataTablePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'table'
	],
	#category : 'Cormas-SensitivityAnalysis-UI',
	#package : 'Cormas-SensitivityAnalysis-UI'
}

{ #category : 'examples' }
CMSensitivityAnalysisDataTablePresenter class >> example [
	<example>
	self new open
]

{ #category : 'layout' }
CMSensitivityAnalysisDataTablePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: table;
		yourself
]

{ #category : 'initialization' }
CMSensitivityAnalysisDataTablePresenter >> initializePresenters [

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
CMSensitivityAnalysisDataTablePresenter >> showData: aCollection [

	aCollection ifEmpty: [ ^ self ].
	
	aCollection first keys collect: [ :name |
		table addColumn: (SpStringTableColumn
			title: name
			evaluated: [ :row | row at: name ]) ].
		
	table items: aCollection
]
