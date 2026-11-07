"
I test `CMWorkspace`: creating and opening workspaces, refusing folders that cannot be used, and remembering the workspace of the image.

I work in a memory file system, so I never touch the disk, and I restore the workspace of the image after each test.
"
Class {
	#name : 'CMWorkspaceTest',
	#superclass : 'TestCase',
	#instVars : [
		'fileSystem',
		'previousWorkspace'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'tests' }
CMWorkspaceTest >> announcementsOf: aWorkspace during: aBlock [
	"Return how many times aWorkspace announced that it changed while evaluating aBlock"

	| count |
	count := 0.
	aWorkspace announcer
		when: CMWorkspaceChanged
		do: [ count := count + 1 ]
		for: self.
	aBlock value.
	^ count
]

{ #category : 'helpers' }
CMWorkspaceTest >> installIn: aWorkspace modelNamed: aBaselineName [
	"Record a model as installed without loading any code, which would make the test slow"

	| model |
	model := CMInstalledModel
		         in: aWorkspace
		         baselineName: aBaselineName
		         folder: aWorkspace modelsFolder / aBaselineName.
	(aWorkspace instVarNamed: 'installed') at: aBaselineName put: model.
	^ model
]

{ #category : 'running' }
CMWorkspaceTest >> setUp [

	super setUp.
	fileSystem := FileSystem memory.
	previousWorkspace := CMWorkspace instVarNamed: 'current'
]

{ #category : 'running' }
CMWorkspaceTest >> tearDown [

	CMWorkspace instVarNamed: 'current' put: previousWorkspace.
	super tearDown
]

{ #category : 'tests' }
CMWorkspaceTest >> testAtAFolderWithoutModelsRaisesAnError [

	(fileSystem / 'Documents') ensureCreateDirectory.
	self
		should: [ CMWorkspace at: fileSystem / 'Documents' ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMWorkspaceTest >> testAtAnExistingWorkspaceReturnsIt [

	CMWorkspace createAt: fileSystem / 'Cormas'.
	self
		assert: (CMWorkspace at: fileSystem / 'Cormas') location
		equals: fileSystem / 'Cormas'
]

{ #category : 'tests' }
CMWorkspaceTest >> testChangeIsRefusedWhileAModelIsNotSaved [

	| research model |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	model := self installIn: research modelNamed: 'Forest'.
	model
		instVarNamed: 'problem'
		put: 'The folder /Research/Models/Forest is gone'.
	CMWorkspace current: research.
	self
		should: [
				CMWorkspace changeTo:
					(CMWorkspace createAt: fileSystem root / 'Teaching') ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'Forest is not saved') ].
	self assert: CMWorkspace current identicalTo: research.
	self assert: (research isInstalled: 'Forest')
]

{ #category : 'tests' }
CMWorkspaceTest >> testChangeToAnnouncesWhichWorkspaceReplacesThePreviousOne [

	| research teaching replacement |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	teaching := CMWorkspace createAt: fileSystem root / 'Teaching'.
	CMWorkspace current: research.
	research announcer
		when: CMWorkspaceReplaced
		do: [ :announcement | replacement := announcement workspace ]
		for: self.
	CMWorkspace changeTo: teaching.
	self assert: replacement identicalTo: teaching
]

{ #category : 'tests' }
CMWorkspaceTest >> testChangeToMakesTheWorkspaceCurrent [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem root / 'Research'.
	CMWorkspace current: nil.
	CMWorkspace changeTo: workspace.
	self assert: CMWorkspace current identicalTo: workspace
]

{ #category : 'tests' }
CMWorkspaceTest >> testChangeToTheSameFolderKeepsTheInstalledModels [

	| research |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	self installIn: research modelNamed: 'Forest'.
	CMWorkspace current: research.
	CMWorkspace changeTo: (CMWorkspace at: fileSystem root / 'Research').
	self assert: CMWorkspace current identicalTo: research.
	self assert: (research isInstalled: 'Forest')
]

{ #category : 'tests' }
CMWorkspaceTest >> testCreateAtAnExistingWorkspaceRaisesAnError [

	CMWorkspace createAt: fileSystem / 'Cormas'.
	self
		should: [ CMWorkspace createAt: fileSystem / 'Cormas' ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMWorkspaceTest >> testCreateAtLeavesOnlyTheModelsFolder [

	CMWorkspace createAt: fileSystem / 'Cormas'.
	self
		assert:
		((fileSystem / 'Cormas') children collect: [ :each | each basename ])
		equals: #( 'Models' )
]

{ #category : 'tests' }
CMWorkspaceTest >> testCreateAtMakesAFolderWithModels [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem / 'Cormas'.
	self assert: (fileSystem / 'Cormas' / 'Models') isDirectory.
	self
		assert: workspace modelsFolder
		equals: fileSystem / 'Cormas' / 'Models'
]

{ #category : 'tests' }
CMWorkspaceTest >> testCreateWhereNothingCanBeWrittenRaisesAnError [

	fileSystem / 'aFile' writeStreamDo: [ :stream |
		stream nextPutAll: 'not a folder' ].
	self
		should: [ CMWorkspace createAt: fileSystem / 'aFile' / 'Cormas' ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMWorkspaceTest >> testCurrentIsTheChosenWorkspace [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem / 'Cormas'.
	CMWorkspace current: workspace.
	self assert: CMWorkspace current identicalTo: workspace
]

{ #category : 'tests' }
CMWorkspaceTest >> testCurrentWithoutAChoiceRaisesAnError [

	CMWorkspace instVarNamed: 'current' put: nil.
	self should: [ CMWorkspace current ] raise: CMWorkspaceError
]

{ #category : 'tests' }
CMWorkspaceTest >> testDefaultLocationIsCormasInTheHomeFolder [

	self
		assert: CMWorkspace defaultLocation
		equals: FileLocator home asFileReference / 'Cormas'
]

{ #category : 'tests' }
CMWorkspaceTest >> testDeletingAFolderAnnouncesTheChange [

	| research forest |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	forest := research modelsFolder / 'Forest'.
	forest ensureCreateDirectory.
	self
		assert: (self
				 announcementsOf: research
				 during: [
				 research delete: (CMModelFolder in: research at: forest) ])
		equals: 1
]

{ #category : 'tests' }
CMWorkspaceTest >> testFoldersOfTheWorkspace [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem / 'Cormas'.
	self
		assert: workspace examplesFolder
		equals: fileSystem / 'Cormas' / 'Examples'.
	self
		assert: workspace catalogFolder
		equals: fileSystem / 'Cormas' / 'Catalog'.
	self
		assert: workspace backupsFolder
		equals: fileSystem / 'Cormas' / 'Backups'
]

{ #category : 'tests' }
CMWorkspaceTest >> testIsWorkspace [

	(fileSystem / 'Documents') ensureCreateDirectory.
	CMWorkspace createAt: fileSystem / 'Cormas'.
	self assert: (CMWorkspace isWorkspace: fileSystem / 'Cormas').
	self deny: (CMWorkspace isWorkspace: fileSystem / 'Documents').
	self deny: (CMWorkspace isWorkspace: fileSystem / 'Missing')
]

{ #category : 'tests' }
CMWorkspaceTest >> testModelThatStopsBeingSavedAnnouncesTheChange [

	| research model |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	model := self installIn: research modelNamed: 'Forest'.
	self
		assert: (self
				 announcementsOf: research
				 during: [ model save: Dictionary new over: #(  ) ])
		equals: 1.
	self deny: model isSaved
]

{ #category : 'tests' }
CMWorkspaceTest >> testNewFilesAreNamedAfterTheTimeAndNeverReplaceEachOther [

	| research output first second |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	output := research modelsFolder / 'Forest' / 'output'.
	output ensureCreateDirectory.
	first := research newFileNamed: 'data' extension: 'csv' in: output.
	first writeStreamDo: [ :stream | stream nextPutAll: '1' ].
	second := research newFileNamed: 'data' extension: 'csv' in: output.
	self deny: second equals: first.
	self deny: second exists.
	self assert: second parent equals: output.
	self assert: (first basename beginsWith: 'data ').
	self assert: (first basename endsWith: '.csv')
]

{ #category : 'tests' }
CMWorkspaceTest >> testSavingAModelWhoseFolderWasRenamedFollowsIt [

	| research model renamed |
	research := CMWorkspace createAt: fileSystem root / 'Research'.
	model := self installIn: research modelNamed: 'Forest'.
	renamed := research modelsFolder / 'Forest renamed'.
	renamed ensureCreateDirectory.
	renamed / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "Forest" }' ].
	model save: Dictionary new over: #(  ).
	self assert: model folder equals: renamed.
	self assert: model isSaved
]

{ #category : 'tests' }
CMWorkspaceTest >> testWorkspaceIsNotFoundOnceItsFolderIsGone [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem / 'Cormas'.
	self assert: workspace isFound.
	(fileSystem / 'Cormas') deleteAll.
	self deny: workspace isFound
]
