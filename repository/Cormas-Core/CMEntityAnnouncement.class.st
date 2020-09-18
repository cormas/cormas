"
This hierarchy implements announcements related with the CORMAS Entities Browser

"
Class {
	#name : #CMEntityAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'entityName',
		'type',
		'superclass'
	],
	#category : #'Cormas-Core-Announcement'
}

{ #category : #'instance creation' }
CMEntityAnnouncement class >> named: aString [

	^ self new
		entityName: aString;
		yourself.
]

{ #category : #'instance creation' }
CMEntityAnnouncement class >> named: aString type: entityTypeString [

	^ self new
		entityName: aString;
		type: entityTypeString;
		yourself.
]

{ #category : #'instance creation' }
CMEntityAnnouncement class >> named: aString type: entityTypeString superclass: entitySuperclass [

	^ self new
		entityName: aString;
		type: entityTypeString;
		superclass: entitySuperclass;
		yourself.
]

{ #category : #accessing }
CMEntityAnnouncement >> entityName [
	^ entityName
]

{ #category : #accessing }
CMEntityAnnouncement >> entityName: anObject [
	entityName := anObject
]

{ #category : #accessing }
CMEntityAnnouncement >> superclass [
	^ superclass
]

{ #category : #accessing }
CMEntityAnnouncement >> superclass: anObject [
	superclass := anObject
]

{ #category : #accessing }
CMEntityAnnouncement >> type [
	^ type
]

{ #category : #accessing }
CMEntityAnnouncement >> type: anObject [
	type := anObject
]
