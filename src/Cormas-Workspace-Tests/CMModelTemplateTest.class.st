"
I test `CMModelTemplate`: the names it derives from the name of a model, the names it refuses, and the files it writes for a new model.

I write into a memory file system, so I never touch the disk and create nothing in the image.
"
Class {
	#name : 'CMModelTemplateTest',
	#superclass : 'TestCase',
	#instVars : [
		'folder'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'running' }
CMModelTemplateTest >> setUp [

	super setUp.
	folder := FileSystem memory root / 'Forest fire'
]

{ #category : 'running' }
CMModelTemplateTest >> template [

	^ (CMModelTemplate named: 'ForestFire') description:
		  'Trees grow and burn'
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameIsTheBaselineNameAsTyped [

	#( 'ForestFire' 'forest2' 'ForestModel' ) do: [ :each |
		self assert: (CMModelTemplate named: each) baselineName equals: each ]
]

{ #category : 'tests' }
CMModelTemplateTest >> testNameWithOtherThanLettersAndDigitsRaisesAnError [

	#( '' 'Forest fire' '3Forests' 'Forest-fire' 'Forest_fire'
	   'Forêt' ) do: [ :each |
		self should: [ CMModelTemplate named: each ] raise: CMWorkspaceError ]
]

{ #category : 'tests' }
CMModelTemplateTest >> testNamesOfPackagesAndClasses [

	| template |
	template := CMModelTemplate named: 'ForestFire'.
	self assert: template baselineName equals: 'ForestFire'.
	self assert: template modelPackageName equals: 'ForestFire-Model'.
	self assert: template testPackageName equals: 'ForestFire-Tests'.
	self assert: template modelClassName equals: 'FFModel'.
	self assert: template cellClassName equals: 'FFCell'.
	self assert: template testClassName equals: 'FFModelTest'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixCanBeChosen [

	| template |
	template := (CMModelTemplate named: 'ForestFire') prefix: 'FOR'.
	self assert: template modelClassName equals: 'FORModel'.
	self assert: template cellClassName equals: 'FORCell'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixIsTheCapitalLettersOfTheName [

	self
		assert: (CMModelTemplate named: 'ForestFire') prefix
		equals: 'FF'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixOfASingleWordIsItsFirstTwoLetters [

	self assert: (CMModelTemplate named: 'Forest') prefix equals: 'Fo'.
	self assert: (CMModelTemplate named: 'forest') prefix equals: 'Fo'
]

{ #category : 'tests' }
CMModelTemplateTest >> testPrefixThatIsNotACapitalizedWordRaisesAnError [

	#( '' 'ff' 'F F' '3F' 'Fé' ) do: [ :each |
			self
				should: [ (CMModelTemplate named: 'ForestFire') prefix: each ]
				raise: CMWorkspaceError ]
]

{ #category : 'tests' }
CMModelTemplateTest >> testWrittenBaselineIsManagedByCormas [

	| baseline |
	self template writeTo: folder.
	baseline := (folder / 'src' / 'BaselineOfForestFire'
	             / 'BaselineOfForestFire.class.st') contents.
	self assert: (baseline includesSubstring: 'isManagedByCormas').
	self assert: (baseline includesSubstring: '^ true')
]

{ #category : 'tests' }
CMModelTemplateTest >> testWrittenFolderHoldsTheCodeOfTheModel [

	| src |
	self template writeTo: folder.
	src := folder / 'src'.
	self assert:
		((src / 'ForestFire-Model' / 'FFModel.class.st') contents
			 includesSubstring: '#superclass : ''CMModel''').
	self assert:
		((src / 'ForestFire-Model' / 'FFCell.class.st') contents
			 includesSubstring: '#superclass : ''CMCell''').
	self assert:
		((src / 'ForestFire-Tests' / 'FFModelTest.class.st') contents
			 includesSubstring: '#superclass : ''TestCase''').
	self assert:
		((src / 'BaselineOfForestFire' / 'BaselineOfForestFire.class.st')
			 contents includesSubstring: 'ForestFire-Tests')
]

{ #category : 'tests' }
CMModelTemplateTest >> testWrittenFolderHoldsWhatAModelFolderHolds [

	self template writeTo: folder.
	self assert:
		((folder / 'README.md') contents includesSubstring: '# ForestFire').
	self assert: ((folder / 'README.md') contents includesSubstring:
			 'Trees grow and burn').
	self assert:
		((folder / '.gitignore') contents includesSubstring: 'output/').
	self assert: ((folder / '.project') contents includesSubstring:
			 '''srcDirectory'' : ''src''').
	self assert:
		((folder / 'src' / '.properties') contents includesSubstring:
			 '#tonel').
	self assert: (folder / 'data') isDirectory.
	self assert: (folder / 'output') isDirectory
]

{ #category : 'tests - files' }
CMModelTemplateTest >> testWrittenFolderIsAModel [

	| modelFolder |
	self template writeTo: folder.
	modelFolder := CMModelFolder
		               in:
		               (CMWorkspace createAt: FileSystem memory / 'Cormas')
		               at: folder.
	self assert: modelFolder baselineName equals: 'ForestFire'.
	self assert: modelFolder summary equals: 'Trees grow and burn'
]

{ #category : 'tests' }
CMModelTemplateTest >> testWrittenFolderIsMadeWithThisCormas [

	| modelFolder |
	self template writeTo: folder.
	modelFolder := CMModelFolder
		               in:
		               (CMWorkspace createAt: FileSystem memory / 'Cormas')
		               at: folder.
	self
		assert: modelFolder madeWith majorMinorString
		equals: CMVersion current majorMinorString
]
