Class {
	#name : #CMSpViewAttributesPresenter,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'classAttributesTable',
		'classAttributesLabel'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpViewAttributesPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom 
		add: #classAttributesLabel height: self labelHeight;
		add: #classAttributesTable;
		yourself.
]

{ #category : #examples }
CMSpViewAttributesPresenter class >> example [

	^ (self on: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesLabel [

	^ classAttributesLabel
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesLabel: anObject [

	classAttributesLabel := anObject
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesTable [

	^ classAttributesTable
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesTable: anObject [

	classAttributesTable := anObject
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> initializePresenters [ 

	classAttributesLabel := self newLabel label: self label.
	classAttributesTable := self newTable
		addColumn: (SpStringTableColumn title: 'Attribute' evaluated: #asString);
		addColumn: (SpStringTableColumn title: 'Value' evaluated: #asString);
		yourself


]

{ #category : #initialization }
CMSpViewAttributesPresenter >> label [

	^ self translator tAttributesSuperLabel.
]

{ #category : #'as yet unclassified' }
CMSpViewAttributesPresenter >> updateAttributesFrom: aClass [

	self classAttributesTable items: aClass
]
