"
I test how a workspace brings its installed models up to date with their folders, as at startup: following a folder that was renamed or moved, keeping the code when the folder is gone or ambiguous, and reloading what changed outside Cormas after backing up the code in the image.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`. I install the model `CMWorkspaceMock` and make the workspace the current one before each test, so that code changes are saved as they happen.
"
Class {
	#name : 'CMRefreshTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMRefreshTest >> backups [

	^ workspace backupsFolder exists
		  ifTrue: [ workspace backupsFolder children ]
		  ifFalse: [ #(  ) ]
]

{ #category : 'helpers' }
CMRefreshTest >> mockFolder [

	^ workspace modelsFolder / 'Mock'
]

{ #category : 'helpers' }
CMRefreshTest >> model [

	^ workspace installedModelNamed: 'CMWorkspaceMock'
]

{ #category : 'helpers' }
CMRefreshTest >> modelFileIn: aFolder [

	^ aFolder / 'src' / 'CMWorkspaceMock-Model'
	  / 'CMWorkspaceMockModel.class.st'
]

{ #category : 'running' }
CMRefreshTest >> setUp [

	super setUp.
	workspace install: (self mockFolderNamed: 'Mock').
	CMWorkspace current: workspace
]

{ #category : 'tests - folder' }
CMRefreshTest >> testFolderComesBackAfterItWasGone [

	| moved |
	moved := directory parent / (directory basename , '-moved').
	self mockFolder moveTo: moved.
	[
		workspace refresh.
		self deny: self model isSaved.
		moved moveTo: self mockFolder.
		workspace refresh.
		self assert: self model isSaved ] ensure: [ moved ensureDeleteAll ]
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshAsksWhenTheModelIsInSeveralFolders [

	self mockFolder copyAllTo: workspace modelsFolder / 'Mock A'.
	self mockFolder moveTo: workspace modelsFolder / 'Mock B'.
	workspace refresh.
	self deny: self model isSaved.
	self assert: (self model problem includesSubstring: 'Mock A').
	self assert: (self model problem includesSubstring: 'Mock B').
	self assert: self model folder equals: self mockFolder
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshBacksUpTheCodeInTheImageBeforeReloading [

	| unzipped |
	self mockClass compile: 'answer ^ 1' classified: 'editing'.
	self writeModelClassAnswering: '42' in: self mockFolder.
	workspace refresh.
	self assert: self backups size equals: 1.
	unzipped := self unzip: self backups first.
	self assert: ((self modelFileIn: unzipped children first) contents
			 includesSubstring: '^ 1')
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshChangesNothingWhenTheWorkspaceIsNotFound [

	directory deleteAll.
	workspace refresh.
	self assert: (workspace isInstalled: 'CMWorkspaceMock').
	self assert: self model isSaved
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshDoesNotWriteWhileReloading [

	| written |
	self writeModelClassAnswering: '42' in: self mockFolder.
	written := (self modelFileIn: self mockFolder) contents.
	workspace refresh.
	self
		assert: (self modelFileIn: self mockFolder) contents
		equals: written
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshFollowsARenamedAndChangedFolder [

	| renamed |
	renamed := workspace modelsFolder / 'Mock 2026'.
	self mockFolder moveTo: renamed.
	self writeModelClassAnswering: '42' in: renamed.
	workspace refresh.
	self assert: self model folder equals: renamed.
	self assert: self mockClass new answer equals: 42
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshFollowsARenamedFolder [

	| renamed |
	renamed := workspace modelsFolder / 'Mock 2026'.
	self mockFolder moveTo: renamed.
	workspace refresh.
	self assert: self model folder equals: renamed.
	self assert: self model isSaved.
	self assert: self backups isEmpty
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshIgnoresAFolderOfAnotherModel [

	self mockFolder moveTo: workspace modelsFolder / 'Elsewhere'.
	self
		writeModel: 'CMWorkspaceMockFire'
		spec: 'spec package: ''CMWorkspaceMockFire-Model'''
		in: self mockFolder.
	workspace refresh.
	self
		assert: self model folder
		equals: workspace modelsFolder / 'Elsewhere'
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshKeepsTheCodeWhenTheFolderCannotBeLoaded [

	self
		write: 'Class { not tonel at all'
		to: (self modelFileIn: self mockFolder).
	workspace refresh.
	self assert:
		(self class environment includesKey: #CMWorkspaceMockModel).
	self deny: self model isSaved.
	self assert:
		(self model problem includesSubstring: 'could not be reloaded')
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshKeepsTheCodeWhenTheFolderIsGone [

	self mockFolder deleteAll.
	workspace refresh.
	self assert: (workspace isInstalled: 'CMWorkspaceMock').
	self assert:
		(self class environment includesKey: #CMWorkspaceMockModel).
	self deny: self model isSaved.
	self assert: (self model problem includesSubstring: 'gone')
]

{ #category : 'tests - folder' }
CMRefreshTest >> testRefreshKeepsTheFolderWhenThereIsACopy [

	self mockFolder copyAllTo: workspace modelsFolder / 'Mock copy'.
	workspace refresh.
	self assert: self model folder equals: self mockFolder.
	self assert: self model isSaved
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshLoadsAClassAddedOutsideCormas [

	self
		write: 'Class {
	#name : ''CMWorkspaceMockTree'',
	#superclass : ''Object'',
	#category : ''CMWorkspaceMock-Model'',
	#package : ''CMWorkspaceMock-Model''
}
'
		to: self mockFolder / 'src' / 'CMWorkspaceMock-Model'
			/ 'CMWorkspaceMockTree.class.st'.
	workspace refresh.
	self assert:
		(self class environment includesKey: #CMWorkspaceMockTree)
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshLoadsAPackageAddedOutsideCormas [

	self
		writeModel: 'CMWorkspaceMock'
		spec:
		'spec package: ''CMWorkspaceMock-Model''; package: ''CMWorkspaceMock-Extra'''
		in: self mockFolder.
	self
		writePackage: 'CMWorkspaceMock-Extra'
		withModelClass: 'CMWorkspaceMockExtraModel'
		in: self mockFolder.
	workspace refresh.
	self assert:
		(self class environment includesKey: #CMWorkspaceMockExtraModel).
	self assert:
		(self model packageNames includes: 'CMWorkspaceMock-Extra')
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshMakesAModelThatWasChangedOutsideSaveAgain [

	self writeModelClassAnswering: '42' in: self mockFolder.
	self mockClass compile: 'question ^ 1' classified: 'editing'.
	self deny: self model isSaved.
	workspace refresh.
	self assert: self model isSaved.
	self mockClass compile: 'question ^ 2' classified: 'editing'.
	self assert:
		((self modelFileIn: self mockFolder) contents includesSubstring:
			 'question')
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshReloadsAClassChangedOutsideCormas [

	self writeModelClassAnswering: '42' in: self mockFolder.
	workspace refresh.
	self assert: self mockClass new answer equals: 42.
	self assert: self model isSaved
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshRemovesAClassDeletedOutsideCormas [

	| treeFile |
	(Object << #CMWorkspaceMockTree)
		package: 'CMWorkspaceMock-Model';
		install.
	treeFile := self mockFolder / 'src' / 'CMWorkspaceMock-Model'
	            / 'CMWorkspaceMockTree.class.st'.
	self assert: treeFile isFile.
	treeFile delete.
	workspace refresh.
	self deny: (self class environment includesKey: #CMWorkspaceMockTree).
	self assert: self model isSaved
]

{ #category : 'tests - reload' }
CMRefreshTest >> testRefreshWithNothingChangedDoesNothing [

	workspace refresh.
	self assert: self backups isEmpty.
	self assert: self model isSaved
]

{ #category : 'tests - reload' }
CMRefreshTest >> testStartupRefreshesTheCurrentWorkspace [

	self writeModelClassAnswering: '42' in: self mockFolder.
	CMWorkspace startUp: true.
	self assert: self mockClass new answer equals: 42
]

{ #category : 'helpers' }
CMRefreshTest >> writeModelClassAnswering: aString in: aFolder [
	"Write the model class with a method answer, as someone would outside Cormas, with an unusual layout that Cormas would not write"

	self
		write: 'Class {
	#name : ''CMWorkspaceMockModel'',
	#superclass : ''CMModel'',
	#category : ''CMWorkspaceMock-Model'',
	#package : ''CMWorkspaceMock-Model''
}


{ #category : ''editing'' }
CMWorkspaceMockModel >> answer [
	^   ' , aString , '
]
'
		to: (self modelFileIn: aFolder)
]
