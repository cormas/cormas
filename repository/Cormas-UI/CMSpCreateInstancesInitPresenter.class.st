Class {
	#name : #CMSpCreateInstancesInitPresenter,
	#superclass : #CMSpPresenter,
	#instVars : [
		'locateInstancesRandomlyRadioPresenter',
		'locateInstancesConstrainedRadioPresenter',
		'locateInstancesByClickingRadioPresenter',
		'numberOfInstancesInputPresenter',
		'enableUndoCheckPresernter'
	],
	#category : #'Cormas-UI-Spec2-CreateInstances'
}

{ #category : #specs }
CMSpCreateInstancesInitPresenter class >> defaultSpec [
	<spec>
	
	^ SpGridLayout new 
			beColumnHomogeneous;
			beRowHomogeneous;
			add: #locateInstancesRandomlyRadioPresenter at: 1@1;
			add: #locateInstancesConstrainedRadioPresenter at: 2@1;
			add: #locateInstancesByClickingRadioPresenter at: 3@1;
			add: #numberOfInstancesInputPresenter at: 2@2;
			add: #enableUndoCheckPresenter at: 2@3;
			yourself
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> enableUndoCheckPresernter [

	^ enableUndoCheckPresernter
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> enableUndoCheckPresernter: anObject [

	enableUndoCheckPresernter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesByClickingRadioPresenter [

	^ locateInstancesByClickingRadioPresenter
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesByClickingRadioPresenter: anObject [

	locateInstancesByClickingRadioPresenter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesConstrainedRadioPresenter [

	^ locateInstancesConstrainedRadioPresenter
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesConstrainedRadioPresenter: anObject [

	locateInstancesConstrainedRadioPresenter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesRandomlyRadioPresenter [

	^ locateInstancesRandomlyRadioPresenter
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> locateInstancesRandomlyRadioPresenter: anObject [

	locateInstancesRandomlyRadioPresenter := anObject
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> numberOfInstancesInputPresenter [

	^ numberOfInstancesInputPresenter
]

{ #category : #accessing }
CMSpCreateInstancesInitPresenter >> numberOfInstancesInputPresenter: anObject [

	numberOfInstancesInputPresenter := anObject
]
