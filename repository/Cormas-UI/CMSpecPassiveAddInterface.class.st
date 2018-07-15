Class {
	#name : #CMSpecPassiveAddInterface,
	#superclass : #CMSpecObject,
	#instVars : [
		'entityName',
		'toolbar',
		'rbTypeGroup',
		'entitySuperclass'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecPassiveAddInterface class >> defaultSpec [
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ : r | 
			r 
				newRow: [ : col | col 
					add: #rbTypeGroup ] height: 300;
				add: #entityName height: self toolbarHeight + 5;
				add: #toolbar height: self toolbarHeight ];	
	yourself	
]

{ #category : #callbacks }
CMSpecPassiveAddInterface >> addActionBlock: aBlockClosure [ 
	" Private - Delegate the receiver's action block to its owner "

	self owner addActionBlock: aBlockClosure.
]

{ #category : #callbacks }
CMSpecPassiveAddInterface >> addNewSpatialEntityGUI [
	
	| superClass newName aClass |

	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #callbacks }
CMSpecPassiveAddInterface >> addPassiveObject [

	self shouldBeImplemented.
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> entityName [
	" Answer the entityName of this CMSpecEntityAddInterface "

	^ entityName
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> entityName: anObject [
	" Sets the entityName of this CMSpecEntityAddInterface "

	entityName := anObject
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> entitySuperclass [
	^ entitySuperclass
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> entitySuperclass: anObject [
	entitySuperclass := anObject
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initialExtent [

	^ 300 @ 400
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initializeEntityOptions [
	" EntityAdditionInterface>>postBuildWith: "

	self cormas spaceModel isNil "cellClass."
		ifTrue: [ 
			"self entitySuperclass: CMSpatialEntityCell."
			"self cellOrCA value: #SpatialEntityElement."
"			self rbEntityElementType enable.
			self rbSimpleCell enable.
			self rbCellularAutomaton enable."
			"(aBuilder componentAt: #LabelSpecialize) disable."
"			self rbAggregate disable.
			self rbSetNoConnex disable" ]
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initializePresenter [
	" Private - See superimplementor's comment "

	self setActionsForRb.
	self 
		bindKeyCombination: $o meta 
		toAction: [ self triggerOkAction ].
	self initializeEntityOptions.
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initializeRbItems [
	" Private - Initialize radio button items "

	self rbTypeGroup buttonObject
		label: self translator tObject;
		help: self translator tObjectHelp.
		
	self rbTypeGroup buttonLocatedObject
		label: self translator tLocatedObject;
		help: self translator tLocatedObjectHelp.
		
	self rbTypeGroup buttonNetworkNode
		label: self translator tNetworkNode;
		help: self translator tNetworkNodeHelp.
		
	self rbTypeGroup buttonNetworkArc
		label: self translator tNetworkArc;
		help: self translator tNetworkArcHelp.
		
	self rbTypeGroup buttonFullNetwork
		label: self translator tFullNetwork;
		help: self translator tFullNetworkHelp.
		
	self rbTypeGroup buttonMessage
		label: self translator tMessage;
		help: self translator tMessageHelp
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		rbTypeGroup 				CMSpecPassiveAddRBGroup
		entityName 				SpcLabeledTextField			
		toolbar 					SpcOneButtonToolbar).

	self entityName label: self translator tName.
	self setFocus.
	self setToolbar.
	self initializeRbItems.
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> rbTypeGroup [
	^ rbTypeGroup
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> rbTypeGroup: anObject [
	rbTypeGroup := anObject
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> setActionsForRb [
	"  buttonNetworkNode buttonNetworkArc buttonFullNetwork buttonMessage "
	self rbTypeGroup buttonObject whenActivatedDo: [  ].
	self rbTypeGroup buttonObject whenDeactivatedDo: [  ].
	
	self rbTypeGroup buttonLocatedObject whenActivatedDo: [  ].
	self rbTypeGroup buttonLocatedObject whenDeactivatedDo: [  ].


]

{ #category : #initialization }
CMSpecPassiveAddInterface >> setFocus [

	self focusOrder
		add: self entityName;
		add: self toolbar
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> setToolbar [

	self toolbar 
		firstButtonLabel: 'Ok';
		firstButtonAction: [ self addPassiveObject ]

]

{ #category : #callbacks }
CMSpecPassiveAddInterface >> spatialEntitySuperclass [

	^ Smalltalk at: #CMSpatialEntityAggregate
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> title [
	^ 'Create a kind of Entity'
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> toolbar [
	" Answer the toolbar of this CMSpecEntityAddInterface "

	^ toolbar
]

{ #category : #accessing }
CMSpecPassiveAddInterface >> toolbar: anObject [
	" Sets the toolbar of this CMSpecEntityAddInterface "

	toolbar := anObject
]

{ #category : #callbacks }
CMSpecPassiveAddInterface >> validateEntity [

	| newClassName |
	
	(newClassName := self entityName textValuePending) isEmpty 
		ifTrue: [ ^ self informMessage: self translator tEnterClassName ].
	^ self owner addItem: newClassName trimBoth
]
