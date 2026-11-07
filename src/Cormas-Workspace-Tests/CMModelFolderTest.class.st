"
I test `CMModelFolder` and how `CMWorkspace` lists the folders in `Models` and `Examples`: which folders are models, what their `cormas.json` says, and the folders that are not models.

I work in a memory file system, so I never touch the disk.
"
Class {
	#name : 'CMModelFolderTest',
	#superclass : 'TestCase',
	#instVars : [
		'workspace'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMModelFolderTest >> folderNamed: aString [

	^ CMModelFolder in: workspace at: workspace modelsFolder / aString
]

{ #category : 'helpers' }
CMModelFolderTest >> folderNamed: aString in: aFolder withCormasJson: aJsonString [

	| folder |
	folder := aFolder / aString.
	folder ensureCreateDirectory.
	folder / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: aJsonString ].
	^ folder
]

{ #category : 'helpers' }
CMModelFolderTest >> folderNamed: aString withCormasJson: aJsonString [

	^ self
		  folderNamed: aString
		  in: workspace modelsFolder
		  withCormasJson: aJsonString
]

{ #category : 'running' }
CMModelFolderTest >> setUp [

	super setUp.
	workspace := CMWorkspace createAt: FileSystem memory / 'Cormas'
]

{ #category : 'tests' }
CMModelFolderTest >> testBaselineNameAndSummaryComeFromCormasJson [

	| folder |
	self
		folderNamed: 'Forest 2026'
		withCormasJson:
		'{ "baseline": "Forest", "summary": "Trees grow and burn" }'.
	folder := self folderNamed: 'Forest 2026'.
	self assert: folder baselineName equals: 'Forest'.
	self assert: folder summary equals: 'Trees grow and burn'.
	self assert: folder name equals: 'Forest 2026'
]

{ #category : 'tests' }
CMModelFolderTest >> testCormasJsonThatIsNotAnObjectRaisesAnError [

	self folderNamed: 'Forest' withCormasJson: '[ "Forest" ]'.
	self
		should: [ (self folderNamed: 'Forest') baselineName ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMModelFolderTest >> testCormasJsonThatIsNotJsonRaisesAnError [

	self folderNamed: 'Forest' withCormasJson: 'baseline: Forest'.
	self
		should: [ (self folderNamed: 'Forest') baselineName ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMModelFolderTest >> testCormasJsonWithoutBaselineRaisesAnError [

	self folderNamed: 'Forest' withCormasJson: '{ "summary": "Trees" }'.
	self
		should: [ (self folderNamed: 'Forest') baselineName ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMModelFolderTest >> testFolderWithCormasJsonIsAModel [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	(workspace modelsFolder / 'Untitled folder') ensureCreateDirectory.
	self assert: (self folderNamed: 'Forest') isModel.
	self deny: (self folderNamed: 'Untitled folder') isModel
]

{ #category : 'tests' }
CMModelFolderTest >> testFoldersAreTheFoldersInModelsAndExamples [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	(workspace modelsFolder / 'Untitled folder') ensureCreateDirectory.
	self
		folderNamed: 'Firefighters'
		in: workspace examplesFolder
		withCormasJson: '{ "baseline": "Firefighters" }'.
	self
		assert: (workspace folders collect: [ :each | each name ]) asSet
		equals: #( 'Forest' 'Untitled folder' 'Firefighters' ) asSet
]

{ #category : 'tests' }
CMModelFolderTest >> testFoldersDoNotIncludeFoldersInsideModels [

	self
		folderNamed: 'data'
		in: workspace modelsFolder / 'Forest'
		withCormasJson: '{ "baseline": "Data" }'.
	self
		assert: (workspace folders collect: [ :each | each name ]) asArray
		equals: #( 'Forest' )
]

{ #category : 'tests' }
CMModelFolderTest >> testFoldersIgnoreFilesAndHiddenFolders [

	workspace modelsFolder / 'notes.txt' writeStreamDo: [ :stream |
		stream nextPutAll: 'notes' ].
	(workspace modelsFolder / '.Trash') ensureCreateDirectory.
	self assert: workspace folders isEmpty
]

{ #category : 'tests' }
CMModelFolderTest >> testFoldersWithoutExamplesFolder [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	self deny: workspace examplesFolder exists.
	self assert: workspace folders size equals: 1
]

{ #category : 'tests' }
CMModelFolderTest >> testIsExample [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	self
		folderNamed: 'Firefighters'
		in: workspace examplesFolder
		withCormasJson: '{ "baseline": "Firefighters" }'.
	self
		assert:
			((workspace folders select: [ :each | each isExample ]) collect: [
				 :each | each name ]) asArray
		equals: #( 'Firefighters' )
]

{ #category : 'tests' }
CMModelFolderTest >> testMadeWithComesFromCormasJson [

	| madeWith |
	self
		folderNamed: 'Forest'
		withCormasJson: '{ "baseline": "Forest", "cormas": "1.2-dev" }'.
	madeWith := (self folderNamed: 'Forest') madeWith.
	self assert: madeWith major equals: 1.
	self assert: madeWith minor equals: 2.
	self assert: madeWith isDev
]

{ #category : 'tests' }
CMModelFolderTest >> testMadeWithIsNilWhenCormasJsonHasNone [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	self assert: (self folderNamed: 'Forest') madeWith isNil
]

{ #category : 'tests' }
CMModelFolderTest >> testMadeWithThatIsNotAVersionRaisesAnError [

	self
		folderNamed: 'Forest'
		withCormasJson: '{ "baseline": "Forest", "cormas": "recent" }'.
	self
		should: [ (self folderNamed: 'Forest') madeWith ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMModelFolderTest >> testModelOneLevelDown [

	self
		folderNamed: 'Forest'
		in: workspace modelsFolder / 'Forest'
		withCormasJson: '{ "baseline": "Forest" }'.
	self deny: (self folderNamed: 'Forest') isModel.
	self assert: (self folderNamed: 'Forest') hasModelOneLevelDown
]

{ #category : 'tests' }
CMModelFolderTest >> testNoModelOneLevelDownInAModel [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	self
		folderNamed: 'src'
		in: workspace modelsFolder / 'Forest'
		withCormasJson: '{ "baseline": "Other" }'.
	self deny: (self folderNamed: 'Forest') hasModelOneLevelDown
]

{ #category : 'tests' }
CMModelFolderTest >> testNoModelOneLevelDownWhenTheInnerFolderIsNotAlone [

	self
		folderNamed: 'Forest'
		in: workspace modelsFolder / 'Downloads'
		withCormasJson: '{ "baseline": "Forest" }'.
	(workspace modelsFolder / 'Downloads' / 'Other')
		ensureCreateDirectory.
	self deny: (self folderNamed: 'Downloads') hasModelOneLevelDown
]

{ #category : 'tests' }
CMModelFolderTest >> testRecordMadeWithInAnotherMajorChangesNothing [

	| folder |
	self
		folderNamed: 'Forest'
		withCormasJson: '{ "baseline": "Forest", "cormas": "1.0" }'.
	folder := self folderNamed: 'Forest'.
	folder recordMadeWith: (CMVersion fromString: '2.0.0').
	self assert: folder madeWith printString equals: '1.0.0'
]

{ #category : 'tests' }
CMModelFolderTest >> testRecordMadeWithInTheSameMajorReplacesIt [

	| folder |
	self
		folderNamed: 'Forest'
		withCormasJson: '{ "baseline": "Forest", "cormas": "1.0-dev" }'.
	folder := self folderNamed: 'Forest'.
	folder recordMadeWith: (CMVersion fromString: '1.2.0').
	self assert: folder madeWith printString equals: '1.2.0'
]

{ #category : 'tests' }
CMModelFolderTest >> testRecordMadeWithKeepsTheOtherFields [

	| folder |
	self
		folderNamed: 'Forest'
		withCormasJson:
		'{ "license": "MIT", "summary": "Trees", "baseline": "Forest", "cormas": "1.0" }'.
	folder := self folderNamed: 'Forest'.
	folder recordMadeWith: (CMVersion fromString: '1.1.0').
	self assert: folder baselineName equals: 'Forest'.
	self assert: folder summary equals: 'Trees'.
	self assert: (folder metadata at: 'license') equals: 'MIT'
]

{ #category : 'tests' }
CMModelFolderTest >> testRecordMadeWithWhenNoneIsRecorded [

	| folder |
	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	folder := self folderNamed: 'Forest'.
	folder recordMadeWith: (CMVersion fromString: '2.1.0').
	self assert: folder madeWith printString equals: '2.1.0'
]

{ #category : 'tests' }
CMModelFolderTest >> testSummaryIsEmptyWhenCormasJsonHasNone [

	self folderNamed: 'Forest' withCormasJson: '{ "baseline": "Forest" }'.
	self assert: (self folderNamed: 'Forest') summary equals: ''
]
