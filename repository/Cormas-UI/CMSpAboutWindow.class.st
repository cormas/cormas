Class {
	#name : #CMSpAboutWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'morphPresenter',
		'cormasClass'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMSpAboutWindow >> application [

	^ CMSpApplication new
]

{ #category : #accessing }
CMSpAboutWindow >> cormasClass [

	^ cormasClass
]

{ #category : #accessing }
CMSpAboutWindow >> cormasClass: anObject [

	cormasClass := anObject
]

{ #category : #initialization }
CMSpAboutWindow >> createTextMorph [

	^ RubEditingArea new
		updateTextWith: self parseMicrodownText;
		backgroundColor: Color veryLightGray;
		beForPlainText;
		readOnly: true;
		yourself
]

{ #category : #initialization }
CMSpAboutWindow >> initializePresenters [

	self layout: (SpUnstyledBoxLayout newLeftToRight
			 add: #morphPresenter;
			 yourself).
	morphPresenter := self newMorph
		                  morph: self createTextMorph;
		                  yourself
]

{ #category : #initialization }
CMSpAboutWindow >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self cormasClass asString;
		initialExtent: 570 @ 500;
		askOkToClose: false
]

{ #category : #accessing }
CMSpAboutWindow >> morphPresenter [

	^ morphPresenter
]

{ #category : #accessing }
CMSpAboutWindow >> morphPresenter: anObject [

	morphPresenter := anObject
]

{ #category : #initialization }
CMSpAboutWindow >> parseMicrodownText [

	| builder |
	builder := MicroDownParser builder.
	self cormasClass buildMicroDownUsing: builder.
	^ [ MicroDownParser asText: builder contents ] 
			on: MicParsingError, MessageNotUnderstood, SubclassResponsibility 
			do: [ builder contents ].
]

{ #category : #initialization }
CMSpAboutWindow >> setModelBeforeInitialization: aDomainObject [

	self cormasClass: aDomainObject
]
