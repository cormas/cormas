Class {
	#name : #CMSpMainContainerPresenter,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'projectStructurePresenter',
		'selectionContainerPresenter',
		'toolbarPresenter',
		'selectedPresenter'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #'world menu' }
CMSpMainContainerPresenter class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	(aBuilder item: #'CORMAS Mock Project Browser')
		parent: #'Tools';
		help: 'Spec2 Project Browser';
		action: [ self openForMock ]; 
		order: 4.0;
		icon: CMIcons smallCormasLogoIcon
	
]

{ #category : #'instance creation' }
CMSpMainContainerPresenter class >> open [ 
	<script>

	self new openWithSpec 
]

{ #category : #'instance creation' }
CMSpMainContainerPresenter class >> openForMock [
	<script>

	(self for: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec 
]

{ #category : #initialization }
CMSpMainContainerPresenter >> availablePages [
	^ CMSpProjectItem availablePages
]

{ #category : #initialization }
CMSpMainContainerPresenter >> connectPresenters [

	"projectStructurePresenter selectItem: self selectedPage."
	self projectTree whenSelectionChangedDo: [ :selection | 
		selection selectedItem
			ifNotNil: [ :newPageClass | 
				newPageClass = self selectedPresenter
					ifFalse: [ 
						self selectedPresenter: newPageClass.
						selectionContainerPresenter 
							removeAll; 
							add: (self instantiate: newPageClass on: self projectManager);
							yourself ] ]
			ifNil: [ 
				"Avoid the user to have no page selected at all." 
				self projectTree setSelectedItem: self selectedPresenter ] ]
]

{ #category : #initialization }
CMSpMainContainerPresenter >> initializeLayout [

	self layout: (SpBoxLayout newVertical
		  add: toolbarPresenter withConstraints: [ :constraints | constraints height: self class buttonHeight ];
		  add: (SpPanedLayout newHorizontal
				   positionOfSlider: 30 percent;
				   add: projectStructurePresenter;
				   add: selectionContainerPresenter;
				   yourself);
		  yourself)
]

{ #category : #initialization }
CMSpMainContainerPresenter >> initializePresenters [

	self 
		initializeToolbar;
		initializeProjectStructure;
		initializeSelectionContainer;
		initializeLayout
]

{ #category : #initialization }
CMSpMainContainerPresenter >> initializeProjectStructure [

	self projectStructurePresenter: CMSpProjectStructurePresenter new.
]

{ #category : #initialization }
CMSpMainContainerPresenter >> initializeSelectionContainer [

	self selectionContainerPresenter: (SpBoxLayout newTopToBottom
		add: (self instantiate: self availablePages first on: self projectManager);
		yourself)
]

{ #category : #initialization }
CMSpMainContainerPresenter >> initializeToolbar [

	self toolbarPresenter: SpToolbarPresenter new.

]

{ #category : #accessing }
CMSpMainContainerPresenter >> projectStructurePresenter [

	^ projectStructurePresenter
]

{ #category : #accessing }
CMSpMainContainerPresenter >> projectStructurePresenter: anObject [

	projectStructurePresenter := anObject
]

{ #category : #initialization }
CMSpMainContainerPresenter >> projectTree [
	" Answer the receiver's <SpTreeTablePresenter> "

	^ self projectStructurePresenter tree
]

{ #category : #accessing }
CMSpMainContainerPresenter >> selectedPresenter [

	^ selectedPresenter
]

{ #category : #accessing }
CMSpMainContainerPresenter >> selectedPresenter: anObject [

	selectedPresenter := anObject
]

{ #category : #accessing }
CMSpMainContainerPresenter >> selectionContainerPresenter [

	^ selectionContainerPresenter
]

{ #category : #accessing }
CMSpMainContainerPresenter >> selectionContainerPresenter: anObject [

	selectionContainerPresenter := anObject
]

{ #category : #accessing }
CMSpMainContainerPresenter >> toolbarPresenter [

	^ toolbarPresenter
]

{ #category : #accessing }
CMSpMainContainerPresenter >> toolbarPresenter: anObject [

	toolbarPresenter := anObject
]
