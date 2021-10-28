Class {
	#name : #CMSpNeighboursListPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'neighboursListInput'
	],
	#category : #'Cormas-UI-Spec2-Space'
}

{ #category : #specs }
CMSpNeighboursListPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #neighboursListInput withConstraints: [ :c | c height: 120 ];
		yourself
]

{ #category : #initialization }
CMSpNeighboursListPresenter >> initializePresenters [ 

	neighboursListInput := self newList
		beSingleSelection;
		items: self neighboursOptions;
		whenSelectionChangedDo: [ : newText| self halt. newText];
		yourself.

]

{ #category : #accessing }
CMSpNeighboursListPresenter >> neighboursListInput [

	^ neighboursListInput
]

{ #category : #accessing }
CMSpNeighboursListPresenter >> neighboursListInput: anObject [

	neighboursListInput := anObject
]

{ #category : #initialization }
CMSpNeighboursListPresenter >> neighboursOptions [

	^ #(3 4 6 8)
]
