Class {
	#name : #CMSpRoassalPresenter,
	#superclass : #SpRoassalPresenter,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-UI-Roassal3-Core'
}

{ #category : #accessing }
CMSpRoassalPresenter >> cormasModel [
	" Answer the receiver's <CMAbstractModel> "

	^ self owner cormasModel
]

{ #category : #accessing }
CMSpRoassalPresenter >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #accessing }
CMSpRoassalPresenter >> projectAnnouncer [
	" Private - Answer the <Announcer> used by the receiver's project "
	
	^ self cormasModel projectAnnouncer
]

{ #category : #accessing }
CMSpRoassalPresenter >> spaceModel [
	" Answer the receiver's <CMSpaceModel> "

	^ self cormasModel spaceModel
]
