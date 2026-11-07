"
I am a catalog that downloads from a dictionary instead of the internet, so that tests run fast and offline. I count my downloads.

```smalltalk
(CMCatalogMock in: FileSystem memory root)
	files: { 'catalog.json' -> '{ ""models"" : [ ] }' asByteArray } asDictionary;
	update
```

A path missing from my files fails like an unreachable server.
"
Class {
	#name : 'CMCatalogMock',
	#superclass : 'CMCatalog',
	#instVars : [
		'files',
		'downloads'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'private' }
CMCatalogMock >> download: aPath [

	downloads := downloads + 1.
	^ files at: aPath ifAbsent: [
			  CMWorkspaceError signal:
				  'Cormas cannot download the catalog (' , aPath , ' not found)' ]
]

{ #category : 'accessing' }
CMCatalogMock >> downloads [

	^ downloads
]

{ #category : 'accessing' }
CMCatalogMock >> files [

	^ files
]

{ #category : 'accessing' }
CMCatalogMock >> files: aDictionary [

	files := aDictionary.
	downloads := 0
]
