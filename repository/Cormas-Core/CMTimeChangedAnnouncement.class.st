Class {
	#name : #CMTimeChangedAnnouncement,
	#superclass : #CMAnnouncement,
	#instVars : [
		'timeStep'
	],
	#category : #'Cormas-Core-Announcements'
}

{ #category : #'instance creation' }
CMTimeChangedAnnouncement class >> timeStep: t [

^self new timeStep: t ; yourself 
]

{ #category : #accessing }
CMTimeChangedAnnouncement >> timeStep [
	" Answer a positive <Number> representing the receiver's current time step "
	^ timeStep
]

{ #category : #accessing }
CMTimeChangedAnnouncement >> timeStep: anObject [
	timeStep := anObject
]
