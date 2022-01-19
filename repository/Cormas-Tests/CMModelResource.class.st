Class {
	#name : #CMModelResource,
	#superclass : #TestResource,
	#instVars : [
		'modelPath'
	],
	#category : #'Cormas-Tests-Helpers'
}

{ #category : #running }
CMModelResource >> buildCormasAssetsHierarchy [
	" Build the skeleton for the assets directory in CORMAS for testing purposes "

	{ 
		{'common'} .
		{'icons'} .
		{'images'} .
		{'installer'} .
		{'logos'} .
		{ 'models' . self sampleModelName } } do: [ : d | 
  			d
				inject: self modelPath
				into: [ : acc : cmDir | (acc / cmDir) asFileReference ensureCreateDirectory ] ].
]

{ #category : #running }
CMModelResource >> buildCormasModelHierarchyFor: aModelName [
	" Answer a <Collection> with the subdirectories of a single CORMAS model "

	| baseModelDir |
	baseModelDir := self modelPath / 'models' / aModelName.
	self cormasModelHierarchy do: [ : d | 
  		d
			inject: baseModelDir
			into: [ : acc : cmDir | (acc / cmDir) asFileReference ensureCreateDirectory ] ].
]

{ #category : #running }
CMModelResource >> cormasModelHierarchy [
	" Answer a <Collection> of <String> with the folder hierarchy contained in a model "
	
	^ (CMProjectBuilder resourceDirectoryNames) collect: [ : each | { each } ]

]

{ #category : #accessing }
CMModelResource >> modelPath [

	^ modelPath
]

{ #category : #accessing }
CMModelResource >> modelPath: anObject [

	modelPath := anObject
]

{ #category : #running }
CMModelResource >> sampleModelName [

	^ 'MockModel'
]

{ #category : #running }
CMModelResource >> setUp [

	super setUp.
	self setUpPathReferences
]

{ #category : #running }
CMModelResource >> setUpPathReferences [
	" Create a sample directory structure for a mock model "

	self modelPath: FileSystem memory root / CMResourceLocator assetsFilesDirectoryName.
	self modelPath createDirectory.
	self 
		buildCormasAssetsHierarchy;
		buildCormasModelHierarchyFor: self sampleModelName.
	
]

{ #category : #running }
CMModelResource >> tearDown [

	[ self modelPath ensureDeleteAll ]
	on: FileDoesNotExistException
	do: [ : ex | ].	
	CMResourceLocator useGitBridge: true.
	super tearDown.
]
