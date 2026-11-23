Class {
	#name : 'CMDataPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'fixture',
		'dataPresenter'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
CMDataPresenterTest >> setUp [

	super setUp.

	fixture := CMDataFixture new.
	dataPresenter := CMDataPresenter new.
	dataPresenter columnNames: fixture columnNames.
	dataPresenter showData: fixture rows
]

{ #category : 'tests' }
CMDataPresenterTest >> testADataTableIsShownWithTheStatisticsOfItsColumnsOfNumbers [

	| table |
	table := CMDataTable withColumns: #( #boars #name ).
	table addStep: 0 values: #( 5 'a' ).
	table addStep: 1 values: #( 7 'b' ).
	dataPresenter showTable: table.
	self assert: dataPresenter data equals: table rows.
	self
		assert:
			(dataPresenter summary table columns collect: [ :each | each title ])
				asArray
		equals: #( 'statistic' 'boars' )
]

{ #category : 'tests' }
CMDataPresenterTest >> testANumberThatIsNotAnIntegerIsShownAsADecimal [

	| table |
	table := CMDataTable withColumns: #( #share ).
	table addStep: 0 values: { (1 / 4) }.
	dataPresenter showTable: table.
	self
		assert: (dataPresenter table columns second readObject:
				 dataPresenter data first) asString
		equals: '0.25'
]

{ #category : 'tests' }
CMDataPresenterTest >> testSaveDataToFile [

	| fs file |
	fs := FileSystem memory.
	file := (fs / 'data.csv') ensureCreateFile.
	
	dataPresenter saveDataToFile: file.
	
	self assert: file contents equals: fixture dataAsCsv
]

{ #category : 'tests' }
CMDataPresenterTest >> testTheRowsCanBeShownWithoutStatisticsNorSaving [

	self assert: dataPresenter layout allPresenters size equals: 3.
	dataPresenter showRowsOnly.
	self deny:
		(dataPresenter layout allPresenters includes: dataPresenter summary).
	self assert: dataPresenter layout allPresenters size equals: 1
]
