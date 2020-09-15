"
CMSpecEntityAddInterface new openWithSpec.
"
Class {
	#name : #CMSpecSpatialEntityAddInterface,
	#superclass : #CMSpecEntityAddInterface,
	#instVars : [
		'toolbar',
		'rbEntityElementType',
		'rbCellGroup',
		'rbConfigGroup'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecSpatialEntityAddInterface class >> defaultSpec [
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
CMSpecSpatialEntityAddInterface >> addActionBlock: aBlockClosure [ 
	" Private - Delegate the receiver's action block to its owner "

	self owner addActionBlock: aBlockClosure.
]

{ #category : #callbacks }
CMSpecSpatialEntityAddInterface >> addNewSpatialEntityGUI [
	
	| superClass newName aClass |

	self flag: #toDelete.
	" Acá ya obtiene el valor de la superclase ingresada porque ya sabe si creó la primera o la segunda "
	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #'as yet unclassified' }
CMSpecSpatialEntityAddInterface >> entityType [

	^ 'Spatial'
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initialExtent [

	^ 400 @ 300
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initializeEntityOptions [
	" EntityAdditionInterface>>postBuildWith: "

	self cormas spaceModel isNil "cellClass."
		ifTrue: [ 
			"self cellOrCA value: #SpatialEntityElement."
			self rbEntityElementType enable.
			self rbSimpleCell enable.
			self rbCellularAutomaton enable.
			"(aBuilder componentAt: #LabelSpecialize) disable."
			self rbAggregate disable.
			self rbSetNoConnex disable ]
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initializePresenter [
	" Private - See superimplementor's comment "

	self setActionsForRb.
	self 
		bindKeyCombination: $o meta 
		toAction: [ self triggerOkAction ].
	self initializeEntityOptions.
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initializeRbItems [

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
CMSpecSpatialEntityAddInterface >> initializeRbStatus [
	" Initialize radio button status accodingly if the receiver's model has a Simple Cell or Cellular Automaton already defined "

	self cormasModel hasSpatialClasses
		ifTrue: [ 
			self rbEntityElementType disable.
			self rbSimpleCell disable.
			self rbCellularAutomaton disable.
			self rbAggregate enable.
			self rbSetNoConnex enable. ]
		ifFalse: [ 
			self rbEntityElementType enable.
			self rbSimpleCell enable.
			self rbCellularAutomaton enable.
			self rbAggregate disable.
			self rbSetNoConnex disable ]
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initializeToolbar [

	self toolbar 
		firstButtonLabel: self translator tHelp;
		firstButtonAction: [ self openHelp ];
		secondButtonLabel: self translator tCancel;
		secondButtonAction: [ self delete ];
		thirdButtonLabel: self translator tOk;
		thirdButtonAction: [ self addEntity. ]

]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> initializeWidgets [

	super initializeWidgets.
	self instantiateModels: #(
		rbEntityElementType 	RadioButtonModel
		rbCellGroup 				SpcRadioButtonGroup
		rbConfigGroup 			SpcRadioButtonGroup
		toolbar 					SpcThreeButtonToolbar).

	self setFocus;
		initializeToolbar;
		initializeRbItems;
		initializeRbStatus.
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbAggregate [

	^ self rbConfigGroup button1
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbCellGroup [
	^ rbCellGroup
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbCellGroup: anObject [
	rbCellGroup := anObject
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbCellularAutomaton [

	^ self rbCellGroup button2
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbConfigGroup [
	^ rbConfigGroup
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbConfigGroup: anObject [
	rbConfigGroup := anObject
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbEntityElementType [
	" Answer the entityElementType of this CMSpecEntityAddInterface "

	^ rbEntityElementType
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbEntityElementType: anObject [
	" Sets the entityElementType of this CMSpecEntityAddInterface "

	rbEntityElementType := anObject
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbSetNoConnex [

	^ self rbConfigGroup button2.
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> rbSimpleCell [

	^ self rbCellGroup button1
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> setActionsForRb [
	" Private - Configure radio button callbacks "

	self rbSimpleCell whenActivatedDo: [ self entitySuperclass: CMSpatialEntityElement ].
	self rbCellularAutomaton whenActivatedDo: [ self entitySuperclass: CMSpatialEntityCell ].
	self rbAggregate whenActivatedDo: [ self entitySuperclass: CMSpatialEntityAggregate ].
	self rbSetNoConnex whenActivatedDo: [ self entitySuperclass: CMSpatialEntityNotConnex ]

]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> setFocus [

	self focusOrder
"		add: self rbEntityElementType;	
		add: self rbCellGroup;
		add: self rbConfigGroup;"
		add: self entityName;
		add: self toolbar
]

{ #category : #initialization }
CMSpecSpatialEntityAddInterface >> title [
	^ self translator tCreateEntityKind
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> toolbar [
	" Answer the toolbar of this CMSpecEntityAddInterface "

	^ toolbar
]

{ #category : #accessing }
CMSpecSpatialEntityAddInterface >> toolbar: anObject [
	" Sets the toolbar of this CMSpecEntityAddInterface "

	toolbar := anObject
]
