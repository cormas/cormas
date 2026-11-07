"
I test the model list on a workspace in memory, without opening its window.
"
Class {
	#name : 'CMModelListPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'workspace',
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMModelListPresenterTest >> setUp [

	super setUp.
	workspace := CMWorkspace createAt: FileSystem memory / 'Cormas'.
	(workspace modelsFolder / 'Forest') ensureCreateDirectory.
	workspace modelsFolder / 'Forest' / 'cormas.json' writeStreamDo: [
		:stream | stream nextPutAll: '{ "baseline": "Forest" }' ].
	presenter := CMModelListPresenter on: workspace
]

{ #category : 'running' }
CMModelListPresenterTest >> testSelectingAFolderDeletedOutsideCormasShowsTheFoldersAgain [

	| table |
	table := presenter instVarNamed: 'table'.
	(workspace modelsFolder / 'Forest') ensureDeleteAll.
	table selectItem: table items first.
	self assert: table items isEmpty
]
