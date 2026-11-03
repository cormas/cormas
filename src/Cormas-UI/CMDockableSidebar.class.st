Class {
	#name : 'CMDockableSidebar',
	#superclass : 'SpPresenter',
	#instVars : [
		'activityBar',
		'sidebar',
		'pages',
		'toggledBlock'
	],
	#category : 'Cormas-UI-DockableSidebar',
	#package : 'Cormas-UI',
	#tag : 'DockableSidebar'
}

{ #category : 'examples' }
CMDockableSidebar class >> classesPresenterExample [

	^ SpListPresenter new
		display: [ :c | c name ];
		displayIcon: [ :c | self iconNamed: c systemIconName ];
		items: Smalltalk image allClasses;
		yourself
]

{ #category : 'examples' }
CMDockableSidebar class >> example [

	| presenter |
	presenter := self new.

	presenter addPage: (SpNotebookPage
		title: 'Packages'
		icon: (self iconNamed: #package)
		provider: [ self packagesPresenterExample ]).
		
	presenter addPage: (SpNotebookPage
		title: 'Classes'
		icon: (self iconNamed: #class)
		provider: [ self classesPresenterExample ]).
		
	presenter
		addButtonIcon: (self iconNamed: #inspect)
		help: 'Inspect'
		action: [ presenter inspect ].

	presenter open
]

{ #category : 'examples' }
CMDockableSidebar class >> packagesPresenterExample [

	^ SpListPresenter new
		display: [ :p | p name ];
		displayIcon: [ :p | self iconNamed: #package ];
		items: Smalltalk image packages;
		yourself
]

{ #category : 'adding' }
CMDockableSidebar >> addButtonIcon: anIcon help: aString action: aBlock [

	activityBar addButtonIcon: anIcon help: aString action: aBlock
]

{ #category : 'adding' }
CMDockableSidebar >> addPage: aPage [

	activityBar
		addToggleButtonIcon: aPage icon
		help: aPage title
		whenActivatedDo: [ 
			sidebar := aPage retrievePresenter.
			self showSidebar ]
		whenDeactivatedDo: [ self hideSidebar ]
]

{ #category : 'layout' }
CMDockableSidebar >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: activityBar width: activityBar class activityButtonHeight;
		yourself
]

{ #category : 'examples' }
CMDockableSidebar >> example [
	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> hideSidebar [

	layout remove: layout presenters second. "removing null presenter (spacing)"
	layout remove: layout presenters second. "removing sidebar"
	owner layout: owner layout.
	toggledBlock ifNotNil: [ toggledBlock value ]
]

{ #category : 'initialization' }
CMDockableSidebar >> initializePresenters [

	activityBar := self instantiate: CMActivityBar
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> openSidebarWidth [
	"Answer how much wider I am now than when my sidebar is closed"

	^ layout presenters size > 1
		  ifTrue: [ self sidebarSpacing + self sidebarWidth ]
		  ifFalse: [ 0 ]
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> showSidebar [
	"This is a hack. We have to use a null presenter instead of spacing because otherwise the parent layout can't calculate size correctly when using expand: false"

	layout add: self newNullPresenter width: self sidebarSpacing.
	layout add: sidebar width: self sidebarWidth.
	owner layout: owner layout.
	toggledBlock ifNotNil: [ toggledBlock value ]
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> sidebarSpacing [

	^ 10
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> sidebarWidth [

	^ 250
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> whenToggledDo: aBlock [
	"Evaluate aBlock after the sidebar opens or closes, which changes the space that I need"

	toggledBlock := aBlock
]
