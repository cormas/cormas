"
CMSpecAgentAddInterface example
"
Class {
	#name : #CMSpecAgentAddInterface,
	#superclass : #CMSpecEntityAddInterface,
	#instVars : [
		'cbComm',
		'cbGroup',
		'cbLocation',
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
					add: #entityName;
					add: #descriptionLabel;
					add: #toolbar height: self toolbarHeight ] ]
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

{ #category : #accessing }
CMSpecAgentAddInterface >> entitySuperclass [

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

{ #category : #accessing }
CMSpecAgentAddInterface >> entityType [

	^ 'Social'
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initialExtent [

	^ 500 @ 250
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initializePresenter [
	" Private - See superimplementor's comment "

	self toolbar firstButtonAction: [ self addEntity ].
]

{ #category : #initialization }
CMSpecAgentAddInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self instantiateModels: #(
		cbComm 					CheckBoxModel
		cbGroup 					CheckBoxModel
		cbLocation 				CheckBoxModel					 
		descriptionLabel 		LabelModel 
		toolbar 					SpcOneButtonToolbar).

	self cbComm label: self translator tCommunication.
	self cbGroup label: self translator tGroup.
	self cbLocation label: self translator tLocation.
	self toolbar firstButtonLabel: self translator tOk.
	self focusOrder
		add: self cbComm;
		add: self cbGroup;
		add: self cbLocation;
		add: self entityName;
		add: self descriptionLabel;
		add: self toolbar
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
