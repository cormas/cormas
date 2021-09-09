Class {
	#name : #CMSChangePoVAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'povName',
		'entityClass'
	],
	#category : #'Cormas-Core-Announcements'
}

{ #category : #'instance creation' }
CMSChangePoVAnnouncement class >> forPov: aSymbol ofEntity: aClass [
	
	^ self new
		povName: aSymbol;
		entityClass: aClass;
		yourself
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> entityClass [

	^ entityClass
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> entityClass: anObject [

	entityClass := anObject
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> povName [

	^ povName
]

{ #category : #accessing }
CMSChangePoVAnnouncement >> povName: anObject [

	povName := anObject
]

{ #category : #printing }
CMSChangePoVAnnouncement >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		<< ' pov: ';
		<< povName asString;
		<< ' ofEntity: ';
		<< entityClass asString
]
