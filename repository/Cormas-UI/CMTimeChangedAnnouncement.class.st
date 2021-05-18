Class {
	#name : #CMTimeChangedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'timeStep'
	],
	#category : #'Cormas-UI-Announcements'
}

{ #category : #'instance creation' }
CMTimeChangedAnnouncement class >> timeStep: t [

^self new timeStep: t ; yourself 
]

{ #category : #accessing }
CMTimeChangedAnnouncement >> timeStep [
	^ timeStep
]

{ #category : #accessing }
CMTimeChangedAnnouncement >> timeStep: anObject [
	timeStep := anObject
]
