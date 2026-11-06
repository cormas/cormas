"
I test how a workspace lets git users work with Iceberg: a model folder that is a git repository is registered with Iceberg when the model is installed, without loading through it, and the model is refreshed after an Iceberg operation changed its folder.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`. I create git repositories with the `git` command line, so I am skipped on Windows and where it is not available.
"
Class {
	#name : 'CMIcebergTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMIcebergTest >> commitAllIn: aFolder [

	self assert: (self git: 'add -A' in: aFolder).
	self assert: (self git: 'commit -q -m Cormas' in: aFolder)
]

{ #category : 'helpers' }
CMIcebergTest >> git: aCommand in: aFolder [
	"Run a git command in aFolder and answer whether it succeeded"

	^ (LibC resultOfCommand:
		   'cd ' , aFolder fullName surroundedBySingleQuotes
		   , ' && git -c user.name=Cormas -c user.email=cormas@example.org '
		   , aCommand , ' > /dev/null 2>&1 && echo ok') trimBoth = 'ok'
]

{ #category : 'helpers' }
CMIcebergTest >> icebergRepositoriesAt: aFolder [

	^ IceRepository registry select: [ :each | each location = aFolder ]
]

{ #category : 'helpers' }
CMIcebergTest >> installGitMock [

	self mockFolderNamed: 'Mock'.
	self makeGitRepository: self mockFolder.
	workspace install: (CMModelFolder in: workspace at: self mockFolder).
	CMWorkspace current: workspace
]

{ #category : 'helpers' }
CMIcebergTest >> makeGitRepository: aFolder [
	"Turn aFolder into a git repository with one commit of all its files, or skip the test without git"

	OSPlatform current isWindows ifTrue: [ ^ self skip ].
	(self git: 'init -q' in: aFolder) ifFalse: [ ^ self skip ].
	self commitAllIn: aFolder
]

{ #category : 'helpers' }
CMIcebergTest >> mockFolder [

	^ workspace modelsFolder / 'Mock'
]

{ #category : 'helpers' }
CMIcebergTest >> model [

	^ workspace installedModelNamed: 'CMWorkspaceMock'
]

{ #category : 'tests' }
CMIcebergTest >> testCommitFromIcebergKeepsSaving [

	| repository |
	self installGitMock.
	repository := (self icebergRepositoriesAt: self mockFolder) first.
	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	repository commitWithMessage: 'Answer'.
	self assert: self model isUpToDate.
	self mockClass compile: 'answer ^ 43' classified: 'editing'.
	self assert: self model isSaved
]

{ #category : 'tests' }
CMIcebergTest >> testEditShowsInIceberg [

	self installGitMock.
	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	self assert:
		(self icebergRepositoriesAt: self mockFolder) first workingCopy
			isModified
]

{ #category : 'tests' }
CMIcebergTest >> testIcebergChangingTheFolderRefreshesTheModel [

	| repository |
	self installGitMock.
	repository := (self icebergRepositoriesAt: self mockFolder) first.
	self mockFolder / 'src' / 'CMWorkspaceMock-Model'
	/ 'CMWorkspaceMockModel.class.st' writeStreamDo: [ :stream |
			stream nextPutAll: 'Class {
	#name : ''CMWorkspaceMockModel'',
	#superclass : ''CMModel'',
	#category : ''CMWorkspaceMock-Model'',
	#package : ''CMWorkspaceMock-Model''
}

{ #category : ''editing'' }
CMWorkspaceMockModel >> answer [
	^ 42
]
' ].
	Iceberg announcer announce: (IceRepositoryModified for: repository).
	self assert: self mockClass new answer equals: 42.
	self assert: self model isUpToDate
]

{ #category : 'tests' }
CMIcebergTest >> testInstallingAFolderAlreadyInIcebergRegistersItOnce [

	self mockFolderNamed: 'Mock'.
	self makeGitRepository: self mockFolder.
	(IceRepositoryCreator new
		 location: self mockFolder;
		 subdirectory: 'src';
		 ensureProjectFile;
		 addLocalRepository) register.
	workspace install: (CMModelFolder in: workspace at: self mockFolder).
	self
		assert: (self icebergRepositoriesAt: self mockFolder) size
		equals: 1
]

{ #category : 'tests' }
CMIcebergTest >> testInstallingAFolderWithoutGitRegistersNothing [

	workspace install: (self mockFolderNamed: 'Mock').
	self assert: (self icebergRepositoriesAt: self mockFolder) isEmpty
]

{ #category : 'tests' }
CMIcebergTest >> testInstallingAGitFolderRegistersItWithIceberg [

	| repositories |
	self installGitMock.
	repositories := self icebergRepositoriesAt: self mockFolder.
	self assert: repositories size equals: 1.
	self assert: repositories first workingCopy modifiedPackages isEmpty.
	self assert:
		(repositories first workingCopy packages allSatisfy: [ :each |
			 each isLoaded ])
]

{ #category : 'tests' }
CMIcebergTest >> testNewModelFolderIsACleanIcebergProject [

	| folder repository |
	folder := (workspace createModelFrom:
		           (CMModelTemplate named: 'CMWorkspaceMock Forest'))
		          location.
	self makeGitRepository: folder.
	workspace refresh.
	repository := (self icebergRepositoriesAt: folder) first.
	self deny: repository workingCopy isModified
]

{ #category : 'tests' }
CMIcebergTest >> testRefreshRegistersAFolderThatBecameAGitRepository [

	workspace install: (self mockFolderNamed: 'Mock').
	self makeGitRepository: self mockFolder.
	workspace refresh.
	self
		assert: (self icebergRepositoriesAt: self mockFolder) size
		equals: 1
]

{ #category : 'tests' }
CMIcebergTest >> testRefreshRegistersARenamedGitFolderAgain [

	| renamed |
	self installGitMock.
	renamed := workspace modelsFolder / 'Mock 2026'.
	self mockFolder moveTo: renamed.
	workspace refresh.
	self assert: (self icebergRepositoriesAt: self mockFolder) isEmpty.
	self assert: (self icebergRepositoriesAt: renamed) size equals: 1
]

{ #category : 'tests' }
CMIcebergTest >> testUninstallForgetsTheIcebergRepository [

	self installGitMock.
	workspace uninstall: 'CMWorkspaceMock'.
	self assert: (self icebergRepositoriesAt: self mockFolder) isEmpty
]
