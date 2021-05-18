Class {
	#name : #CMFinalStepChangedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'finalStep'
	],
	#category : #'Cormas-UI-Announcements'
}

{ #category : #accessing }
CMFinalStepChangedAnnouncement >> finalStep [
	^ finalStep
]

{ #category : #accessing }
CMFinalStepChangedAnnouncement >> finalStep: anObject [
	finalStep := anObject
]
