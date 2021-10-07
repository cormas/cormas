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
		'resourcesTabContainer',
		'umlPage'
	],
	#category : #'Cormas-UI-Spec2-Project'
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
		addPage: (umlPage := self newUMLPage)		
	"	addPage: (resourcesPage := self newResourcesPage 
			title: 'Resources';
			presenterProvider: [ self resourcesPresenter ];"
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
CMSpOpenProjectNotebookPresenter >> newUMLPage [

	^ SpNotebookPage  
		title: 'UML'
		icon: (self iconNamed: #morph)
		provider: [ self projectUMLPresenter ]
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
	selectedModel fileReference
		ifNotNil: [ : fileRef | ^ CMExternalBrowser on: selectedModel fileReference ]
		ifNil: [ self inform: 'Cannot preview the model' ]
]

{ #category : #initialization }
CMSpOpenProjectNotebookPresenter >> projectUMLPresenter [
	" Answer a <ComposablePresenter> to browse source code in the receiver's selected model "

	selectedModel ifNil: [ ^ self newEmpty ].

	^ CMR3UMLPresenter on: selectedModel

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
