Class {
	#name : #CMSpMainContainerPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'projectStructurePresenter',
		'selectionContainerPresenter',
		'toolbarPresenter',
		'selectedPresenter'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #'instance creation' }
CMSpMainContainerPresenter class >> open [ 
	<script>

	self new openWithSpec 
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
							add: (self instantiate: newPageClass);
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
		add: (self instantiate: self availablePages first);
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
