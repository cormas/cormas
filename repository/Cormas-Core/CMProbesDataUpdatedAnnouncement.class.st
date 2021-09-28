Class {
	#name : #CMProbesDataUpdatedAnnouncement,
	#superclass : #CMTimeAnnouncement,
	#category : #'Cormas-Core-Announcements'
}

{ #category : #'instance creation' }
CMProbesDataUpdatedAnnouncement class >> timeStep: t [
	^ self new
		timeStep: t;
		yourself
]
