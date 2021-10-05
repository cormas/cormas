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
		'attributeAddButton',
		'attributeRemoveButton',
		'classVarAddButton'
	],
	#category : #'Cormas-UI-Spec1-Attributes'
}

{ #category : #specs }
CMSpecAttributesToolbar class >> defaultSpec [
	<spec>

	^ SpecLayout composed
		newRow: [ : r | 
			r
				add: #attributeAddButton;
				add: #attributeRemoveButton ;
				add: #classVarAddButton ]
			height: 25;			
			yourself			

]

{ #category : #callbacks }
CMSpecAttributesToolbar >> addAttributeCallback [

	" Callback for adding attribute in the target class "

	| attName |
	attName := self
		           requestText: self translator tEnterAttName
		           title: self translator tAppTitle.

	(self validateAttributeName: attName)
		ifTrue: [ 
			self codeGenerator targetClass:
				self codeGenerator targetClass instanceSide.
			CMSpecAddInitialValueChooser
				on: attName
				for: self projectManager
				owner: self owner ]
		ifFalse: [ 
			attName ifNotNil: [ 
				self informMessage: attName , self translator tInvalidName ] ]
]

{ #category : #callbacks }
CMSpecAttributesToolbar >> addClassAttributeCallback [
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
CMSpecAttributesToolbar >> classAttributesTable [

	^ self owner classAttributesTable
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
CMSpecAttributesToolbar >> codeGenerator [ 

	^ self projectManager codeGenerator
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
		add: self classVarAddButton

]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializeLabels [
	" Private - See superimplementor's comment "

	self attributeAddButton 
		label: 'Instance attribute';
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddInstAtt.
	self attributeRemoveButton
		label: 'Attribute';
		icon: (self iconNamed: #removeIcon);
		help: self translator tHelpRemoveInstAtt.

	self classVarAddButton 
		label: 'Class attribute';	
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddClassAttr.

]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializePresenter [
	" Private - See superimplementor's comment "

	self attributeAddButton action: [ self addAttributeCallback ].
	self attributeRemoveButton action: [ self removeAttributeCallback ].
	self classVarAddButton action: [ self addClassAttributeCallback ].

]

{ #category : #initialization }
CMSpecAttributesToolbar >> initializeWidgets [
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			attributeAddButton 		ButtonModel 
			attributeRemoveButton 	ButtonModel 
			classVarAddButton 			ButtonModel).
	
	self initializeLabels.
	self initializeFocus.

]

{ #category : #callbacks }
CMSpecAttributesToolbar >> removeAttributeCallback [
	" Private - User clicked in the remove attribute button, confirm and remove "

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

{ #category : #callbacks }
CMSpecAttributesToolbar >> removeClassAttributeCallback [
	" Private - User clicked in the remove attribute button, confirm and remove "

self halt
	(self owner superclassesAttributesTable hasSelection and: [ self confirm: self translator tConfirmDeleteAttribute  ])
		ifTrue: [ self halt ]
]

{ #category : #accessing }
CMSpecAttributesToolbar >> selectedItemWrapper [

	^ self classAttributesTable selectedItem
]

{ #category : #accessing }
CMSpecAttributesToolbar >> targetClass [

	^ self selectedItemWrapper targetClass
]

{ #category : #initialization }
CMSpecAttributesToolbar >> validateAttributeName: userAnswer [
	" Answer <true> if provided userAnswer is valid as attribute name "

	^ userAnswer notNil and: [ userAnswer notEmpty and: [ userAnswer isValidInstVarName ] ]
]
