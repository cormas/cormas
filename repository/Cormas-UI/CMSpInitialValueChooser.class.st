"
Main presenter for editing a variable initialization value.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	accessorOps:		<Object>
	attributeName:		<Object>
	initialRBGroup:		<Object>
	toolbar:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpInitialValueChooser,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'accessorOps',
		'toolbar',
		'initialRBGroup',
		'attributeName'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpInitialValueChooser class >> defaultSpec [

    <spec>
    ^ SpBoxLayout newTopToBottom
			add: #accessorOps expand: false fill: true;
			add: #initialRBGroup;
			add: #toolbar height: self toolbarHeight;
			yourself.
]

{ #category : #examples }
CMSpInitialValueChooser class >> example [

	^ (self on: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec
]

{ #category : #accessing }
CMSpInitialValueChooser >> accessorOps [

	^ accessorOps
]

{ #category : #accessing }
CMSpInitialValueChooser >> accessorOps: anObject [

	accessorOps := anObject
]

{ #category : #accessing }
CMSpInitialValueChooser >> attributeName [

	^ attributeName
]

{ #category : #accessing }
CMSpInitialValueChooser >> attributeName: anObject [

	attributeName := anObject
]

{ #category : #accessing }
CMSpInitialValueChooser >> initialRBGroup [

	^ initialRBGroup
]

{ #category : #accessing }
CMSpInitialValueChooser >> initialRBGroup: anObject [

	initialRBGroup := anObject
]

{ #category : #initialization }
CMSpInitialValueChooser >> initializeFocus [

	self focusOrder
		add: self accessorOps;
		add: self initialRBGroup;
		add: self toolbar
]

{ #category : #initialization }
CMSpInitialValueChooser >> initializePresenters [
	" Private - See superimplementor's comment "

	accessorOps := self instantiate: CMSpAccessorOperations on: self projectManager. 
	initialRBGroup := self instantiate: CMSpInitialValueOptions on: self projectManager.
	self initializeToolbar.
	self initializeFocus.

]

{ #category : #initialization }
CMSpInitialValueChooser >> initializeToolbar [

	toolbar := self newToolbar.
	self toolbar
		addItem: (SpToolbarButtonPresenter new
			icon: (self iconNamed: #smallUpdate);
			label: 'Update';
			action: [ self applyInitialValueChooserSetting ];
			yourself)
]

{ #category : #accessing }
CMSpInitialValueChooser >> toolbar [

	^ toolbar
]

{ #category : #accessing }
CMSpInitialValueChooser >> toolbar: anObject [

	toolbar := anObject
]
