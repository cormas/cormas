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
CMDataPresenterTest >> testSaveDataToFile [

	| fs file |
	fs := FileSystem memory.
	file := (fs / 'data.csv') ensureCreateFile.
	
	dataPresenter saveDataToFile: file.
	
	self assert: file contents equals: fixture dataAsCsv
]
