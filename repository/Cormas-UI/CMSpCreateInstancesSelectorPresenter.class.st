Class {
	#name : #CMSpCreateInstancesSelectorPresenter,
	#superclass : #CMProjectSpPresenter,
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
		add: #entityDropListPresenter expand: false;
		add: #numberOfEntriesTextPresenter expand: true;
		"addLast: #entityViewPresenter;"
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
		items: self selectableEntities;
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
		text: (self tNumberOfEntities format: self numberOfEntities asString).
		

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
	
	^ self cormasModelClass allInstances size
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
CMSpCreateInstancesSelectorPresenter >> selectableEntities [
	" Answer a <Collection> of <String> with class names representing entities which could be created by the user "
	
	^ self socialConcreteClasses , self passiveConcreteClasses 
]

{ #category : #initialization }
CMSpCreateInstancesSelectorPresenter >> tNumberOfEntities [

	^ 'Number of entities: {1}'
]
