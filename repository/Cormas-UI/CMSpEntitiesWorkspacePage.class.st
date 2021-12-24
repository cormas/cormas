Class {
	#name : #CMSpEntitiesWorkspacePage,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'entitiesPresenter',
		'tabManager'
	],
	#category : #'Cormas-UI-Spec2-Entities'
}

{ #category : #specs }
CMSpEntitiesWorkspacePage class >> defaultSpec [
	<spec>
	^ SpBoxLayout newTopToBottom 
		spacing: 5;	
		add: #entitiesPresenter;
		add: #tabManager;
		yourself
]

{ #category : #specs }
CMSpEntitiesWorkspacePage class >> example [

	^ (self on: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec
]

{ #category : #'accessing - helpers' }
CMSpEntitiesWorkspacePage >> attributesPage [

	^ (self pageNamed: 'Attributes') activePresenter
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> attributesTab [

	^ SpNotebookPage 
		title: 'Attributes' 
		icon: (self iconNamed: #database) 
		provider: [ self instantiate: CMSpEditAttributesPresenter on: self projectManager ]
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> codeTab [

	^ SpNotebookPage 
		title: 'Source' 
		icon: (self iconNamed: #hierarchy) 
		provider: [ self instantiate: SpClassMethodBrowser on: self projectManager ]
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> connectPresenters [ 

	self entitiesPresenter whenSelectedItemChangedDo: [ : selection | 
		selection selectedItem ifNotNil: [ : selectedClass |
				self attributesPage updateAttributesFrom: selectedClass ] ]
]

{ #category : #accessing }
CMSpEntitiesWorkspacePage >> entitiesPresenter [

	^ entitiesPresenter
]

{ #category : #accessing }
CMSpEntitiesWorkspacePage >> entitiesPresenter: anObject [

	entitiesPresenter := anObject
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> historyTab [

	^ SpNotebookPage 
		title: 'History' 
		icon: (self iconNamed: #history) 
		provider: [ self instantiate: SpClassMethodBrowser on: self projectManager ]
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> initializePresenters [

	entitiesPresenter := self instantiate: CMSpEntitiesPresenter on: self projectManager.
	tabManager := self newNotebook.
	tabManager 
		addPage: self attributesTab;
		addPage: self codeTab;
		addPage: self povTab;
		addPage: self historyTab
]

{ #category : #private }
CMSpEntitiesWorkspacePage >> pageNamed: aString [

	^ self tabManager pages detect: [ : p | p title = aString ]
]

{ #category : #'accessing - helpers' }
CMSpEntitiesWorkspacePage >> povPage [

	^ (self pageNamed: 'PoV') activePresenter
]

{ #category : #initialization }
CMSpEntitiesWorkspacePage >> povTab [

	^ SpNotebookPage 
		title: 'PoV' 
		icon: (self iconNamed: #workspace) 
		provider: [ self instantiate: SpClassMethodBrowser on: self projectManager ]
]

{ #category : #'accessing - helpers' }
CMSpEntitiesWorkspacePage >> sourcePage [

	^ (self pageNamed: 'Source') activePresenter
]

{ #category : #accessing }
CMSpEntitiesWorkspacePage >> tabManager [

	^ tabManager
]

{ #category : #accessing }
CMSpEntitiesWorkspacePage >> tabManager: anObject [

	tabManager := anObject
]
