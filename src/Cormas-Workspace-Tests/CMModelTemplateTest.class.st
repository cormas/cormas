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

{ #category : 'tests - files' }
CMModelTemplateTest >> template [

	^ (CMModelTemplate named: 'Forest fire') description:
		  'Trees grow and burn'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testBasenameDropsModelAtTheEnd [

	self
		assert: (CMModelTemplate named: 'Forest Model') basename
		equals: 'Forest'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testBasenameIsTheNameInCamelCase [

	self
		assert: (CMModelTemplate named: 'Forest fire') basename
		equals: 'ForestFire'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testNameThatGivesNoClassNameRaisesAnError [

	#( '' '   ' '3 forests' 'Forest/fire' ) do: [ :each |
		self should: [ CMModelTemplate named: each ] raise: CMWorkspaceError ]
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testNamesOfPackagesAndClasses [

	| template |
	template := CMModelTemplate named: 'Forest fire'.
	self assert: template baselineName equals: 'ForestFire'.
	self assert: template modelPackageName equals: 'ForestFire-Model'.
	self assert: template testPackageName equals: 'ForestFire-Tests'.
	self assert: template modelClassName equals: 'FFModel'.
	self assert: template cellClassName equals: 'FFCell'.
	self assert: template testClassName equals: 'FFModelTest'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testPrefixCanBeChosen [

	| template |
	template := (CMModelTemplate named: 'Forest fire') prefix: 'FOR'.
	self assert: template modelClassName equals: 'FORModel'.
	self assert: template cellClassName equals: 'FORCell'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testPrefixIsTheCapitalLettersOfTheBasename [

	self
		assert: (CMModelTemplate named: 'Forest fire') prefix
		equals: 'FF'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testPrefixOfASingleWordIsItsFirstThreeLetters [

	self assert: (CMModelTemplate named: 'Forest') prefix equals: 'For'
]

{ #category : 'tests - names' }
CMModelTemplateTest >> testPrefixThatIsNotACapitalizedWordRaisesAnError [

	#( '' 'ff' 'F F' '3F' ) do: [ :each |
			self
				should: [ (CMModelTemplate named: 'Forest fire') prefix: each ]
				raise: CMWorkspaceError ]
]

{ #category : 'tests - files' }
CMModelTemplateTest >> testWrittenFolderHoldsTheCodeOfTheModel [

	| src |
	self template writeTo: folder.
	src := folder / 'src'.
	self assert:
		((src / 'ForestFire-Model' / 'FFModel.class.st') contents
			 includesSubstring: '#superclass : ''CMModel''').
	self assert:
		((src / 'ForestFire-Model' / 'FFModel.class.st') contents
			 includesSubstring: '^ ''Forest fire''').
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

{ #category : 'tests - files' }
CMModelTemplateTest >> testWrittenFolderHoldsWhatAModelFolderHolds [

	self template writeTo: folder.
	self assert:
		((folder / 'README.md') contents includesSubstring: '# Forest fire').
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
