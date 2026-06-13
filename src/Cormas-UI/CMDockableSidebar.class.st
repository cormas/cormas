Class {
	#name : 'CMDockableSidebar',
	#superclass : 'SpPresenter',
	#instVars : [
		'activityBar',
		'sidebar',
		'pages'
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
	owner layout: owner layout
]

{ #category : 'initialization' }
CMDockableSidebar >> initializePresenters [

	activityBar := self instantiate: CMActivityBar
]

{ #category : 'as yet unclassified' }
CMDockableSidebar >> showSidebar [

	"This is a hack. We have to use a null presenter instead of spacing because otherwise the parent layout can't calculate size correctly when using expand: false"
	layout add: self newNullPresenter width: 10.

	layout add: sidebar width: 250.
	owner layout: owner layout
]
