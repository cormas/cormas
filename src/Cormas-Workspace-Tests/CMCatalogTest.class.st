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
CMCatalogTest >> catalogFor: aVersionString serving: models [

	| other |
	other := CMCatalogMock
		         in: folder
		         for: (CMVersion fromString: aVersionString).
	other files: (Dictionary new
			 at: 'catalog.json' put: (STONJSON toString: (Dictionary new
							   at: 'format' put: 1;
							   at: 'models' put: models;
							   yourself)) utf8Encoded;
			 at: 'screenshots/Fire.png' put: #[ 1 ];
			 yourself).
	other update.
	^ other
]

{ #category : 'helpers' }
CMCatalogTest >> catalogJsonOf: screenshots [

	^ STONJSON toString: (Dictionary new
			   at: 'format' put: 1;
			   at: 'models' put: (screenshots collect: [ :each |
							    self
								    modelNamed: each key
								    screenshot: each value
								    madeWith: #( '1.0-dev' ) ]) asArray;
			   yourself)
]

{ #category : 'helpers' }
CMCatalogTest >> modelNamed: aBaseline screenshot: bytes madeWith: versions [
	"Return a model of a catalog with a version made with each of versions, in that order"

	^ Dictionary new
		  at: 'baseline' put: aBaseline;
		  at: 'summary' put: 'A model';
		  at: 'screenshot' put: 'screenshots/' , aBaseline , '.png';
		  at: 'screenshotHash' put: (SHA256 hashMessage: bytes) hex;
		  at: 'versions' put: (versions withIndexCollect: [ :each :index |
						   Dictionary new
							   at: 'url' put: 'https://github.com/cormas/' , aBaseline;
							   at: 'ref' put: 'v' , index printString;
							   at: 'commit' put: 'c' , index printString;
							   at: 'cormas' put: each;
							   yourself ]) asArray;
		  yourself
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
CMCatalogTest >> testCatalogOfAnotherFormatIsRefused [

	self serve: {  } json: '{ "format": 2, "models": [] }'.
	self
		should: [ catalog update ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'format 2') ].
	self deny: (folder / 'catalog.json') exists
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
CMCatalogTest >> testFilesAreReadFromTheLineOfThisCormas [

	self
		assert:
			((CMCatalog in: folder for: (CMVersion fromString: '1.0.0-dev'))
				 urlOf: 'catalog.json')
		equals:
		'https://raw.githubusercontent.com/cormas/example-catalog/main/versions/dev/catalog.json'.
	self
		assert:
			((CMCatalog in: folder for: (CMVersion fromString: '2.3.1'))
				 urlOf: 'screenshots/Fire.png')
		equals:
		'https://raw.githubusercontent.com/cormas/example-catalog/main/versions/2/screenshots/Fire.png'
]

{ #category : 'tests' }
CMCatalogTest >> testListsOnlyTheCommitsOfVersionsMadeForThisCormas [

	| other |
	other := self catalogFor: '1.1.3' serving: { (self
			          modelNamed: 'Fire'
			          screenshot: #[ 1 ]
			          madeWith: #( '0.9' '1.1' '1.2' )) }.
	self assert: (other listsCommit: 'c1').
	self assert: (other listsCommit: 'c2').
	self deny: (other listsCommit: 'c3').
	self deny: (other listsCommit: 'unknown')
]

{ #category : 'tests' }
CMCatalogTest >> testModelWithoutAVersionForThisCormasIsNotListed [

	| other |
	other := self
		         catalogFor: '1.0.0'
		         serving:
		         { (self
			          modelNamed: 'Fire'
			          screenshot: #[ 1 ]
			          madeWith: #( '1.1' )) }.
	self assert: other models isEmpty
]

{ #category : 'tests' }
CMCatalogTest >> testOfferedVersionIsTheNewestMadeWithNoNewerCormas [

	| other |
	other := self catalogFor: '1.1.3' serving: { (self
			          modelNamed: 'Fire'
			          screenshot: #[ 1 ]
			          madeWith: #( '1.0' '1.1' '1.2' )) }.
	self
		assert: ((other offeredVersionOf: other models first) at: 'ref')
		equals: 'v2'
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

{ #category : 'tests' }
CMCatalogTest >> testVersionMadeWithADevCormasIsOfferedToItsRelease [

	| other |
	other := self
		         catalogFor: '1.0.0'
		         serving:
		         { (self
			          modelNamed: 'Fire'
			          screenshot: #[ 1 ]
			          madeWith: #( '1.0-dev' )) }.
	self
		assert: ((other offeredVersionOf: other models first) at: 'ref')
		equals: 'v1'
]
