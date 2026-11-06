"
I test how an installed model saves the code of a package into its folder, file by file, and how it refuses to overwrite a file that someone else changed.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`, and install the model `CMWorkspaceMock` before each test.
"
Class {
	#name : 'CMWriteThroughTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMWriteThroughTest >> addTreeClass [

	^ (Object << #CMWorkspaceMockTree)
		  package: 'CMWorkspaceMock-Model';
		  install
]

{ #category : 'helpers' }
CMWriteThroughTest >> editModelClass [

	self mockClass compile: 'answer ^ 42' classified: 'editing'
]

{ #category : 'helpers' }
CMWriteThroughTest >> model [

	^ workspace installedModelNamed: 'CMWorkspaceMock'
]

{ #category : 'helpers' }
CMWriteThroughTest >> modelFile [

	^ self packageFolder / 'CMWorkspaceMockModel.class.st'
]

{ #category : 'helpers' }
CMWriteThroughTest >> packageFolder [

	^ workspace modelsFolder / 'Mock' / 'src' / 'CMWorkspaceMock-Model'
]

{ #category : 'helpers' }
CMWriteThroughTest >> save [

	workspace savePackageNamed: 'CMWorkspaceMock-Model'
]

{ #category : 'helpers' }
CMWriteThroughTest >> saveClassNamed: aClassName [

	workspace
		saveClassNamed: aClassName
		inPackageNamed: 'CMWorkspaceMock-Model'
]

{ #category : 'running' }
CMWriteThroughTest >> setUp [

	super setUp.
	workspace install: (self mockFolderNamed: 'Mock')
]

{ #category : 'tests' }
CMWriteThroughTest >> testFileAddedOutsideCormasIsNotDeleted [

	self
		write: 'Class { #name : ''Bob'' }'
		to: self packageFolder / 'Bob.class.st'.
	self editModelClass.
	self save.
	self assert: (self packageFolder / 'Bob.class.st') isFile.
	self deny: (self modelFile contents includesSubstring: 'answer').
	self deny: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testFileChangedOutsideCormasIsNotOverwritten [

	self
		write: self modelFile contents , '"changed by Bob"'
		to: self modelFile.
	self editModelClass.
	self save.
	self assert:
		(self modelFile contents includesSubstring: 'changed by Bob').
	self deny: (self modelFile contents includesSubstring: 'answer').
	self deny: self model isSaved.
	self assert:
		(self model problem includesSubstring:
			 'CMWorkspaceMockModel.class.st')
]

{ #category : 'tests' }
CMWriteThroughTest >> testFileDeletedOutsideCormasIsNotWrittenAgain [

	self modelFile delete.
	self editModelClass.
	self save.
	self deny: self modelFile exists.
	self deny: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testNothingIsWrittenOnceTheModelIsNotSaved [

	self
		write: self modelFile contents , '"changed by Bob"'
		to: self modelFile.
	self editModelClass.
	self save.
	self addTreeClass.
	self save.
	self deny:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') exists
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveAPackageOfNoModelDoesNothing [

	workspace savePackageNamed: 'Cormas-Core'.
	self assert: self model isSaved
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveARemovedClassDeletesItsFile [

	self addTreeClass.
	self saveClassNamed: 'CMWorkspaceMockTree'.
	self assert: self treeFile isFile.
	(self class environment at: #CMWorkspaceMockTree) removeFromSystem.
	self saveClassNamed: 'CMWorkspaceMockTree'.
	self deny: self treeFile exists.
	self assert: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveAgainAfterItsOwnWrites [

	self editModelClass.
	self save.
	self mockClass compile: 'answer ^ 43' classified: 'editing'.
	self save.
	self assert: (self modelFile contents includesSubstring: '43').
	self assert: self model isSaved
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveAnExtensionMethod [

	| extensionFile |
	extensionFile := self packageFolder / 'Object.extension.st'.
	Object
		compile: 'cmWorkspaceMockAnswer ^ 42'
		classified: '*CMWorkspaceMock-Model'.
	self saveClassNamed: 'Object'.
	self assert:
		(extensionFile contents includesSubstring: 'cmWorkspaceMockAnswer').
	self deny: (extensionFile contents includesSubstring: 'printString').
	Object removeSelector: #cmWorkspaceMockAnswer.
	self saveClassNamed: 'Object'.
	self deny: extensionFile exists
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveClassAndSavePackageWriteTheSameFiles [

	| byClass |
	self editModelClass.
	self saveClassNamed: 'CMWorkspaceMockModel'.
	byClass := self modelFile binaryReadStream upToEnd.
	self save.
	self assert: self modelFile binaryReadStream upToEnd equals: byClass.
	self assert: self model isSaved
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveClassDoesNotOverwriteItsFileChangedOutsideCormas [

	self
		write: self modelFile contents , '"changed by Bob"'
		to: self modelFile.
	self editModelClass.
	self saveClassNamed: 'CMWorkspaceMockModel'.
	self assert:
		(self modelFile contents includesSubstring: 'changed by Bob').
	self deny: self model isSaved
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveClassIgnoresOtherFilesChangedOutsideCormas [

	self
		write: 'Class { #name : ''Bob'' }'
		to: self packageFolder / 'Bob.class.st'.
	self editModelClass.
	self saveClassNamed: 'CMWorkspaceMockModel'.
	self assert: (self modelFile contents includesSubstring: 'answer').
	self assert: (self packageFolder / 'Bob.class.st') isFile.
	self assert: self model isSaved
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveClassWritesOnlyThatClass [

	self editModelClass.
	self addTreeClass.
	self saveClassNamed: 'CMWorkspaceMockModel'.
	self assert: (self modelFile contents includesSubstring: 'answer').
	self deny: self treeFile exists
]

{ #category : 'tests - class' }
CMWriteThroughTest >> testSaveClassWritesTheChangedClass [

	self editModelClass.
	self saveClassNamed: 'CMWorkspaceMockModel'.
	self assert: (self modelFile contents includesSubstring: 'answer').
	self assert: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveDeletesTheFileOfARemovedClass [

	self addTreeClass.
	self save.
	(self class environment at: #CMWorkspaceMockTree) removeFromSystem.
	self save.
	self deny:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') exists.
	self assert: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveLeavesNoTemporaryFile [

	self editModelClass.
	self addTreeClass.
	self save.
	self
		assert:
		(self packageFolder children collect: [ :each | each basename ])
			asSet
		equals: #( 'package.st' 'CMWorkspaceMockModel.class.st'
			   'CMWorkspaceMockTree.class.st' ) asSet
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveNeverCreatesTheFolder [

	(workspace modelsFolder / 'Mock') deleteAll.
	self editModelClass.
	self save.
	self deny: (workspace modelsFolder / 'Mock') exists.
	self deny: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveWhereNothingCanBeWritten [

	OSPlatform current isWindows ifTrue: [ ^ self skip ].
	LibC runCommand:
		'chmod 555 ' , self packageFolder fullName surroundedBySingleQuotes.
	[
		self editModelClass.
		self save.
		self deny: (self modelFile contents includesSubstring: 'answer').
		self deny: self model isSaved.
		self assert: (self model problem includesSubstring: 'cannot write') ]
		ensure: [
				LibC runCommand:
					'chmod 755 '
					, self packageFolder fullName surroundedBySingleQuotes ]
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveWritesAChangedMethod [

	self editModelClass.
	self save.
	self assert: (self modelFile contents includesSubstring: 'answer').
	self assert: self model isSaved
]

{ #category : 'tests' }
CMWriteThroughTest >> testSaveWritesANewClassInItsOwnFile [

	self addTreeClass.
	self save.
	self assert:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') isFile
]

{ #category : 'tests' }
CMWriteThroughTest >> testSavedCodeIsInstalledAgain [

	self editModelClass.
	self save.
	workspace uninstall: 'CMWorkspaceMock'.
	workspace install:
		(CMModelFolder in: workspace at: workspace modelsFolder / 'Mock').
	self assert: self mockClass new answer equals: 42
]

{ #category : 'helpers' }
CMWriteThroughTest >> treeFile [

	^ self packageFolder / 'CMWorkspaceMockTree.class.st'
]
