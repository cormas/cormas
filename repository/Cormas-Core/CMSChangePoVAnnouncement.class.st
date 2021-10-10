Class {
	#name : #CMSChangePoVAnnouncement,
	#superclass : #CMAnnouncement,
	#instVars : [
		'povDictionary'
	],
	#category : #'Cormas-Core-Announcements'
}

{ #category : #'instance creation' }
CMSChangePoVAnnouncement class >> forPov: aSymbol ofEntity: aClass [
	
	^ self new
		atEntityClass: aClass putPoV: aSymbol;
		yourself
]

{ #category : #'instance creation' }
CMSChangePoVAnnouncement class >> forPovs: aCollectionOfAssociations [
	
	^ self new
		povDictionary: aCollectionOfAssociations;
		yourself
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> atEntityClass: aClass putPoV: aSymbol [

	self povDictionary at: aClass put: aSymbol
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> povDictionary [

	^ povDictionary
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> povDictionary: anObject [

	povDictionary := anObject
]
