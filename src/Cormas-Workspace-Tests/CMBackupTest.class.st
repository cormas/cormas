"
I test how `CMWorkspace` backs up a folder as a zip in its `Backups` folder: the zip holds everything, restores by unzipping, and never replaces another backup.

I work in a memory file system, so I never touch the disk.
"
Class {
	#name : 'CMBackupTest',
	#superclass : 'TestCase',
	#instVars : [
		'workspace',
		'forest'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'tests' }
CMBackupTest >> editOldVersionMakingANewModel: aBoolean [
	"Edit Forest as if it were an old version, and answer whether to make a new model from it with aBoolean. Return the installed model"

	| model |
	model := CMInstalledModel
		         in: workspace
		         baselineName: 'Forest'
		         folder: forest.
	[ workspace editOldVersion: model ]
		on: CMOldVersionEdited
		do: [ :each | each resume: aBoolean ].
	^ model
]

{ #category : 'helpers' }
CMBackupTest >> migrateAnswering: aBoolean [
	"Migrate Forest, made with Cormas 0.9, to Cormas 1.0 and answer the question with aBoolean. Return the question"

	| question |
	forest / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "Forest", "cormas": "0.9" }' ].
	[
		workspace
			migrate:
			(CMInstalledModel
				 in: workspace
				 baselineName: 'Forest'
				 folder: forest)
			to: (CMVersion fromString: '1.0.0') ]
		on: CMMigrationAsked
		do: [ :each |
				question := each.
				each resume: aBoolean ].
	^ question
]

{ #category : 'running' }
CMBackupTest >> setUp [

	super setUp.
	workspace := CMWorkspace createAt: FileSystem memory / 'Cormas'.
	forest := workspace modelsFolder / 'Forest'.
	(forest / '.git') ensureCreateDirectory.
	forest / '.git' / 'config' writeStreamDo: [ :stream |
		stream nextPutAll: '[core]' ].
	(forest / 'data') ensureCreateDirectory.
	forest / 'data' / 'map.csv' writeStreamDo: [ :stream |
		stream nextPutAll: '1,2,3' ].
	forest / 'cormas.json' writeStreamDo: [ :stream |
		stream nextPutAll: '{ "baseline": "Forest" }' ]
]

{ #category : 'tests' }
CMBackupTest >> testBackUpIsAZipInBackups [

	| zip |
	zip := workspace backUp: forest.
	self assert: zip parent equals: workspace backupsFolder.
	self assert: zip isFile.
	self assert: zip extension equals: 'zip'
]

{ #category : 'tests' }
CMBackupTest >> testBackUpIsNamedAfterTheFolderAndTheTime [

	| zip |
	zip := workspace backUp: forest.
	self assert: (zip basename matchesRegex:
			 'Forest \d\d\d\d-\d\d-\d\d \d\d-\d\d-\d\d\.zip')
]

{ #category : 'tests' }
CMBackupTest >> testBackUpLeavesTheFolderUntouched [

	workspace backUp: forest.
	self assert: (forest / 'data' / 'map.csv') contents equals: '1,2,3'.
	self
		assert: (forest children collect: [ :each | each basename ]) asSet
		equals: #( '.git' 'data' 'cormas.json' ) asSet
]

{ #category : 'tests' }
CMBackupTest >> testBackUpWhereNothingCanBeWrittenRaisesAnError [

	workspace backupsFolder writeStreamDo: [ :stream |
		stream nextPutAll: 'not a folder' ].
	self should: [ workspace backUp: forest ] raise: CMWorkspaceError
]

{ #category : 'tests' }
CMBackupTest >> testBackUpsNeverReplaceEachOther [

	| zips |
	zips := (1 to: 3) collect: [ :each | workspace backUp: forest ].
	self assert: zips asSet size equals: 3.
	self assert: workspace backupsFolder children size equals: 3
]

{ #category : 'tests' }
CMBackupTest >> testMigrationBacksUpTheFolderNamedAfterItsCormas [

	| backups |
	self migrateAnswering: true.
	backups := workspace backupsFolder children.
	self assert: backups size equals: 1.
	self assert:
		(backups first basename beginsWith: 'Forest (Cormas 0.9) ')
]

{ #category : 'tests' }
CMBackupTest >> testMigrationQuestionExplainsTheChange [

	self
		assert: (self migrateAnswering: true) messageText
		equals:
		'Forest was made with Cormas 0.9. Saving this change makes it a Cormas 1.0 model, which may no longer work in Cormas 0.9. Migrating first saves a copy of the 0.9 version in Backups. Not saving undoes the change: Forest stays a Cormas 0.9 model, which cannot be changed in this Cormas.'
]

{ #category : 'tests' }
CMBackupTest >> testNewModelFromAnOldVersionAnnouncesTheChange [

	| count |
	count := 0.
	workspace announcer
		when: CMWorkspaceChanged
		do: [ count := count + 1 ]
		for: self.
	self editOldVersionMakingANewModel: true.
	self assert: count equals: 1
]

{ #category : 'tests' }
CMBackupTest >> testNewModelFromAnOldVersionIsACopyWithoutGit [

	| model |
	model := self editOldVersionMakingANewModel: true.
	self
		assert: model folder
		equals: workspace modelsFolder / 'Forest copy'.
	self
		assert: (model folder / 'data' / 'map.csv') contents
		equals: '1,2,3'.
	self deny: (model folder / '.git') exists.
	self assert: (forest / '.git' / 'config') exists
]

{ #category : 'tests' }
CMBackupTest >> testOldVersionWithoutANewModelIsNotChanged [

	self
		should: [ self editOldVersionMakingANewModel: false ]
		raise: CMWorkspaceError.
	self deny: (workspace modelsFolder / 'Forest copy') exists
]

{ #category : 'tests' }
CMBackupTest >> testRefusedMigrationRaisesAnErrorAndBacksUpNothing [

	self should: [ self migrateAnswering: false ] raise: CMWorkspaceError.
	self deny: (workspace backupsFolder exists and: [
			 workspace backupsFolder hasChildren ])
]

{ #category : 'tests' }
CMBackupTest >> testUnzippedBackUpIsTheFolderWithAllItsFiles [

	| unzipped |
	unzipped := self unzip: (workspace backUp: forest).
	self
		assert: (unzipped children collect: [ :each | each basename ])
		equals: #( 'Forest' ).
	self
		assert: (unzipped / 'Forest' / '.git' / 'config') contents
		equals: '[core]'.
	self
		assert: (unzipped / 'Forest' / 'data' / 'map.csv') contents
		equals: '1,2,3'.
	self
		assert: (unzipped / 'Forest' / 'cormas.json') contents
		equals: '{ "baseline": "Forest" }'
]

{ #category : 'helpers' }
CMBackupTest >> unzip: aZipFile [

	| folder |
	folder := aZipFile fileSystem / 'Unzipped'.
	folder ensureCreateDirectory.
	(ZipArchive new readFrom: aZipFile) extractAllTo: folder.
	^ folder
]
