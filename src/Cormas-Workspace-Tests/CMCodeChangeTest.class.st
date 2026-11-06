"
I test that the code changes made in the image are saved into the folder of the installed model they belong to, without any explicit save, and that packages outside the baseline are found and can be added to it.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`. I install the model `CMWorkspaceMock` and make the workspace the current one before each test, and I restore the previous current workspace before anything is removed.
"
Class {
	#name : 'CMCodeChangeTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMCodeChangeTest >> addClassNamed: aSymbol inPackageNamed: aPackageName [

	^ (Object << aSymbol)
		  package: aPackageName;
		  install
]

{ #category : 'helpers' }
CMCodeChangeTest >> model [

	^ workspace installedModelNamed: 'CMWorkspaceMock'
]

{ #category : 'helpers' }
CMCodeChangeTest >> modelFile [

	^ self packageFolder / 'CMWorkspaceMockModel.class.st'
]

{ #category : 'helpers' }
CMCodeChangeTest >> packageFolder [

	^ workspace modelsFolder / 'Mock' / 'src' / 'CMWorkspaceMock-Model'
]

{ #category : 'running' }
CMCodeChangeTest >> setUp [

	super setUp.
	workspace install: (self mockFolderNamed: 'Mock').
	CMWorkspace current: workspace
]

{ #category : 'tests' }
CMCodeChangeTest >> testAWorkspaceThatIsNotCurrentSavesNothing [

	| before |
	before := self modelFile contents.
	CMWorkspace current:
		(CMWorkspace createAt: FileSystem memory / 'Other').
	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	self assert: self modelFile contents equals: before
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddAPackageOfTheModelRaisesAnError [

	self
		should: [ self model addPackageNamed: 'CMWorkspaceMock-Model' ]
		raise: CMWorkspaceError
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddAnExistingPackageSavesItsClasses [

	self
		addClassNamed: #CMWorkspaceMockExtraThing
		inPackageNamed: 'CMWorkspaceMock-Extra'.
	self model addPackageNamed: 'CMWorkspaceMock-Extra'.
	self assert:
		(workspace modelsFolder / 'Mock' / 'src' / 'CMWorkspaceMock-Extra'
		 / 'CMWorkspaceMockExtraThing.class.st') isFile
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddPackageCreatesThePackageAndItsFolder [

	self model addPackageNamed: 'CMWorkspaceMock-Extra'.
	self assert:
		(PackageOrganizer default hasPackage: 'CMWorkspaceMock-Extra').
	self assert:
		(workspace modelsFolder / 'Mock' / 'src' / 'CMWorkspaceMock-Extra'
		 / 'package.st') isFile
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddPackageDeclaresItInTheBaseline [

	self model addPackageNamed: 'CMWorkspaceMock-Extra'.
	self assert:
		(self model packageNames includes: 'CMWorkspaceMock-Extra').
	self assert: workspace orphanPackages isEmpty.
	self assert: ((workspace modelsFolder / 'Mock' / 'src'
		  / 'BaselineOfCMWorkspaceMock'
		  / 'BaselineOfCMWorkspaceMock.class.st') contents
			 includesSubstring: 'CMWorkspaceMock-Extra').
	self assert: self model isSaved
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddPackageToABaselineWithGroupsRaisesAnError [

	| folder |
	workspace uninstall: 'CMWorkspaceMock'.
	folder := workspace modelsFolder / 'Grouped'.
	self
		writeModel: 'CMWorkspaceMock'
		spec:
		'spec package: ''CMWorkspaceMock-Model''. spec group: ''default'' with: #( ''CMWorkspaceMock-Model'' )'
		in: folder.
	self
		writePackage: 'CMWorkspaceMock-Model'
		withModelClass: 'CMWorkspaceMockModel'
		in: folder.
	workspace install: (CMModelFolder in: workspace at: folder).
	self
		should: [ self model addPackageNamed: 'CMWorkspaceMock-Extra' ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'by hand') ].
	self deny:
		(self model packageNames includes: 'CMWorkspaceMock-Extra')
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testAddedPackageIsInstalledAgain [

	self model addPackageNamed: 'CMWorkspaceMock-Extra'.
	self
		addClassNamed: #CMWorkspaceMockExtraThing
		inPackageNamed: 'CMWorkspaceMock-Extra'.
	workspace uninstall: 'CMWorkspaceMock'.
	self deny:
		(self class environment includesKey: #CMWorkspaceMockExtraThing).
	workspace install:
		(CMModelFolder in: workspace at: workspace modelsFolder / 'Mock').
	self assert:
		(self class environment includesKey: #CMWorkspaceMockExtraThing)
]

{ #category : 'tests' }
CMCodeChangeTest >> testAddingAClassSavesIt [

	self
		addClassNamed: #CMWorkspaceMockTree
		inPackageNamed: 'CMWorkspaceMock-Model'.
	self assert:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') isFile
]

{ #category : 'tests' }
CMCodeChangeTest >> testAddingAnExtensionMethodSavesIt [

	Object
		compile: 'cmWorkspaceMockAnswer ^ 42'
		classified: '*CMWorkspaceMock-Model'.
	self assert: ((self packageFolder / 'Object.extension.st') contents
			 includesSubstring: 'cmWorkspaceMockAnswer').
	Object removeSelector: #cmWorkspaceMockAnswer.
	self deny: (self packageFolder / 'Object.extension.st') exists
]

{ #category : 'tests' }
CMCodeChangeTest >> testChangingAClassDefinitionSavesIt [

	(Object << #CMWorkspaceMockModel)
		slots: { #trees };
		package: 'CMWorkspaceMock-Model';
		install.
	self assert: (self modelFile contents includesSubstring: 'trees')
]

{ #category : 'tests' }
CMCodeChangeTest >> testEditingAMethodSavesIt [

	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	self assert: (self modelFile contents includesSubstring: 'answer').
	self assert: self model isSaved
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testPackageNamedLikeAModelButOutsideItsBaselineIsAnOrphan [

	PackageOrganizer default ensurePackage: 'CMWorkspaceMock-Extra'.
	self
		assert:
		(workspace orphanPackages at: 'CMWorkspaceMock-Extra') baselineName
		equals: 'CMWorkspaceMock'
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testPackageNamedOtherwiseIsNotAnOrphan [

	PackageOrganizer default ensurePackage: 'CMWorkspaceMockOther'.
	self assert: workspace orphanPackages isEmpty
]

{ #category : 'tests - packages' }
CMCodeChangeTest >> testPackagesOfTheModelAreNotOrphans [

	self assert: workspace orphanPackages isEmpty
]

{ #category : 'tests' }
CMCodeChangeTest >> testRemovingAClassDeletesItsFile [

	(self
		 addClassNamed: #CMWorkspaceMockTree
		 inPackageNamed: 'CMWorkspaceMock-Model') removeFromSystem.
	self deny:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') exists.
	self assert: self model isSaved
]

{ #category : 'tests' }
CMCodeChangeTest >> testRemovingAClassDeletesTheExtensionsOfTheModelOnIt [

	| other |
	other := self
		         addClassNamed: #CMWorkspaceMockOtherThing
		         inPackageNamed: 'CMWorkspaceMockOther'.
	other compile: 'answer ^ 42' classified: '*CMWorkspaceMock-Model'.
	self assert:
		(self packageFolder / 'CMWorkspaceMockOtherThing.extension.st')
			isFile.
	other removeFromSystem.
	self deny:
		(self packageFolder / 'CMWorkspaceMockOtherThing.extension.st')
			exists
]

{ #category : 'tests' }
CMCodeChangeTest >> testRemovingAMethodSavesIt [

	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	self mockClass removeSelector: #answer.
	self deny: (self modelFile contents includesSubstring: 'answer')
]

{ #category : 'tests' }
CMCodeChangeTest >> testRenamingAClassRenamesItsFile [

	(self
		 addClassNamed: #CMWorkspaceMockTree
		 inPackageNamed: 'CMWorkspaceMock-Model') rename:
		#CMWorkspaceMockOak.
	self deny:
		(self packageFolder / 'CMWorkspaceMockTree.class.st') exists.
	self assert:
		((self packageFolder / 'CMWorkspaceMockOak.class.st') contents
			 includesSubstring: 'CMWorkspaceMockOak').
	self assert: self model isSaved
]

{ #category : 'tests' }
CMCodeChangeTest >> testUninstallDoesNotDeleteTheFilesOfTheModel [

	workspace uninstall: 'CMWorkspaceMock'.
	self assert: self modelFile isFile.
	self assert:
		(workspace modelsFolder / 'Mock' / 'src'
		 / 'BaselineOfCMWorkspaceMock') exists
]
