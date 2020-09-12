Class {
	#name : #CMSpecEntityAddInterface,
	#superclass : #CMSpecObject,
	#instVars : [
		'entityName',
		'entitySuperclass'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #callbacks }
CMSpecEntityAddInterface >> addEntity [

	self hasValidEntityName
		ifTrue: [ self addValidEntity ]
		ifFalse: [ ^ self informMessage: self translator tEnterClassName ].
	self delete.

]

{ #category : #callbacks }
CMSpecEntityAddInterface >> addNewEntityItem: newClassName [

	(Smalltalk hasClassNamed: newClassName asValidCormasClassName)
		ifTrue: [ self owner addItem: newClassName asValidCormasClassName ].
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> addValidEntity [
	" Assume the text pending for the entity name is valid and add it to the receiver's model "
	
	| newClassName |
	
	newClassName := self entityName textValuePending.
	self projectAnnouncer announce: 
		(CMEntityNewAnnouncement 
			named: newClassName 
			type: self entityType
			superclass: self entitySuperclass).
	self addNewEntityItem: newClassName.
]

{ #category : #accessing }
CMSpecEntityAddInterface >> entityName [
	" Answer the entityName of this CMSpecEntityAddInterface "

	^ entityName
]

{ #category : #accessing }
CMSpecEntityAddInterface >> entityName: anObject [
	" Sets the entityName of this CMSpecEntityAddInterface "

	entityName := anObject
]

{ #category : #accessing }
CMSpecEntityAddInterface >> entitySuperclass [
	^ entitySuperclass
]

{ #category : #accessing }
CMSpecEntityAddInterface >> entitySuperclass: anObject [
	entitySuperclass := anObject
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> entityType [
	
	self subclassResponsibility
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> hasValidEntityName [
	" Answer <false> if the user provided entity name is not valid "

	^ self entityName textValuePending notEmpty 

]

{ #category : #initialization }
CMSpecEntityAddInterface >> initializeWidgets [

	self instantiateModels: #(
		entityName 		SpcLabeledTextField).
	self entityName
		beForText;
		label: self translator tName;
		whenTextIsAccepted: [ self addEntity ]
]
