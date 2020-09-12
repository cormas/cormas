Class {
	#name : #CMSpecPassiveAddInterface,
	#superclass : #CMSpecEntityAddInterface,
	#instVars : [
		'toolbar',
		'rbTypeGroup'
	],
	#category : #'Cormas-UI-Core'
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

{ #category : #accessing }
CMSpecPassiveAddInterface >> entityType [

	^ 'Passive'
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
CMSpecPassiveAddInterface >> initializeToolbar [

	self toolbar 
		firstButtonLabel: self translator tOk;
		firstButtonAction: [ self addEntity ];

		secondButtonLabel: self translator tCancel;
		secondButtonAction: [ self delete ]

]

{ #category : #initialization }
CMSpecPassiveAddInterface >> initializeWidgets [
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self instantiateModels: #(
		rbTypeGroup 				CMSpecPassiveAddRBGroup
		toolbar 					SpcTwoButtonToolbar).

	self setFocus.
	self initializeToolbar.
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

	self rbTypeGroup buttonObject whenActivatedDo: [ self entitySuperclass: CMPassiveObject ].
	self rbTypeGroup buttonLocatedObject whenActivatedDo: [ self entitySuperclass: CMObjectLocation ].
	self rbTypeGroup buttonNetworkNode whenActivatedDo: [ self entitySuperclass: CMNodeEntity ].
	self rbTypeGroup buttonNetworkArc whenActivatedDo: [ self entitySuperclass: CMArcEntity ].
	self rbTypeGroup buttonFullNetwork whenActivatedDo: [ self entitySuperclass: CMNetworkEntity ].
	self rbTypeGroup buttonMessage whenActivatedDo: [ self entitySuperclass: CMObjectLocation ].



]

{ #category : #initialization }
CMSpecPassiveAddInterface >> setFocus [

	self focusOrder
		add: self rbTypeGroup buttonObject;
		add: self entityName textField;
		add: self toolbar firstButton;
		add: self toolbar secondButton.
]

{ #category : #initialization }
CMSpecPassiveAddInterface >> title [

	^ self translator tCreateEntityKind
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
