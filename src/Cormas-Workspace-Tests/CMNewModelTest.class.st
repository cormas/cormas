"
I test how a workspace creates a new model from a `CMModelTemplate`: its folder is written in `Models`, and the model is installed from it like any other, so that it can be simulated, saved as it is edited and installed again.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`.
"
Class {
	#name : 'CMNewModelTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMNewModelTest >> createForest [

	^ workspace createModelFrom: self template
]

{ #category : 'helpers' }
CMNewModelTest >> forestFolder [

	^ workspace modelsFolder / 'CMWorkspaceMockForest'
]

{ #category : 'helpers' }
CMNewModelTest >> modelClass [

	^ self class environment at: self template modelClassName asSymbol
]

{ #category : 'helpers' }
CMNewModelTest >> modelFile [

	^ self forestFolder / 'src' / self template modelPackageName
	  / (self template modelClassName , '.class.st')
]

{ #category : 'helpers' }
CMNewModelTest >> template [

	^ (CMModelTemplate named: 'CMWorkspaceMock Forest') description:
		  'Trees grow and burn'
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelAlreadyInTheWorkspaceRaisesAnError [

	self
		writeModel: 'CMWorkspaceMockForest'
		spec: 'spec package: ''CMWorkspaceMockForest-Model'''
		in: workspace modelsFolder / 'Elsewhere'.
	self should: [ self createForest ] raise: CMWorkspaceError.
	self deny:
		(PackageOrganizer default hasPackage: 'CMWorkspaceMockForest-Model').
	self deny: self forestFolder exists
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelCanBeInstalledAgain [

	self createForest.
	workspace uninstall: 'CMWorkspaceMockForest'.
	self deny: (self class environment includesKey:
			 self template modelClassName asSymbol).
	workspace install:
		(CMModelFolder in: workspace at: self forestFolder).
	self assert: (self class environment includesKey:
			 self template modelClassName asSymbol)
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelCanBeSimulated [

	| model |
	self createForest.
	model := self modelClass new.
	model init.
	self assert: model cells size equals: 16
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelIsAFolderOfTheWorkspace [

	| folder |
	folder := self createForest.
	self assert: folder location equals: self forestFolder.
	self assert: folder baselineName equals: 'CMWorkspaceMockForest'.
	self assert: folder summary equals: 'Trees grow and burn'
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelIsInstalled [

	self createForest.
	self assert: (workspace isInstalled: 'CMWorkspaceMockForest').
	self
		assert: (workspace folderOf: self modelClass)
		equals: self forestFolder.
	self assert:
		(workspace installedModelNamed: 'CMWorkspaceMockForest') isUpToDate
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelIsSavedAsItIsEdited [

	self createForest.
	CMWorkspace current: workspace.
	self modelClass compile: 'answer ^ 42' classified: 'editing'.
	self assert: (self modelFile contents includesSubstring: 'answer')
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelTakesAnotherFolderWhenTheNameIsTaken [

	| folder |
	self forestFolder ensureCreateDirectory.
	folder := self createForest.
	self
		assert: folder location
		equals: workspace modelsFolder / 'CMWorkspaceMockForest 2'.
	self assert: self forestFolder children isEmpty
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelThatCannotBeInstalledLeavesNothingBehind [

	PackageOrganizer default ensurePackage: 'CMWorkspaceMockForest-Model'.
	self should: [ self createForest ] raise: CMWorkspaceError.
	self assert:
		(PackageOrganizer default hasPackage: 'CMWorkspaceMockForest-Model').
	self deny: (PackageOrganizer default hasPackage:
			 'BaselineOfCMWorkspaceMockForest').
	self deny: self forestFolder exists.
	self deny: (workspace isInstalled: 'CMWorkspaceMockForest')
]
