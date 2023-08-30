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

{ #category : #initialization }
CMSpRoassalPresenter >> initialize [
	super initialize.
	self script: [ :canvas | self renderIn: canvas ].
]

{ #category : #accessing }
CMSpRoassalPresenter >> projectAnnouncer [
	" Private - Answer the <Announcer> used by the receiver's project "
	
	^ self cormasModel projectAnnouncer
]

{ #category : #initialization }
CMSpRoassalPresenter >> renderIn: canvas [
	self subclassResponsibility
]

{ #category : #accessing }
CMSpRoassalPresenter >> spaceModel [
	" Answer the receiver's <CMSpaceModel> "

	^ self cormasModel spaceModel
]
