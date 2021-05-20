"
Provides methods for comparing CORMAS projects and tracking changes.
This class can receive a model name, and compare an image version against a version stored in disk, and then can answer if the image version was modified.

Public API and Key Messages

- compare:with:   

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

"
Class {
	#name : #CMProjectTracker,
	#superclass : #CMObject,
	#instVars : [
		'codeChunks',
		'trackTests'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMProjectTracker >> codeChunks [

	^ codeChunks
]

{ #category : #accessing }
CMProjectTracker >> codeChunks: anObject [

	codeChunks := anObject
]

{ #category : #comparison }
CMProjectTracker >> equalToCurrent: aCollection [
	" Answer <true> if the receiver's chunks containing CORMAS source code and source code in aCollection are equal "
	| currentChunks |
	
	currentChunks := aCollection gather: [ : aCormasModelClass | ChunkFileFormatParser methodChunksFrom: aCormasModelClass ].
	^ self codeChunks = currentChunks asSortedCollection
]

{ #category : #initialization }
CMProjectTracker >> initialize [

	super initialize.
	self trackTests: true.
]

{ #category : #initialization }
CMProjectTracker >> track: aStream [
	" Private - Configure the receiver with code in aStream containing CORMAS source code "

	self codeChunks: (CodeImporter methodChunksFromStream: aStream).
	self trackTests 
		ifFalse: [ self codeChunks: (self codeChunks reject: #isTest) ]
]

{ #category : #accessing }
CMProjectTracker >> trackTests [

	^ trackTests
]

{ #category : #accessing }
CMProjectTracker >> trackTests: anObject [

	trackTests := anObject
]
