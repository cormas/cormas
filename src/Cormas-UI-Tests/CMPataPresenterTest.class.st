Class {
	#name : 'CMPataPresenterTest',
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
CMPataPresenterTest >> setUp [

	super setUp.
	
	fixture := CMDataFixture new.
	dataPresenter := CMDataPresenter new.
	dataPresenter showData: fixture data.
]

{ #category : 'tests' }
CMPataPresenterTest >> testSaveDataToFile [

	| fs file |
	fs := FileSystem memory.
	file := (fs / 'data.csv') ensureCreateFile.
	
	dataPresenter saveDataToFile: file.
	
	self assert: file contents equals: fixture dataAsCsv
]
