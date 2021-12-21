Class {
	#name : #CMSpCreateInstancesPresenter,
	#superclass : #CMModelSpPresenter,
	#instVars : [
		'entitySelector',
		'initializationOptionsPresenter',
		'entityViewPresenter',
		'actionbar'
	],
	#category : #'Cormas-UI-Spec2-CreateInstances'
}

{ #category : #specs }
CMSpCreateInstancesPresenter class >> defaultSpec [
	<spec>

	^ SpBoxLayout newVertical
		add: #entitySelector expand: false;
		add: #initializationOptionsPresenter;
		addLast: #entityViewPresenter;
		addLast: #toolbar;
		yourself

]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> actionbar [

	^ actionbar
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> actionbar: anObject [

	actionbar := anObject
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> entitySelector [

	^ entitySelector
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> entitySelector: anObject [

	entitySelector := anObject
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> entityViewPresenter [

	^ entityViewPresenter
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> entityViewPresenter: anObject [

	entityViewPresenter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> initializationOptionsPresenter [

	^ initializationOptionsPresenter
]

{ #category : #accessing }
CMSpCreateInstancesPresenter >> initializationOptionsPresenter: anObject [

	initializationOptionsPresenter := anObject
]

{ #category : #initialization }
CMSpCreateInstancesPresenter >> initializeButtonBar [

	actionbar := self newActionBar
			add: (self newButton
				label: 'Create'; 
				icon: (self iconNamed: #smallOk);
				help: 'Add.';
				action: [ UIManager default defer: [ self inform: 'Create' ] ];
				yourself);
			add: (self newButton
				label: 'Cancel'; 
				icon: (self iconNamed: #smallCancel);
				help: 'Cancel.';
				action: [ UIManager default defer: [ self inform: 'Cancel' ] ];
				yourself);
			yourself


]

{ #category : #initialization }
CMSpCreateInstancesPresenter >> initializeEntitySelectorPresenter [

	entitySelector := CMSpCreateInstancesSelectorPresenter new.


]

{ #category : #initialization }
CMSpCreateInstancesPresenter >> initializeOptionsPresenter [

	initializationOptionsPresenter := self newList.
	entityViewPresenter := self newList.


]

{ #category : #initialization }
CMSpCreateInstancesPresenter >> initializePresenters [

	self 
		initializeEntitySelectorPresenter;
		initializeOptionsPresenter;
		initializeButtonBar
	


]
