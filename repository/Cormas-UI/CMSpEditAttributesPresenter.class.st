Class {
	#name : #CMSpEditAttributesPresenter,
	#superclass : #CMSpViewAttributesPresenter,
	#instVars : [
		'toolbarClassAttributeActions'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpEditAttributesPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom 
		add: #classAttributesLabel height: self labelHeight;
		add: #classAttributesTable;
		add: #toolbarClassAttributeActions height: self toolbarHeight;
		yourself.
]

{ #category : #examples }
CMSpEditAttributesPresenter class >> example [

	^ (self on: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec
]

{ #category : #removing }
CMSpEditAttributesPresenter >> addAttributeCallback [
	" Callback for adding attribute in the target class "
	
	| attName |
	attName := self 
		requestText: self translator tEnterAttName
		title: self translator tAppTitle.

	(self validateAttributeName: attName)
	 	ifTrue: [ 
			self codeGenerator targetClass: self codeGenerator targetClass class.
			CMSpecAddInitialValueChooser on: attName for: self projectManager owner: self owner ]
		ifFalse: [ 
			attName 
				ifNotNil: [ self informMessage: attName , self translator tInvalidName ] ]
]

{ #category : #initialization }
CMSpEditAttributesPresenter >> initializePresenters [ 

	super initializePresenters.
	self initializeToolbar.
]

{ #category : #initialization }
CMSpEditAttributesPresenter >> initializeToolbar [

	toolbarClassAttributeActions := self newToolbar
		addItem: (SpToolbarButtonPresenter new
			label: 'Add';
			icon: (self iconNamed: #smallAdd);
			help: 'Ok';
			action: [ self addAttributeCallback ];
			yourself);
		addItem: (SpToolbarButtonPresenter new
			label: 'Remove';
			icon: (self iconNamed: #smallDelete);
			help: 'Cancel';
			action: [ self removeAttributeCallback ];
			yourself);
		yourself.
]

{ #category : #accessing }
CMSpEditAttributesPresenter >> label [

	^ self translator tAttributesTargetLabel.
]

{ #category : #removing }
CMSpEditAttributesPresenter >> removeAttributeCallback [
	" Private - User clicked in the remove attribute button, confirm and remove "

	self classAttributesTable hasSelection 
		ifFalse: [ ^ self inform: 'Please select an attribute first' ].
	(self confirm: self translator tConfirmDeleteAttribute)
		ifTrue: [ 
			[ 
				self targetClass removeInstVarNamed: self selectedItemWrapper targetAttribute.
				self classAttributesTable dataSource: (CMClassAttributeValueDataSource forClass: self targetClass).
				self inform: 'Attribute removed'
			 ]
			on: SlotNotFound 
			do: [ : ex | self inform: 'Slot not found' ].
 		]
]

{ #category : #accessing }
CMSpEditAttributesPresenter >> toolbarClassAttributeActions [

	^ toolbarClassAttributeActions
]

{ #category : #accessing }
CMSpEditAttributesPresenter >> toolbarClassAttributeActions: anObject [

	toolbarClassAttributeActions := anObject
]
