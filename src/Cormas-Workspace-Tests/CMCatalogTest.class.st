"
I test how `CMCatalog` mirrors the catalog of example models into the Catalog folder of a workspace, with `CMCatalogMock` serving the files and a memory file system.
"
Class {
	#name : 'CMCatalogTest',
	#superclass : 'TestCase',
	#instVars : [
		'folder',
		'catalog'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMCatalogTest >> catalogJsonOf: screenshots [

	^ STONJSON toString: (Dictionary new
			   at: 'models' put: (screenshots collect: [ :each |
							    Dictionary new
								    at: 'baseline' put: each key;
								    at: 'summary' put: 'A model';
								    at: 'url' put: 'https://github.com/cormas/' , each key;
								    at: 'screenshot' put: 'screenshots/' , each key , '.png';
								    at: 'screenshotHash'
								    put: (SHA256 hashMessage: each value) hex;
								    yourself ]) asArray;
			   yourself)
]

{ #category : 'helpers' }
CMCatalogTest >> screenshotNames [

	^ (folder / 'screenshots') children collect: [ :each | each basename ]
]

{ #category : 'helpers' }
CMCatalogTest >> serve: screenshots [
	"Serve a catalog listing a model for each baseline -> screenshot bytes of screenshots, and those screenshots"

	self serve: screenshots json: (self catalogJsonOf: screenshots)
]

{ #category : 'helpers' }
CMCatalogTest >> serve: screenshots json: aString [

	| files |
	files := Dictionary new.
	files at: 'catalog.json' put: aString utf8Encoded.
	screenshots do: [ :each |
		files at: 'screenshots/' , each key , '.png' put: each value ].
	catalog files: files
]

{ #category : 'running' }
CMCatalogTest >> setUp [

	super setUp.
	folder := FileSystem memory root / 'Catalog'.
	catalog := CMCatalogMock in: folder
]

{ #category : 'tests' }
CMCatalogTest >> testCatalogThatIsNotJsonIsRefused [

	self serve: {  } json: '{ not json'.
	self
		should: [ catalog update ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'The catalog is not valid') ].
	self deny: (folder / 'catalog.json') exists
]

{ #category : 'tests' }
CMCatalogTest >> testFailedUpdateKeepsThePreviousCatalog [

	| previous |
	self serve: { ('Fire' -> #[ 1 2 3 ]) }.
	catalog update.
	previous := (folder / 'catalog.json') contents.
	self serve: { ('River' -> #[ 4 5 ]) }.
	catalog files removeKey: 'screenshots/River.png'.
	self should: [ catalog update ] raise: CMWorkspaceError.
	self assert: (folder / 'catalog.json') contents equals: previous.
	self assert: self screenshotNames asArray equals: #( 'Fire.png' )
]

{ #category : 'tests' }
CMCatalogTest >> testScreenshotOutsideTheCatalogFolderIsRefused [

	| json |
	json := (self catalogJsonOf: { ('Fire' -> #[ 1 ]) })
		        copyReplaceAll: 'screenshots/Fire.png'
		        with: '../Fire.png'.
	self serve: { ('Fire' -> #[ 1 ]) } json: json.
	catalog files at: '../Fire.png' put: #[ 1 ].
	self
		should: [ catalog update ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'The catalog is not valid') ].
	self deny: (folder parent / 'Fire.png') exists
]

{ #category : 'tests' }
CMCatalogTest >> testScreenshotWithAnotherHashIsRefused [

	self serve: { ('Fire' -> #[ 1 2 3 ]) }.
	catalog files at: 'screenshots/Fire.png' put: #[ 0 ].
	self
		should: [ catalog update ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'screenshots/Fire.png was not downloaded correctly') ].
	self deny: (folder / 'catalog.json') exists
]

{ #category : 'tests' }
CMCatalogTest >> testUpdateDeletesTheScreenshotsNoLongerListed [

	self serve: {
			('Fire' -> #[ 1 2 3 ]).
			('River' -> #[ 4 5 ]) }.
	catalog update.
	self serve: { ('River' -> #[ 4 5 ]) }.
	catalog update.
	self assert: self screenshotNames asArray equals: #( 'River.png' )
]

{ #category : 'tests' }
CMCatalogTest >> testUpdateDownloadsOnlyTheScreenshotsThatChanged [

	self serve: {
			('Fire' -> #[ 1 2 3 ]).
			('River' -> #[ 4 5 ]) }.
	catalog update.
	self serve: {
			('Fire' -> #[ 9 ]).
			('River' -> #[ 4 5 ]) }.
	catalog update.
	self assert: catalog downloads equals: 2.
	self
		assert:
		(folder / 'screenshots' / 'Fire.png') binaryReadStream upToEnd
		equals: #[ 9 ]
]

{ #category : 'tests' }
CMCatalogTest >> testUpdateDownloadsTheCatalogAndItsScreenshots [

	self serve: {
			('Fire' -> #[ 1 2 3 ]).
			('River' -> #[ 4 5 ]) }.
	catalog update.
	self
		assert: (folder / 'catalog.json') contents
		equals: (self catalogJsonOf: {
					 ('Fire' -> #[ 1 2 3 ]).
					 ('River' -> #[ 4 5 ]) }).
	self
		assert:
		(folder / 'screenshots' / 'River.png') binaryReadStream upToEnd
		equals: #[ 4 5 ].
	self
		assert: self screenshotNames asSet
		equals: #( 'Fire.png' 'River.png' ) asSet
]
