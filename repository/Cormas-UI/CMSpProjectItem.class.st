Class {
	#name : #CMSpProjectItem,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'tabManager'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #accessing }
CMSpProjectItem class >> availablePages [
	^ self allSubclasses sort: #priority ascending
]

{ #category : #specs }
CMSpProjectItem class >> defaultSpec [
	^ SpBoxLayout newTopToBottom
		add: #tabManager;
		yourself
]

{ #category : #accessing }
CMSpProjectItem class >> icon [ 
	^ self iconProvider propertiesIcon 
]

{ #category : #accessing }
CMSpProjectItem class >> iconProvider [ 

	^ CMIconCache 
]

{ #category : #accessing }
CMSpProjectItem class >> label [

	^ 'CORMAS Project'
]

{ #category : #'instance creation' }
CMSpProjectItem class >> on: aString [ 

	^ self new
		label: aString;
		yourself
]

{ #category : #accessing }
CMSpProjectItem class >> pageName [

	^ self label
]

{ #category : #initialization }
CMSpProjectItem >> codeTab [
	^ SpNotebookPage
		title: 'Code'
		icon: (self iconNamed: #changeUpdate)
		provider: [ self newText
				text: (self codeFor: self pageClass);
				yourself ]
]

{ #category : #accessing }
CMSpProjectItem >> icon [

	^ self class icon
]

{ #category : #initialization }
CMSpProjectItem >> initializePresenters [

	tabManager := self newNotebook.
	"tabManager whenTabSelected: [ self updateTitle ]."
	tabManager
		addPage: self workspaceTab;
		addPage: self codeTab.
]

{ #category : #initialization }
CMSpProjectItem >> pageClass [

	self subclassResponsibility 

]

{ #category : #accessing }
CMSpProjectItem >> tabManager [

	^ tabManager
]

{ #category : #accessing }
CMSpProjectItem >> tabManager: anObject [

	tabManager := anObject
]

{ #category : #initialization }
CMSpProjectItem >> workspaceTab [

	^ SpNotebookPage 
		title: 'Workspace' 
		icon: (self iconNamed: #workspace) 
		provider: [ self instantiate: self pageClass on: self projectManager ]
]
