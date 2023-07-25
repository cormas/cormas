Class {
	#name : #CMModelResource,
	#superclass : #TestResource,
	#instVars : [
		'assetsPath'
	],
	#category : #'Cormas-Tests-Fixtures'
}

{ #category : #accessing }
CMModelResource >> assetsPath [

	^ assetsPath
]

{ #category : #accessing }
CMModelResource >> assetsPath: anObject [

	assetsPath := anObject
]

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
				inject: self assetsPath
				into: [ : acc : cmDir | (acc / cmDir) asFileReference ensureCreateDirectory ] ].
]

{ #category : #running }
CMModelResource >> buildCormasModelHierarchy [
	" Answer a <Collection> with the subdirectories of a single CORMAS model "

	self cormasModelHierarchy do: [ : d | 
  		d
			inject: self modelPath
			into: [ : acc : cmDir | (acc / cmDir) asFileReference ensureCreateDirectory ] ].
]

{ #category : #running }
CMModelResource >> cormasModelHierarchy [
	" Answer a <Collection> of <String> with the folder hierarchy contained in a model "
	
	^ (CMGitBridge resourceDirectoryNames) collect: [ : each | { each } ]

]

{ #category : #running }
CMModelResource >> modelPath [

	^ self assetsPath / 'models' / self sampleModelName
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

	self assetsPath: CMGitBridge assetsPath.
	"self modelPath createDirectory."
	self 
		"buildCormasAssetsHierarchy;"
		buildCormasModelHierarchy.
	
]

{ #category : #running }
CMModelResource >> tearDown [

	[ self modelPath ensureDeleteAll ]
	on: FileDoesNotExistException
	do: [ : ex | ].	
	super tearDown.
]
