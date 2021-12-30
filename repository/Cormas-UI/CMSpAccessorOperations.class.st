Class {
	#name : #CMSpAccessorOperations,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'setterAccessorCheckbox',
		'getterAccessorCheckbox',
		'notifyObsCheckbox',
		'createControlCheckbox'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpAccessorOperations class >> defaultSpec [ 
	<spec>
	
	^ SpGridLayout new 
			beColumnHomogeneous;
			beRowHomogeneous;				
			add: #setterAccessorCheckbox at: 1@1;
			add: #getterAccessorCheckbox at: 1@2;
			add: #notifyObsCheckbox at: 2@1;
			add: #createControlCheckbox at: 2@2;
			yourself
]

{ #category : #accessing }
CMSpAccessorOperations >> createControlCheckbox [

	^ createControlCheckbox
]

{ #category : #accessing }
CMSpAccessorOperations >> createControlCheckbox: anObject [

	createControlCheckbox := anObject
]

{ #category : #accessing }
CMSpAccessorOperations >> getterAccessorCheckbox [
	" Answer the getterAccessorCheckbox of this CMSpecInitialValueChooser "

	^ getterAccessorCheckbox
]

{ #category : #accessing }
CMSpAccessorOperations >> getterAccessorCheckbox: anObject [
	" Sets the getterAccessorCheckbox of this CMSpecInitialValueChooser "

	getterAccessorCheckbox := anObject
]

{ #category : #initialization }
CMSpAccessorOperations >> initializeFocusOrder [ 

	self focusOrder
		add: self setterAccessorCheckbox;
		add: self getterAccessorCheckbox;
		add: self notifyObsCheckbox;
		add: self createControlCheckbox
]

{ #category : #initialization }
CMSpAccessorOperations >> initializePresenters [

	setterAccessorCheckbox := self newCheckBox.
	getterAccessorCheckbox := self newCheckBox.
	notifyObsCheckbox := self newCheckBox.
	createControlCheckbox := self newCheckBox.

	self setterAccessorCheckbox label: self translator tSetterAccessor.
	self getterAccessorCheckbox label: self translator tGetterAccessor.
	self notifyObsCheckbox label: self translator tNotifyObs.
	self createControlCheckbox label: 'Create control'.
	
	self setterAccessorCheckbox state: true.
	self getterAccessorCheckbox state: true.
	self createControlCheckbox state: false.

	self initializeFocusOrder
]

{ #category : #accessing }
CMSpAccessorOperations >> notifyObsCheckbox [
	" Answer the notifyObsCheckbox of this CMSpecInitialValueChooser "

	^ notifyObsCheckbox
]

{ #category : #accessing }
CMSpAccessorOperations >> notifyObsCheckbox: anObject [
	" Sets the notifyObsCheckbox of this CMSpecInitialValueChooser "

	notifyObsCheckbox := anObject
]

{ #category : #accessing }
CMSpAccessorOperations >> setterAccessorCheckbox [
	" Answer the setterAccessorCheckbox of this CMSpecInitialValueChooser "

	^ setterAccessorCheckbox
]

{ #category : #accessing }
CMSpAccessorOperations >> setterAccessorCheckbox: anObject [
	" Sets the setterAccessorCheckbox of this CMSpecInitialValueChooser "

	setterAccessorCheckbox := anObject
]
