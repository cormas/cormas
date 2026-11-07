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

{ #category : 'tests' }
CMModelListPresenterTest >> testInstalledModelWhoseFolderIsGoneIsListedAndCanBeRestoredOrUninstalled [

	| entry actions |
	(workspace instVarNamed: 'installed')
		at: 'Lost'
		put: (CMInstalledModel
				 in: workspace
				 baselineName: 'Lost'
				 folder: workspace modelsFolder / 'Lost').
	workspace refresh.
	presenter updateEntries.
	entry := (presenter instVarNamed: 'table') items detect: [ :each |
		         each name = 'Lost' ].
	actions := (presenter folderActionsFor: entry) collect: [ :each |
		           each key ].
	self assert: entry state equals: 'Not saved'.
	self assert: (actions includes: 'Restore folder').
	self assert: (actions includes: 'Uninstall…')
]

{ #category : 'tests' }
CMModelListPresenterTest >> testModelInSeveralFoldersExplainsToKeepOnlyOne [

	| entry |
	#( 'Lost backup' 'Lost 2025' ) do: [ :each |
			| folder |
			folder := workspace modelsFolder / each.
			folder ensureCreateDirectory.
			folder / 'cormas.json' writeStreamDo: [ :stream |
				stream nextPutAll: '{ "baseline": "Lost" }' ] ].
	(workspace instVarNamed: 'installed')
		at: 'Lost'
		put: (CMInstalledModel
				 in: workspace
				 baselineName: 'Lost'
				 folder: workspace modelsFolder / 'Lost').
	workspace refresh.
	presenter updateEntries.
	entry := (presenter instVarNamed: 'table') items detect: [ :each |
		         each name = 'Lost' and: [ each place = 'Image' ] ].
	self assert: (entry stateExplanation includesSubstring:
			 'Lost 2025, Lost backup. Move or delete all but one of them').
	self deny:
		((presenter folderActionsFor: entry) anySatisfy: [ :each |
			 each key = 'Restore folder' ])
]

{ #category : 'tests' }
CMModelListPresenterTest >> testRowOfAFolderDeletedOutsideCormasKeepsItsStateUntilTheListIsReadAgain [

	| entry |
	entry := (presenter instVarNamed: 'table') items first.
	(workspace modelsFolder / 'Forest') ensureDeleteAll.
	self assert: entry name equals: 'Forest'.
	self assert: entry state equals: 'Not installed'
]

{ #category : 'running' }
CMModelListPresenterTest >> testSelectingAFolderDeletedOutsideCormasShowsTheFoldersAgain [

	| table |
	table := presenter instVarNamed: 'table'.
	(workspace modelsFolder / 'Forest') ensureDeleteAll.
	table selectItem: table items first.
	self assert: table items isEmpty
]

{ #category : 'tests' }
CMModelListPresenterTest >> testSelectingAnyRowNoticesTheFolderOfAnInstalledModelDeletedOutsideCormas [

	| lost table |
	lost := workspace modelsFolder / 'Lost'.
	lost ensureCreateDirectory.
	lost / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "Lost" }' ].
	(workspace instVarNamed: 'installed')
		at: 'Lost'
		put:
		(CMInstalledModel in: workspace baselineName: 'Lost' folder: lost).
	presenter updateEntries.
	lost ensureDeleteAll.
	table := presenter instVarNamed: 'table'.
	table selectItem:
		(table items detect: [ :each | each name = 'Forest' ]).
	self
		assert: (table items detect: [ :each | each name = 'Lost' ]) state
		equals: 'Not saved'.
	self assert: table selectedItem name equals: 'Forest'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testWindowFollowsTheWorkspaceThatReplacesItsOwn [

	| teaching previous |
	teaching := CMWorkspace createAt: FileSystem memory / 'Teaching'.
	previous := CMWorkspace instVarNamed: 'current'.
	[
		CMWorkspace current: workspace.
		CMWorkspace changeTo: teaching.
		self
			assert: (presenter instVarNamed: 'workspace')
			identicalTo: teaching.
		self assert: (presenter instVarNamed: 'table') items isEmpty ]
		ensure: [ CMWorkspace instVarNamed: 'current' put: previous ]
]
