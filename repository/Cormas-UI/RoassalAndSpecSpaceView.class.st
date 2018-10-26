"
Complex class that embed the Roassal View of the cormas spatial grid into a spec element (system of windows).

    Instance Variables
	cormasModel:		The instance of cormas model observed
	diagram:		I don't know..
	view:		The CMSimulationGridSpec instance (the roassal object )


    Implementation Points
"
Class {
	#name : #RoassalAndSpecSpaceView,
	#superclass : #ComposableModel,
	#instVars : [
		'diagram',
		'view',
		'cormasModel'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
RoassalAndSpecSpaceView class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :tcol | 
			tcol add: #diagram]
]

{ #category : #'instance creation' }
RoassalAndSpecSpaceView class >> open [
	<script>
	"
	RoassalAndSpecExample open
	"
	^ self new openWithSpec
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> diagram [
	^ diagram
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> diagram: anObject [
	diagram := anObject
]

{ #category : #initialization }
RoassalAndSpecSpaceView >> initializePresenter [
	"This causes the diagram's script to be executed again."

"	button1
		action: [ view add: (RTEllipse new size: 40 atRandom) element.
			view signalUpdate ].
	button2
		action: [ RTFlowLayout on: view elements.
			view signalUpdate ]"
]

{ #category : #initialization }
RoassalAndSpecSpaceView >> initializeWidgets [
	diagram := self instantiate: CMRoassalModel.
	diagram
		script: [ :aView :canvas | 
			"	diagram script: [ :view :canvas | self textAsCode value: view value: canvas ]"
			self view: aView.
			self view initializeOn: self cormasModel.
			self view subscribeOn: self cormasModel
			"aView @ RTDraggableView " ]
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> view [
	^ view
]

{ #category : #accessing }
RoassalAndSpecSpaceView >> view: aRoassalView [
	view := aRoassalView
]
