Class {
	#name : #CMTimeAnnouncement,
	#superclass : #CMAnnouncement,
	#instVars : [
		'timeStep'
	],
	#category : #'Cormas-Core-Announcements'
}

{ #category : #accessing }
CMTimeAnnouncement >> timeStep [
	" Answer a positive <Number> representing the receiver's current time step "
	^ timeStep
]

{ #category : #accessing }
CMTimeAnnouncement >> timeStep: anObject [
	timeStep := anObject
]
