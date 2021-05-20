Class {
	#name : #CMProbesDataUpdatedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'timeStep'
	],
	#category : #'Cormas-UI-Announcements'
}

{ #category : #'instance creation' }
CMProbesDataUpdatedAnnouncement class >> timeStep: t [
	^ self new
		timeStep: t;
		yourself
]

{ #category : #accessing }
CMProbesDataUpdatedAnnouncement >> timeStep [
	^ timeStep
]

{ #category : #accessing }
CMProbesDataUpdatedAnnouncement >> timeStep: anObject [
	timeStep := anObject
]
