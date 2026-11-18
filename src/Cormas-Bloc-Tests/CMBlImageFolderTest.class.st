Class {
	#name : 'CMBlImageFolderTest',
	#superclass : 'TestCase',
	#instVars : [
		'directory'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'running' }
CMBlImageFolderTest >> colorOf: aForm [

	^ (aForm colorAt: 1 @ 1) asHexString
]

{ #category : 'running' }
CMBlImageFolderTest >> setUp [

	super setUp.
	directory := FileSystem memory root / 'images'.
	directory ensureCreateDirectory
]

{ #category : 'tests' }
CMBlImageFolderTest >> testAFileIsReadOnlyOnce [

	| folder form |
	self write: Color red extent: 4 @ 4 to: 'grass.png'.
	folder := CMBlImageFolder on: directory.
	form := folder formNamed: 'grass'.
	self write: Color blue extent: 4 @ 4 to: 'grass.png'.
	self assert: (folder formNamed: 'grass') identicalTo: form.
	self
		assert: (self colorOf: (folder formNamed: 'grass'))
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlImageFolderTest >> testAMissingFolderRaisesTheSameError [

	self
		should: [
		(CMBlImageFolder on: directory / 'nowhere') formNamed: 'grass' ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: '''grass''') ]
]

{ #category : 'tests' }
CMBlImageFolderTest >> testAMissingImageRaisesAnErrorNamingItAndTheFolder [

	self write: Color red extent: 4 @ 4 to: 'grass.png'.
	self
		should: [ (CMBlImageFolder on: directory) formNamed: 'gras' ]
		raise: Error
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring: '''gras''').
				self assert:
					(error messageText includesSubstring: directory fullName) ]
]

{ #category : 'tests' }
CMBlImageFolderTest >> testFindsAnImageByTheNameOfItsFile [

	| form |
	self write: Color red extent: 4 @ 2 to: 'tall-grass.png'.
	self write: Color blue extent: 4 @ 2 to: 'tree.png'.
	form := (CMBlImageFolder on: directory) formNamed: 'tall-grass'.
	self assert: form extent equals: 4 @ 2.
	self assert: (self colorOf: form) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlImageFolderTest >> testFindsJpegFilesWhateverTheCaseOfTheirExtension [

	| folder |
	self write: Color blue extent: 4 @ 4 to: 'water.JPG'.
	self write: Color blue extent: 4 @ 4 to: 'sand.jpeg'.
	folder := CMBlImageFolder on: directory.
	self assert: (folder formNamed: 'water') extent equals: 4 @ 4.
	self assert: (folder formNamed: 'sand') extent equals: 4 @ 4
]

{ #category : 'tests' }
CMBlImageFolderTest >> testTwoFilesWithTheSameNameRaiseAnError [

	self write: Color red extent: 4 @ 4 to: 'grass.png'.
	self write: Color green extent: 4 @ 4 to: 'grass.jpg'.
	self
		should: [ (CMBlImageFolder on: directory) formNamed: 'grass' ]
		raise: Error
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring: 'grass.png').
				self assert: (error messageText includesSubstring: 'grass.jpg') ]
]

{ #category : 'running' }
CMBlImageFolderTest >> write: aColor extent: aPoint to: aFileName [

	| form |
	form := Form extent: aPoint depth: 32.
	form fillColor: aColor.
	directory / aFileName binaryWriteStreamDo: [ :stream |
			(aFileName asLowercase endsWith: '.png')
				ifTrue: [ PNGReadWriter putForm: form onStream: stream ]
				ifFalse: [
				PluginBasedJPEGReadWriter putForm: form onStream: stream ] ]
]
