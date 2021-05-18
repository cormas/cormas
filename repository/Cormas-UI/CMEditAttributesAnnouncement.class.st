Class {
	#name : #CMEditAttributesAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'targetClass'
	],
	#category : #'Cormas-UI-Announcements'
}

{ #category : #accessing }
CMEditAttributesAnnouncement >> targetClass [
	^ targetClass
]

{ #category : #accessing }
CMEditAttributesAnnouncement >> targetClass: anObject [
	targetClass := anObject
]
