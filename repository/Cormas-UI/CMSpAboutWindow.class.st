Class {
	#name : #CMSpAboutWindow,
	#superclass : #CMSpPresenter,
	#instVars : [
		'morphPresenter'
	],
	#category : #'Cormas-UI-Spec2-Project'
}

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

	self layout: (SpBoxLayout newLeftToRight
			 add: #morphPresenter;
			 yourself).
	morphPresenter := self newMorph
		                  morph: self createTextMorph;
								addStyle: 'aboutMorph';
		                  yourself
]

{ #category : #initialization }
CMSpAboutWindow >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: self cormasClass asString;
		initialExtent: 770 @ 500;
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
