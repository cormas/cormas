"
I test downloading examples into the Examples folder of a workspace and updating them to the latest version of the library.

The library is a git repository in the test directory, so the tests need the git command line but no network. They are skipped on Windows and without git.
"
Class {
	#name : 'CMExampleTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMExampleTest >> changeLibraryFile: aPath to: aString [
	"Write aString into a file of the library and commit it, as a new version of the model"

	(self libraryFolder / aPath) ensureDelete.
	self write: aString to: self libraryFolder / aPath.
	self commitAllIn: self libraryFolder
]

{ #category : 'helpers' }
CMExampleTest >> download [

	^ workspace download: self libraryFolder fullName
]

{ #category : 'helpers' }
CMExampleTest >> exampleFolder [

	^ workspace examplesFolder / 'CMWorkspaceMock'
]

{ #category : 'helpers' }
CMExampleTest >> libraryFolder [

	^ directory / 'Library'
]

{ #category : 'helpers' }
CMExampleTest >> makeLibrary [
	"Make a git repository holding the model CMWorkspaceMock, as a model repository of the library"

	self
		writeModel: 'CMWorkspaceMock'
		spec: 'spec package: ''CMWorkspaceMock-Model'''
		in: self libraryFolder.
	self
		writePackage: 'CMWorkspaceMock-Model'
		withModelClass: 'CMWorkspaceMockModel'
		in: self libraryFolder.
	self makeGitRepository: self libraryFolder
]

{ #category : 'tests' }
CMExampleTest >> testDownloadClonesTheModelIntoExamples [

	| folder |
	self makeLibrary.
	folder := self download.
	self assert: folder location equals: self exampleFolder.
	self assert: folder isExample.
	self assert: folder baselineName equals: 'CMWorkspaceMock'.
	self assert: (self exampleFolder / '.git') isDirectory.
	self assert: (self exampleFolder / 'src' / 'CMWorkspaceMock-Model'
		 / 'CMWorkspaceMockModel.class.st') isFile.
	self deny: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests' }
CMExampleTest >> testDownloadIsRefusedWhenTheExampleIsAlreadyDownloaded [

	self makeLibrary.
	self download.
	self
		should: [ self download ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'CMWorkspaceMock is already downloaded') ].
	self
		assert:
		(workspace examplesFolder children collect: [ :each | each basename ])
		equals: #( 'CMWorkspaceMock' )
]

{ #category : 'tests' }
CMExampleTest >> testDownloadOfAMissingRepositoryIsRefused [

	self makeLibrary.
	self libraryFolder ensureDeleteAll.
	self
		should: [ self download ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'Cormas cannot download ' , self libraryFolder fullName) ].
	self deny: (workspace examplesFolder exists and: [
			 workspace examplesFolder hasChildren ])
]

{ #category : 'tests' }
CMExampleTest >> testDownloadOfARepositoryWithoutModelIsRefused [

	self makeLibrary.
	(self libraryFolder / 'cormas.json') delete.
	self commitAllIn: self libraryFolder.
	self
		should: [ self download ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'holds no model (no cormas.json)') ].
	self assertEmpty: workspace examplesFolder children
]

{ #category : 'tests' }
CMExampleTest >> testUpdateBacksUpFilesEditedByHand [

	| backup |
	self makeLibrary.
	self changeLibraryFile: 'README.md' to: 'Version 1'.
	self download.
	self write: ' and my notes' to: self exampleFolder / 'README.md'.
	workspace updateExamples.
	self
		assert: (self exampleFolder / 'README.md') contents
		equals: 'Version 1'.
	backup := self unzip: self onlyBackup.
	self
		assert: (backup / 'CMWorkspaceMock' / 'README.md') contents
		equals: ' and my notes'
]

{ #category : 'tests' }
CMExampleTest >> testUpdateBringsTheLibraryChanges [

	self makeLibrary.
	self download.
	self changeLibraryFile: 'README.md' to: 'Version 2'.
	workspace updateExamples.
	self
		assert: (self exampleFolder / 'README.md') contents
		equals: 'Version 2'.
	self deny: workspace backupsFolder exists
]

{ #category : 'tests' }
CMExampleTest >> testUpdateKeepsFilesAddedByHand [

	self makeLibrary.
	self download.
	(self exampleFolder / 'output') ensureCreateDirectory.
	self write: '1,2' to: self exampleFolder / 'output' / 'results.csv'.
	self changeLibraryFile: 'README.md' to: 'Version 2'.
	workspace updateExamples.
	self
		assert: (self exampleFolder / 'output' / 'results.csv') contents
		equals: '1,2'.
	self deny: workspace backupsFolder exists
]

{ #category : 'tests' }
CMExampleTest >> testUpdateReloadsAnInstalledExample [

	self makeLibrary.
	workspace install: self download.
	self
		changeLibraryFile:
		'src/CMWorkspaceMock-Model/CMWorkspaceMockModel.class.st'
		to: 'Class {
	#name : ''CMWorkspaceMockModel'',
	#superclass : ''CMModel'',
	#category : ''CMWorkspaceMock-Model'',
	#package : ''CMWorkspaceMock-Model''
}

{ #category : ''accessing'' }
CMWorkspaceMockModel >> answer [
	^ 42
]
'.
	workspace updateExamples.
	self assert: self mockClass new answer equals: 42.
	self assert:
		(workspace installedModelNamed: 'CMWorkspaceMock') isUpToDate
]

{ #category : 'tests' }
CMExampleTest >> testUpdateRemovesFilesRemovedFromTheLibrary [

	self makeLibrary.
	self changeLibraryFile: 'data.csv' to: 'a,b'.
	self download.
	(self libraryFolder / 'data.csv') delete.
	self commitAllIn: self libraryFolder.
	workspace updateExamples.
	self deny: (self exampleFolder / 'data.csv') exists
]

{ #category : 'tests' }
CMExampleTest >> testUpdateWithoutLibraryChangesNothing [

	self makeLibrary.
	self download.
	self write: 'my notes' to: self exampleFolder / 'notes.txt'.
	self libraryFolder ensureDeleteAll.
	self
		should: [ workspace updateExamples ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'Cormas cannot download the latest version of CMWorkspaceMock') ].
	self
		assert: (self exampleFolder / 'notes.txt') contents
		equals: 'my notes'.
	self deny: workspace backupsFolder exists
]
