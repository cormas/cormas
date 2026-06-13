Class {
	#name : 'CMActivityBar',
	#superclass : 'SpPresenter',
	#instVars : [
		'buttons',
		'toggleButtons'
	],
	#category : 'Cormas-UI-DockableSidebar',
	#package : 'Cormas-UI',
	#tag : 'DockableSidebar'
}

{ #category : 'as yet unclassified' }
CMActivityBar class >> activityButtonHeight [

	^ 40
]

{ #category : 'examples' }
CMActivityBar class >> example [

	| activityBar |
	activityBar := self new.
	
	activityBar
		addToggleButtonIcon: (activityBar iconNamed: #package)
		help: 'Packages'
		whenActivatedDo: [ self inform: 'Packages displayed' ]
		whenDeactivatedDo: [ self inform: 'Packages hidden' ].
		
	activityBar
		addToggleButtonIcon: (activityBar iconNamed: #class)
		help: 'Classes'
		whenActivatedDo: [ self inform: 'Classes displayed' ]
		whenDeactivatedDo: [ self inform: 'Classes hidden' ].
		
	activityBar
		addButtonIcon: (activityBar iconNamed: #configuration)
		help: 'Settings'
		action: [ self inform: 'Open settings!' ].

	activityBar open
]

{ #category : 'adding' }
CMActivityBar >> addButtonIcon: anIcon help: aString action: aBlock [

	buttons add: (self newButton
		icon: anIcon;
		help: aString;
		action: aBlock;
		yourself)
]

{ #category : 'adding' }
CMActivityBar >> addToggleButtonIcon: anIcon help: aString whenActivatedDo: anActivatedBlock whenDeactivatedDo: aDeactivatedBlock [

	| newButton |

	newButton := self newToggleButton
		icon: anIcon;
		help: aString;
		whenActivatedDo: anActivatedBlock;
		whenDeactivatedDo: aDeactivatedBlock;
		yourself.
		
	toggleButtons add: newButton.
		
	toggleButtons size > 1 ifTrue: [
		toggleButtons first associatedToggleButtons: toggleButtons allButFirst ]
]

{ #category : 'layout' }
CMActivityBar >> defaultLayout [

	| buttonsLayout |
	buttonsLayout := SpBoxLayout newTopToBottom.
	
	toggleButtons do: [ :button |
		buttonsLayout add: button height: self class activityButtonHeight ].
	
	buttonsLayout add: self newNullPresenter.
	
	buttons do: [ :button |
		buttonsLayout add: button height: self class activityButtonHeight ].
	
	^ buttonsLayout 
]

{ #category : 'examples' }
CMActivityBar >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMActivityBar >> initializePresenters [

	buttons := OrderedCollection new.
	toggleButtons := OrderedCollection new
]
