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

{ #category : 'helpers' }
CMModelListPresenterTest >> fixLabelsOf: anEntry [
	"The labels of the actions that fix a problem, leaving out the packages to add, which a model recorded as installed without its code does not have"

	^ self labelsOf: ((CMModelAction fixSelectors collect: [ :each |
			    CMModelAction perform: each ]) select: [ :each |
			   each appliesTo: anEntry ])
]

{ #category : 'helpers' }
CMModelListPresenterTest >> installModelNamed: aBaselineName [
	"Record a model as installed from a folder of Models, without loading any code"

	(workspace instVarNamed: 'installed')
		at: aBaselineName
		put: (CMInstalledModel
				 in: workspace
				 baselineName: aBaselineName
				 folder: workspace modelsFolder / aBaselineName)
]

{ #category : 'helpers' }
CMModelListPresenterTest >> labelsOf: actions [

	^ (actions collect: [ :each | each label ]) asArray
]

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
CMModelListPresenterTest >> testActionsOfAModelThatIsNotInstalled [

	| entry |
	entry := presenter myModels items first.
	self assert: entry state equals: 'Not installed'.
	self
		assert: (self labelsOf: (CMModelAction mainFor: entry))
		equals: #( 'Install' ).
	self
		assert: (self labelsOf: (CMModelAction secondaryFor: entry))
		equals: #( 'Export…' 'Open folder' 'Delete…' ).
	self assert: (CMModelAction fixesFor: entry) isEmpty
]

{ #category : 'tests' }
CMModelListPresenterTest >> testExampleCannotBeRenamedNorExported [

	| entry |
	self writeModelNamed: 'Conway' in: workspace location / 'Examples'.
	presenter updateEntries.
	entry := presenter examples items first.
	self
		assert: (self labelsOf: (CMModelAction mainFor: entry))
		equals: #( 'Install' ).
	self
		assert: (self labelsOf: (CMModelAction secondaryFor: entry))
		equals: #( 'Open folder' 'Delete…' )
]

{ #category : 'tests' }
CMModelListPresenterTest >> testExampleIsNotedReadOnly [

	self writeModelNamed: 'Conway' in: workspace location / 'Examples'.
	presenter updateEntries.
	self
		assert: presenter examples items first note
		equals: 'Example: read-only'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testInfoLineJoinsVersionCormasAndNote [

	| folder |
	folder := workspace location / 'Examples' / 'Conway'.
	folder ensureCreateDirectory.
	folder / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "Conway", "cormas": "1.0" }' ].
	presenter updateEntries.
	self
		assert: presenter examples items first infoLine
		equals: 'Made with Cormas 1.0 · Example: read-only'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testInstalledModelWhoseFolderIsGoneIsListedAndCanBeRestoredOrUninstalled [

	| entry |
	self installModelNamed: 'Lost'.
	workspace refresh.
	presenter updateEntries.
	entry := presenter myModels items detect: [ :each |
		         each name = 'Lost' ].
	self assert: entry state equals: 'Folder missing'.
	self
		assert: (self labelsOf: (CMModelAction mainFor: entry))
		equals: #( 'Simulate' ).
	self
		assert: (self fixLabelsOf: entry)
		equals: #( 'Restore folder' 'Remove from image' )
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
	self installModelNamed: 'Lost'.
	workspace refresh.
	presenter updateEntries.
	entry := presenter myModels items detect: [ :each |
		         each name = 'Lost' and: [ each state = 'Folder missing' ] ].
	self
		assert: entry note
		equals: 'In several folders: Lost 2025, Lost backup. Keep only one'.
	self
		assert: (self fixLabelsOf: entry)
		equals: #( 'Reload from folder' 'Remove from image' )
]

{ #category : 'tests' }
CMModelListPresenterTest >> testModelThatIsSavedHasNoNote [

	self assert: presenter myModels items first note isNil
]

{ #category : 'tests' }
CMModelListPresenterTest >> testModelsAndExamplesAreListedApart [

	self writeModelNamed: 'Conway' in: workspace location / 'Examples'.
	presenter updateEntries.
	self
		assert:
		(presenter myModels items collect: [ :each | each name ]) asArray
		equals: #( 'Forest' ).
	self
		assert:
		(presenter examples items collect: [ :each | each name ]) asArray
		equals: #( 'Conway' ).
	self
		assert: presenter examples items first state
		equals: 'Downloaded'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testModelsAtRiskComeFirst [

	self installModelNamed: 'Lost'.
	workspace refresh.
	presenter updateEntries.
	self
		assert:
		(presenter myModels items collect: [ :each | each name ]) asArray
		equals: #( 'Lost' 'Forest' )
]

{ #category : 'tests' }
CMModelListPresenterTest >> testRowOfAFolderDeletedOutsideCormasKeepsItsStateUntilTheListIsReadAgain [

	| entry |
	entry := presenter myModels items first.
	(workspace modelsFolder / 'Forest') ensureDeleteAll.
	self assert: entry name equals: 'Forest'.
	self assert: entry state equals: 'Not installed'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testSelectingAFolderDeletedOutsideCormasShowsTheFoldersAgain [

	(workspace modelsFolder / 'Forest') ensureDeleteAll.
	presenter myModels selectItem: presenter myModels items first.
	self assert: presenter myModels items isEmpty
]

{ #category : 'tests' }
CMModelListPresenterTest >> testSelectingAnyRowNoticesTheFolderOfAnInstalledModelDeletedOutsideCormas [

	| lost list |
	lost := workspace modelsFolder / 'Lost'.
	self writeModelNamed: 'Lost' in: workspace modelsFolder.
	(workspace instVarNamed: 'installed')
		at: 'Lost'
		put:
		(CMInstalledModel in: workspace baselineName: 'Lost' folder: lost).
	presenter updateEntries.
	lost ensureDeleteAll.
	list := presenter myModels.
	list selectItem:
		(list items detect: [ :each | each name = 'Forest' ]).
	self
		assert: (list items detect: [ :each | each name = 'Lost' ]) state
		equals: 'Folder missing'.
	self assert: list selectedItem name equals: 'Forest'
]

{ #category : 'tests' }
CMModelListPresenterTest >> testSelectingInOneListClearsTheOther [

	self writeModelNamed: 'Conway' in: workspace location / 'Examples'.
	presenter updateEntries.
	presenter myModels selectItem: presenter myModels items first.
	presenter examples selectItem: presenter examples items first.
	self assert: presenter myModels selectedItem isNil.
	self assert: presenter preview entry name equals: 'Conway'
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
		self assert: presenter myModels items isEmpty ] ensure: [
		CMWorkspace instVarNamed: 'current' put: previous ]
]

{ #category : 'helpers' }
CMModelListPresenterTest >> writeModelNamed: aBaselineName in: aFolder [

	(aFolder / aBaselineName) ensureCreateDirectory.
	aFolder / aBaselineName / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "' , aBaselineName , '" }' ]
]
