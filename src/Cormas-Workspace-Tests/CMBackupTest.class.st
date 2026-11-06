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
