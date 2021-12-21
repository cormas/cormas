Class {
	#name : #CMSpApplication,
	#superclass : #SpApplication,
	#category : #'Cormas-UI-Spec2'
}

{ #category : #accessing }
CMSpApplication class >> defaultApplication [

	^ DefaultApplication ifNil: [ DefaultApplication := CMSpApplication new ]
]
