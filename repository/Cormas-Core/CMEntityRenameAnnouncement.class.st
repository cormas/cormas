Class {
	#name : #CMEntityRenameAnnouncement,
	#superclass : #CMEntityAnnouncement,
	#instVars : [
		'oldName'
	],
	#category : #'Cormas-Core-Announcements'
}

{ #category : #accessing }
CMEntityRenameAnnouncement >> oldName [
	^ oldName
]

{ #category : #accessing }
CMEntityRenameAnnouncement >> oldName: aString [ 

	oldName := aString
]
