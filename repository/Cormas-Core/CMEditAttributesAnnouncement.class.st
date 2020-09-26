Class {
	#name : #CMEditAttributesAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'targetClass'
	],
	#category : #'Cormas-Core-Announcement'
}

{ #category : #accessing }
CMEditAttributesAnnouncement >> targetClass [
	^ targetClass
]

{ #category : #accessing }
CMEditAttributesAnnouncement >> targetClass: anObject [
	targetClass := anObject
]
