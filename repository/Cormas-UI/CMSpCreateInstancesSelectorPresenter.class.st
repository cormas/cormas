Class {
	#name : #CMSpCreateInstancesSelectorPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'entityDropListPresenter',
		'numberOfEntriesTextPresenter',
		'entityViewPresenter'
	],
	#category : #'Cormas-UI-Spec2-CreateInstances'
}

{ #category : #specs }
CMSpCreateInstancesSelectorPresenter class >> defaultSpec [
	<spec>

	^ SpBoxLayout newVertical
		add: #entityDropListPresenter;
		add: #numberOfEntriesTextPresenter;
		addLast: #entityViewPresenter;
		yourself

]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> entityDropListPresenter [

	^ entityDropListPresenter
]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> entityDropListPresenter: anObject [

	entityDropListPresenter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> entityViewPresenter [

	^ entityViewPresenter
]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> entityViewPresenter: anObject [

	entityViewPresenter := anObject
]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> initializeEntitySelectorPresenter [

	entityDropListPresenter := self newDropList.
	self entityDropListPresenter
		items: { 1 . 2 . 3 };
		help: 'Select a Class to be instantiated';
		display: [ : entityClass | entityClass name ];
		whenSelectedItemChangedDo: [ : entityClass | self halt ]
]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> initializeEntityViewPresenter [


]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> initializeNumberOfEntitiesTextPresenter [

	numberOfEntriesTextPresenter := self newText.
	numberOfEntriesTextPresenter 
		beNotEditable;
		label: (self tNumberOfEntities format: self numberOfEntities asString).
		

]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> initializePresenters [ 

	self
		initializeEntitySelectorPresenter;
		initializeNumberOfEntitiesTextPresenter;
		initializeEntityViewPresenter.
]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> numberOfEntities [
	" Answer the <Number> of entities already present in the space of the selected entities list "
	
	^ self cormasModel halt
]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> numberOfEntriesTextPresenter [

	^ numberOfEntriesTextPresenter
]

{ #category : #accessing }
CMSpCreateInstancesSelectorPresenter >> numberOfEntriesTextPresenter: anObject [

	numberOfEntriesTextPresenter := anObject
]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> tNumberOfEntities [

	^ 'Number of entities: {1}'
]
