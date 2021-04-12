Class {
	#name : #CMSpOpenProjectNotebookPresenter,
	#superclass : #CMSpPManagedPresenter,
	#instVars : [
		'notebookPanel',
		'infoPage',
		'sourceCodePage',
		'resourcesPage',
		'selectedModel',
		'sourceCodeTabContainer',
		'resourcesTabContainer'
	],
	#category : #'Cormas-UI-Project-Spec2'
}

{ #category : #specs }
CMSpOpenProjectNotebookPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #notebookPanel;
		  yourself
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> initialize [

	super initialize.
	"sourceCodeTabContainer := IceTipHistoryDiffFromHead tab: sourceCodePage.
	resourcesTabContainer := IceTipHistoryDiffToAncestor tab: resourcesPage"
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> initializePresenters [

	super initializePresenters.
	notebookPanel := self newNotebook.
	self initializeProjectPanel


]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> initializeProjectPanel [
	"This will be initialised in fact on the first refresh"

	notebookPanel
		addPage: (infoPage := self newProjectInfoPage);
		addPage: (sourceCodePage := self newSourceCodePage);
	"	addPage: (resourcesPage := self newResourcesPage 
			title: 'Resources';
			presenterProvider: [ self resourcesPresenter ];"
			yourself
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> newEmpty [

	^ self newLabel
		  label: '(No project selected)';
		  yourself
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> newProjectInfoPage [

	^ SpNotebookPage  
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self projectInfoPresenter ]
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> newSourceCodePage [

	^ SpNotebookPage  
		title: 'Source'
		icon: (self iconNamed: #smallHierarchyBrowser)
		provider: [ self projectSourcePresenter ]
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> projectInfoPresenter [

	selectedModel ifNil: [ ^ self newEmpty ].
	^ CMSpReadOnlyFormBuilder 
		newBuiltFor: selectedModel infoDictionary
		application: self application
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> projectSourcePresenter [
	" Answer a <ComposablePresenter> to browse source code in the receiver's selected model "

	selectedModel ifNil: [ ^ self newEmpty ].
	^ CMExternalBrowser on: selectedModel fileReference
]

{ #category : #accessing }
CMSpOpenProjectNotebookPresenter >> refresh [
	
	selectedModel ifNil: [ ^ self ].
	
"	sourceCodePage title: (sourceCodeTabContainer labelFor: selectedModel).
	resourcesPage title: (resourcesTabContainer labelFor: selectedModel)."
	notebookPanel resetAllPageContents
]

{ #category : #accessing }
CMSpOpenProjectNotebookPresenter >> selectedModel: aModel [

	selectedModel := aModel.
	self refresh
]
