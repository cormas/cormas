"
CMSpecAttributesToolbar example.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSpecAttributesToolbar,
	#superclass : #CMSpecObject,
	#instVars : [
		'attributeLabel',
		'attributeAddButton',
		'attributeRemoveButton',
		'classVarLabel',
		'classVarAddButton',
		'classVarRemoveButton'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #specs }
CMSpecAttributesToolbar class >> defaultSpec [
	<spec>

	^ SpecLayout composed
		newRow: [ : r | 
			r
				add: #attributeLabel;
				add: #attributeAddButton;
				add: #attributeRemoveButton ;
				addSplitter;
				add: #classVarLabel;
				add: #classVarAddButton;
				add: #classVarRemoveButton  ]
			height: 25;			
			yourself			

]

{ #category : #callbacks }
CMSpecAttributesToolbar >> addAttributeCallback [
	" Callback for adding attribute in the target class "
	
	| userAnswer |
	userAnswer := self 
		requestText: self translator tEnterAttName
		title: self translator tAppTitle.
	(self validateAttributeName: userAnswer)
	 	ifTrue: [ CMSpecInitialValueChooser openFor: self projectManager ]
		ifFalse: [ 
			userAnswer 
				ifNotNil: [ self informMessage: userAnswer , self translator tInvalidName ] ]
]

{ #category : #callbacks }
CMSpecAttributesToolbar >> addClassAttributeCallback [
	" Callback for adding attribute in the target class "
	
	| userAnswer |
	userAnswer := self 
		requestText: self translator tEnterAttName
		title: self translator tAppTitle.
	(self validateAttributeName: userAnswer)
	 	ifTrue: [ CMSpecInitialValueChooser openFor: self projectManager ]
		ifFalse: [ 
			userAnswer 
				ifNotNil: [ self informMessage: userAnswer , self translator tInvalidName ] ]
]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeAddButton [
	" Answer the attributeAddButton of this CMSpecAttributesToolbar "

	^ attributeAddButton

]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeAddButton: anObject [
	" Sets the attributeAddButton of this CMSpecAttributesToolbar "

	attributeAddButton := anObject

]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeLabel [
	" Answer the attributeLabel of this CMSpecAttributesToolbar "

	^ attributeLabel

]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeLabel: anObject [
	" Sets the attributeLabel of this CMSpecAttributesToolbar "

	attributeLabel := anObject

]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeRemoveButton [
	" Answer the attributeRemoveButton of this CMSpecAttributesToolbar "

	^ attributeRemoveButton

]

{ #category : #accessing }
CMSpecAttributesToolbar >> attributeRemoveButton: anObject [
	" Sets the attributeRemoveButton of this CMSpecAttributesToolbar "

	attributeRemoveButton := anObject

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarAddButton [
	" Answer the classVarAddButton of this CMSpecAttributesToolbar "

	^ classVarAddButton

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarAddButton: anObject [
	" Sets the classVarAddButton of this CMSpecAttributesToolbar "

	classVarAddButton := anObject

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarLabel [
	" Answer the classVarLabel of this CMSpecAttributesToolbar "

	^ classVarLabel

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarLabel: anObject [
	" Sets the classVarLabel of this CMSpecAttributesToolbar "

	classVarLabel := anObject

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarRemoveButton [
	" Answer the classVarRemoveButton of this CMSpecAttributesToolbar "

	^ classVarRemoveButton

]

{ #category : #accessing }
CMSpecAttributesToolbar >> classVarRemoveButton: anObject [
	" Sets the classVarRemoveButton of this CMSpecAttributesToolbar "

	classVarRemoveButton := anObject

]

{ #category : #initialization }
CMSpecAttributesToolbar >> initialExtent [
	" Private - See superimplementor's comment "

	^ 600 @ 400
]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializeFocus [

	self focusOrder
		add: self attributeAddButton;
		add: self attributeRemoveButton;
		add: self classVarAddButton;
		add: self classVarRemoveButton

]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializeLabels [
	" Private - See superimplementor's comment "

	self attributeLabel label: self translator tAttribute.
	self attributeAddButton 
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddInstAtt.
	self attributeRemoveButton
		icon: (self iconNamed: #removeIcon);
		help: self translator tHelpRemoveInstAtt.

	self classVarLabel label: self translator tClassVariable.
	self classVarAddButton 
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddClassAttr.
	self classVarRemoveButton
		icon: (self iconNamed: #removeIcon);
		help: self translator tHelpRemoveClassAtt.	
]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializePresenter [
	" Private - See superimplementor's comment "

	self attributeAddButton action: [ self addAttributeCallback ].
	self attributeRemoveButton action: [ self removeAttributeCallback ].

	self classVarAddButton action: [ self addClassAttributeCallback ].
	self classVarRemoveButton action: [ self removeClassAttributeCallback ].
]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializeWidgets [
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			attributeLabel 				LabelModel 
			attributeAddButton 		ButtonModel 
			attributeRemoveButton 	ButtonModel 
			classVarLabel 				LabelModel 
			classVarAddButton 			ButtonModel 
			classVarRemoveButton 		ButtonModel).
	
	self initializeLabels.
	self initializeFocus.

]

{ #category : #callbacks }
CMSpecAttributesToolbar >> openInitialValueChooser [

	self shouldBeImplemented
]

{ #category : #callbacks }
CMSpecAttributesToolbar >> removeAttributeCallback [
	" Private - User clicked in the remove attribute button, confirm and remove "

	(self owner superclassesAttributesTable hasSelection and: [ self confirm: self translator tConfirmDeleteAttribute  ])
		ifTrue: [ self halt ]
]

{ #category : #callbacks }
CMSpecAttributesToolbar >> removeClassAttributeCallback [
	" Private - User clicked in the remove attribute button, confirm and remove "

	(self owner superclassesAttributesTable hasSelection and: [ self confirm: self translator tConfirmDeleteAttribute  ])
		ifTrue: [ self halt ]
]

{ #category : #initialization }
CMSpecAttributesToolbar >> validateAttributeName: userAnswer [
	" Answer <true> if provided userAnswer is valid as attribute name "

	^ userAnswer notNil and: [ userAnswer notEmpty and: 
		[ userAnswer isValidInstVarName ] ]
]
