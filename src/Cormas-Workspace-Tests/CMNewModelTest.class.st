"
I test how a workspace creates a new model: its code is generated in the image, its folder is created in `Models` with everything a model folder holds, and the model is installed from that folder.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`, so that a new model can be installed again from its folder.
"
Class {
	#name : 'CMNewModelTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMNewModelTest >> createForest [

	^ workspace createModelWith: self generator
]

{ #category : 'helpers' }
CMNewModelTest >> forestFolder [

	^ workspace modelsFolder / 'CMWorkspaceMockForest'
]

{ #category : 'helpers' }
CMNewModelTest >> generator [

	^ CMModelGenerator new
		  modelName: 'CMWorkspaceMock Forest';
		  description: 'Trees grow and burn';
		  yourself
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

	| generator |
	generator := self generator.
	workspace createModelWith: generator.
	workspace uninstall: 'CMWorkspaceMockForest'.
	self deny:
		(self class environment includesKey:
			 generator modelClassName asSymbol).
	workspace install:
		(CMModelFolder in: workspace at: self forestFolder).
	self assert:
		(self class environment includesKey:
			 generator modelClassName asSymbol)
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelFolderHoldsWhatAModelFolderHolds [

	self createForest.
	self assert:
		((self forestFolder / 'README.md') contents includesSubstring:
			 'CMWorkspaceMock Forest').
	self assert:
		((self forestFolder / 'README.md') contents includesSubstring:
			 'Trees grow and burn').
	self assert:
		((self forestFolder / '.gitignore') contents includesSubstring:
			 'output/').
	self assert:
		((self forestFolder / '.project') contents includesSubstring:
			 '''srcDirectory'' : ''src''').
	self assert: ((self forestFolder / 'src' / '.properties') contents
			 includesSubstring: '#tonel').
	self assert: (self forestFolder / 'data') isDirectory.
	self assert: (self forestFolder / 'output') isDirectory
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelHasItsCodeInItsFolder [

	| generator |
	generator := self generator.
	workspace createModelWith: generator.
	self assert: (self forestFolder / 'src' / generator modelPackageName
		 / (generator modelClassName , '.class.st')) isFile.
	self assert:
		(self forestFolder / 'src' / generator testPackageName) isDirectory.
	self assert:
		(self forestFolder / 'src' / generator baselineClassName
		 / (generator baselineClassName , '.class.st')) isFile
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

	| generator |
	generator := self generator.
	workspace createModelWith: generator.
	self assert: (workspace isInstalled: 'CMWorkspaceMockForest').
	self
		assert: (workspace folderOf:
				 (self class environment at: generator modelClassName asSymbol))
		equals: self forestFolder.
	self assert:
		(workspace installedModelNamed: 'CMWorkspaceMockForest') isUpToDate
]

{ #category : 'tests' }
CMNewModelTest >> testNewModelIsSavedAsItIsEdited [

	| generator |
	generator := self generator.
	workspace createModelWith: generator.
	CMWorkspace current: workspace.
	(self class environment at: generator modelClassName asSymbol)
		compile: 'answer ^ 42'
		classified: 'editing'.
	self assert:
		((self forestFolder / 'src' / generator modelPackageName
		  / (generator modelClassName , '.class.st')) contents
			 includesSubstring: 'answer')
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
CMNewModelTest >> testNewModelThatCannotBeGeneratedLeavesNothingBehind [

	PackageOrganizer default ensurePackage: 'CMWorkspaceMockForest-Model'.
	self should: [ self createForest ] raise: CMWorkspaceError.
	self assert:
		(PackageOrganizer default hasPackage: 'CMWorkspaceMockForest-Model').
	self deny: (PackageOrganizer default hasPackage:
			 'BaselineOfCMWorkspaceMockForest').
	self deny: self forestFolder exists.
	self deny: (workspace isInstalled: 'CMWorkspaceMockForest')
]
