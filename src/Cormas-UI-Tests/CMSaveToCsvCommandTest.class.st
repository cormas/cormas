Class {
	#name : 'CMSaveToCsvCommandTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'command',
		'fixture'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
CMSaveToCsvCommandTest >> setUp [

	| dataPresenter |
	super setUp.
	
	fixture := CMDataFixture new.
	dataPresenter := CMDataPresenter forTranslator: CMEnglishTranslator new.
	dataPresenter showData: fixture data.
	
	command := CMSaveToCsvCommand forOwner: dataPresenter 
]

{ #category : 'tests' }
CMSaveToCsvCommandTest >> testSaveDataToFile [

	| fs file |
	fs := FileSystem memory.
	file := (fs / 'data.csv') ensureCreateFile.
	
	command saveDataToFile: file.
	
	self assert: file contents equals: fixture dataAsCsv
]
