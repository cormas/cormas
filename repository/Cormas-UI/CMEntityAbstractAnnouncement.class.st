Class {
	#name : #CMEntityAbstractAnnouncement,
	#superclass : #CMEntityAnnouncement,
	#instVars : [
		'abstract'
	],
	#category : #'Cormas-UI-Announcements'
}

{ #category : #accessing }
CMEntityAbstractAnnouncement >> beAbstract [

	abstract := true
]

{ #category : #accessing }
CMEntityAbstractAnnouncement >> beConcrete [

	abstract := false
]

{ #category : #testing }
CMEntityAbstractAnnouncement >> isAbstract [

	^ abstract
]
