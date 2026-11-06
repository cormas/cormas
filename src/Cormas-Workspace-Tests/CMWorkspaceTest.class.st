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
CMWorkspaceTest >> testWorkspaceIsNotFoundOnceItsFolderIsGone [

	| workspace |
	workspace := CMWorkspace createAt: fileSystem / 'Cormas'.
	self assert: workspace isFound.
	(fileSystem / 'Cormas') deleteAll.
	self deny: workspace isFound
]
