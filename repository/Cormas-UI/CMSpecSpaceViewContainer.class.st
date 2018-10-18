Class {
	#name : #CMSpecSpaceViewContainer,
	#superclass : #CMSpecObject,
	#instVars : [
		'spatialView'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecSpaceViewContainer class >> defaultSpec [
	<spec>
	^ SpecLayout composed newColumn: [ :c | c add: #spatialView ]
]

{ #category : #initialization }
CMSpecSpaceViewContainer >> initializeWidgets [
	" Private - See superimplementor's comment "

	"self spatialView: (CMSimulationGrid newOn: self projectManager cormasModel)"

	self flag: #shouldBeRevised.
	"self spatialView: (CMSpecSpaceView for: self projectManager)"
	"test de lien avec roassal en utilisant le package roassal2spec"
	self spatialView: (SpecEasel newWithOwner: self owner)
]

{ #category : #accessing }
CMSpecSpaceViewContainer >> spatialView [
	^ spatialView
]

{ #category : #accessing }
CMSpecSpaceViewContainer >> spatialView: anObject [
	spatialView := anObject
]
