Class {
	#name : #CMExternalBrowser,
	#superclass : #ExternalBrowser,
	#category : #'Cormas-UI-Project-Spec1'
}

{ #category : #'instance creation' }
CMExternalBrowser class >> on: aFileReferene [
	" Answer a new instance of the receiver for CORMAS project source code in aFileReference "
	
	^ self basicNew
		initializeWithModel: (CMProjectOpener new tryReadSourceFromFile: aFileReferene);
		yourself
]

{ #category : #initialization }
CMExternalBrowser >> initializeWithModel: aReadStream [
	" Private - Initialize the receiver's model with source code contained in aReadStream "
	
	self
		initializePrivateAnnouncer;
		initializePrivateValueHolders.
	self model: (RingChunkImporter fromStream: aReadStream).
	self 
		initializePrivateHooks;
		initializePrivateAnnouncements.
]
