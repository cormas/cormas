Class {
	#name : #CMSpMainContainerPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'projectStructurePresenter',
		'selectionContainerPresenter',
		'toolbarPresenter'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpMainContainerPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #toolbarPresenter withConstraints: [ :constraints | constraints height: self buttonHeight ];
		  add: (SpPanedLayout newHorizontal
				   positionOfSlider: 30 percent;
				   add: #projectStructurePresenter;
				   add: #selectionContainerPresenter;
				   yourself);
		  yourself
]

{ #category : #accessing }
CMSpMainContainerPresenter >> projectStructurePresenter [

	^ projectStructurePresenter
]

{ #category : #accessing }
CMSpMainContainerPresenter >> projectStructurePresenter: anObject [

	projectStructurePresenter := anObject
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
