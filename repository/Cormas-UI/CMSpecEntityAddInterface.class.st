"
CMSpecEntityAddInterface new openWithSpec.
"
Class {
	#name : #CMSpecEntityAddInterface,
	#superclass : #CMSpecObject,
	#instVars : [
		'entityName',
		'toolbar',
		'rbEntityElementType',
		'rbCellGroup',
		'rbConfigGroup',
		'entitySuperclass'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecEntityAddInterface class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ : r | 
			r 
				newRow: [ : col | col 
					add: #rbEntityElementType;
					add: #rbCellGroup ] height: 60;
				newRow: [ : col | col
					add: #rbConfigGroup ];
				add: #entityName height: self toolbarHeight + 5;
				add: #toolbar height: self toolbarHeight ];	


	yourself	
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> addActionBlock: aBlockClosure [ 
	" Private - Delegate the receiver's action block to its owner "

	self owner addActionBlock: aBlockClosure.
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> addEntity [

	self validateEntity.
	self delete.

]

{ #category : #callbacks }
CMSpecEntityAddInterface >> addNewSpatialEntityGUI [
	
	| superClass newName aClass |

	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
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

{ #category : #initialization }
CMSpecEntityAddInterface >> initialExtent [

	^ 400 @ 300
]

{ #category : #initialization }
CMSpecEntityAddInterface >> initializeEntityOptions [
	" EntityAdditionInterface>>postBuildWith: "

	self cormas spaceModel isNil "cellClass."
		ifTrue: [ 
			self entitySuperclass: CMSpatialEntityCell.
			"self cellOrCA value: #SpatialEntityElement."
			self rbEntityElementType enable.
			self rbSimpleCell enable.
			self rbCellularAutomaton enable.
			"(aBuilder componentAt: #LabelSpecialize) disable."
			self rbAggregate disable.
			self rbSetNoConnex disable ]
]

{ #category : #initialization }
CMSpecEntityAddInterface >> initializePresenter [
	" Private - See superimplementor's comment "

	self setActionsForRb.
	self 
		bindKeyCombination: $o meta 
		toAction: [ self triggerOkAction ].
	self initializeEntityOptions.
]

{ #category : #initialization }
CMSpecEntityAddInterface >> initializeRbItems [

	self rbEntityElementType
		label: self translator tElement;
		help: self translator tSpatialEntityCellHelp.
		
	self rbSimpleCell
		label: self translator tSimpleCell;
		help: self translator tSimpleCellHelp.
		
	self rbCellularAutomaton 
		label: self translator tCellularAutomaton;
		help: self translator tCellAutomatonHelp.
		
	self rbAggregate 
		label: self translator tAggregate;
		help: self translator tSpatialEntityHelp.
		
	self rbSetNoConnex 
		label: self translator tSetNotConnex;
		help: self translator tSetNotConnexHelp
]

{ #category : #initialization }
CMSpecEntityAddInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		rbEntityElementType 	RadioButtonModel
		rbCellGroup 				SpcRadioButtonGroup
		rbConfigGroup 			SpcRadioButtonGroup
		entityName 				SpcLabeledTextField			
		toolbar 					SpcThreeButtonToolbar).

	self entityName label: self translator tName.
	self setFocus.
	self setToolbar.
	self initializeRbItems.
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbAggregate [

	^ self rbConfigGroup button1
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbCellGroup [
	^ rbCellGroup
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbCellGroup: anObject [
	rbCellGroup := anObject
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbCellularAutomaton [

	^ self rbCellGroup button2
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbConfigGroup [
	^ rbConfigGroup
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbConfigGroup: anObject [
	rbConfigGroup := anObject
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbEntityElementType [
	" Answer the entityElementType of this CMSpecEntityAddInterface "

	^ rbEntityElementType
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbEntityElementType: anObject [
	" Sets the entityElementType of this CMSpecEntityAddInterface "

	rbEntityElementType := anObject
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbSetNoConnex [

	^ self rbConfigGroup button2.
]

{ #category : #accessing }
CMSpecEntityAddInterface >> rbSimpleCell [

	^ self rbCellGroup button1
]

{ #category : #initialization }
CMSpecEntityAddInterface >> setActionsForRb [

	self rbEntityElementType whenActivatedDo: [  ].
	self rbEntityElementType whenDeactivatedDo: [  ].
	
	self rbSimpleCell whenActivatedDo: [  ].
	self rbSimpleCell whenDeactivatedDo: [  ].


]

{ #category : #initialization }
CMSpecEntityAddInterface >> setFocus [

	self focusOrder
		add: self entityName;
		add: self toolbar
]

{ #category : #initialization }
CMSpecEntityAddInterface >> setToolbar [
	self toolbar 
		firstButtonLabel: 'Help';
		firstButtonAction: [ self openHelp ];
		secondButtonLabel: 'Cancel';
		secondButtonAction: [ self delete ];
		thirdButtonLabel: 'Ok';
		thirdButtonAction: [ self addEntity. ]

]

{ #category : #callbacks }
CMSpecEntityAddInterface >> spatialEntitySuperclass [

	^ Smalltalk at: #CMSpatialEntityAggregate
]

{ #category : #initialization }
CMSpecEntityAddInterface >> title [
	^ 'Create a kind of Entity'
]

{ #category : #accessing }
CMSpecEntityAddInterface >> toolbar [
	" Answer the toolbar of this CMSpecEntityAddInterface "

	^ toolbar
]

{ #category : #accessing }
CMSpecEntityAddInterface >> toolbar: anObject [
	" Sets the toolbar of this CMSpecEntityAddInterface "

	toolbar := anObject
]

{ #category : #callbacks }
CMSpecEntityAddInterface >> validateEntity [

	| newClassName |
	
	(newClassName := self entityName textValuePending) isEmpty 
		ifTrue: [ ^ self informMessage: self translator tEnterClassName ].
	^ self owner addItem: newClassName trimBoth
]
