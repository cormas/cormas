"
CMSpecAgentAddInterface example
"
Class {
	#name : #CMSpecAgentAddInterface,
	#superclass : #CMSpecObject,
	#instVars : [
		'cbComm',
		'cbGroup',
		'cbLocation',
		'newClassName',
		'descriptionLabel',
		'toolbar'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecAgentAddInterface class >> defaultSpec [
	<spec>

	^ SpecLayout composed
		newRow: [ : col | 
			col
				newColumn: [ : row |
				row 
					add: #cbComm;
					add: #cbGroup;
					add: #cbLocation ];
			newColumn: [ : row | 
				row
					add: #newClassName;
					add: #descriptionLabel;
					add: #toolbar height: self toolbarHeight ] ]
]

{ #category : #actions }
CMSpecAgentAddInterface >> addNewSocialEntityGUI [
	| newName superClass |
	(newName := self getNewClassNameFromGUI)
		ifNil: [ ^ self alertMessage: self translator tMissingClassName ].
	superClass := self getAgentSuperclassFromGUI.
	self projectManager
		addNewClassType: 'Social'
		inheritingFrom: superClass
		name: newName
		initProtocol: false
		stepProtocol: false.
	self closeRequest
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbComm [
	^ cbComm
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbComm: anObject [
	cbComm := anObject
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbGroup [
	^ cbGroup
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbGroup: anObject [
	cbGroup := anObject
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbLocation [
	^ cbLocation
]

{ #category : #accessing }
CMSpecAgentAddInterface >> cbLocation: anObject [
	cbLocation := anObject
]

{ #category : #actions }
CMSpecAgentAddInterface >> defaultClassPrefix [
	" Answer a <String> with a prefix for invalid class names entered by the user "
	
	^ 'X_'
]

{ #category : #accessing }
CMSpecAgentAddInterface >> descriptionLabel [
	" Answer the descriptionLabel of this CMSpecAgentAddInterface "

	^ descriptionLabel
]

{ #category : #accessing }
CMSpecAgentAddInterface >> descriptionLabel: anObject [
	" Sets the descriptionLabel of this CMSpecAgentAddInterface "

	descriptionLabel := anObject
]

{ #category : #actions }
CMSpecAgentAddInterface >> getAgentSuperclassFromGUI [
	
	self cbComm state not & self cbLocation state not & self cbGroup state not
		ifTrue: [ ^ CMAgent ].
	self cbComm state & self cbLocation state not & self cbGroup state not
		ifTrue: [ ^ CMAgentComm ].
	self cbComm state not & self cbLocation state & self cbGroup state not
		ifTrue: [ ^ CMAgentLocation ].
	self cbComm state & self cbLocation state & self cbGroup state not
		ifTrue: [ ^ CMAgentCommLocation ].
	self cbComm state not & self cbLocation state not & self cbGroup state
		ifTrue: [ ^ CMGroup ].
	self cbComm state & self cbLocation state not & self cbGroup state
		ifTrue: [ ^ CMGroupComm ].
	self cbComm state not & self cbLocation state & self cbGroup state
		ifTrue: [ ^ CMGroupLocation ].
	self cbComm state & self cbLocation state & self cbGroup state
		ifTrue: [ ^ CMGroupCommLocation ]
]

{ #category : #actions }
CMSpecAgentAddInterface >> getNewClassNameFromGUI [
	" Answer a <String> with a valid Smalltalk class name "	

	| aName |
	(aName := self newClassName textValuePending) isEmpty
		ifFalse: [
			aName first isLetter ifFalse: [ aName := self defaultClassPrefix , aName ].
			(self projectManager verifyClassExist: aName)
				ifTrue: [ self cormas alertNameAlreadyExist. 	^nil ] ]
		ifTrue: [ ^ nil ].
	^ aName capitalized
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initialExtent [

	^ 500 @ 250
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initializePresenter [
	" Private - See superimplementor's comment "

	self toolbar firstButtonAction: [ self addNewSocialEntityGUI ].
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		cbComm 					CheckBoxModel
		cbGroup 					CheckBoxModel
		cbLocation 				CheckBoxModel					 
		newClassName 			SpcLabeledTextField 
		descriptionLabel 		LabelModel 
		toolbar 					SpcOneButtonToolbar).

	self newClassName 
		beForText;
		label: 'Name:'.
	self cbComm label: self translator tCommunication.
	self cbGroup label: self translator tGroup.
	self cbLocation label: self translator tLocation.
	self toolbar firstButtonLabel: 'Ok'.
	self focusOrder
		add: self cbComm;
		add: self cbGroup;
		add: self cbLocation;
		add: self newClassName;
		add: self descriptionLabel;
		add: self toolbar
]

{ #category : #accessing }
CMSpecAgentAddInterface >> newClassName [
	^ newClassName
]

{ #category : #accessing }
CMSpecAgentAddInterface >> newClassName: anObject [
	newClassName := anObject
]

{ #category : #initialization }
CMSpecAgentAddInterface >> title [
	" Private - See superimplementor's comment "

	^ self translator tCreateAgent
]

{ #category : #accessing }
CMSpecAgentAddInterface >> toolbar [
	" Answer the toolbar of this CMSpecAgentAddInterface "

	^ toolbar
]

{ #category : #accessing }
CMSpecAgentAddInterface >> toolbar: anObject [
	" Sets the toolbar of this CMSpecAgentAddInterface "

	toolbar := anObject
]
