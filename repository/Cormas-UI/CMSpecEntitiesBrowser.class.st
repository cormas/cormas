"
CMSpecEntitiesBrowser example.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	defineEntitiesLabel:		<Object>
	passiveList:		<Object>
	socialList:		<Object>
	spatialList:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecEntitiesBrowser,
	#superclass : #CMSpecObject,
	#instVars : [
		'spatialList',
		'socialList',
		'passiveList',
		'defineEntitiesLabel'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #initialization }
CMSpecEntitiesBrowser class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ : row | 
			row
				add: #defineEntitiesLabel height: self toolbarHeight ];
		newRow: [ : col |
			col
				add: #spatialList;
				add: #socialList;
				add: #passiveList ]

]

{ #category : #accessing }
CMSpecEntitiesBrowser >> defineEntitiesLabel [
	" Answer the defineEntitiesLabel of this CMSpecEntitiesBrowser "

	^ defineEntitiesLabel
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> defineEntitiesLabel: anObject [
	" Sets the defineEntitiesLabel of this CMSpecEntitiesBrowser "

	defineEntitiesLabel := anObject
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditActivityDiagrams [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditMethods [

	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditPoVSetter [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRemove [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRename [
	self shouldBeImplemented.
]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initialExtent [
	^ 600 @ 400
]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializeFocusOrder [

	self focusOrder
		add: self spatialList;
		add: self socialList;
		add: self passiveList;
		add: self defineEntitiesLabel

]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializeListsContents [

	#('Spatial' 'Social' 'Passive')
		do: [ : aType | 
			| typeSelector |
			typeSelector := (aType asLowercase , 'List') asSymbol.
			"selectionInList := self perform: typeSelector."
			(self perform: typeSelector) items: (self initializeListsContents: aType) ]
]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializeListsContents: entityTypeString [
	" Private - Populate the receiver's lists using the current loaded model "

	| aList highLevelClasses |
	aList := OrderedCollection new.
	highLevelClasses := (self cormasModelClass
		perform: (entityTypeString asLowercase , 'Classes') asSymbol)
			reject: [ : anEntity | anEntity cmEnvironment includes: anEntity superclass].
	(highLevelClasses asSortedCollection: [ : i : j | i name < j name]) 
		do: [ : anEntity | 
			(anEntity cmPrintHierarchy findTokens: Character cr)
				do: [ : s | aList add: s ] ].
	^ aList	
]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializeMenuItems [
	" Private - Set the menu options for receiver's lists "

	self spatialList menu: [ self menuForSpatialList ].
	self socialList menu: [ self menuForSocialList ].
	self passiveList menu: [ self menuForPassiveList ].
]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializePresenter [
	" Private - See superimplementor's comment "

	self spatialList addActionBlock: [ self openAddEntityInterface ].
	self socialList addActionBlock: [ self openAddAgentInterface ].
	self passiveList addActionBlock: [ self openAddPassiveInterface ].

]

{ #category : #initialization }
CMSpecEntitiesBrowser >> initializeWidgets [
	" Private - See superimplementor's comment "
	
	self
		instantiateModels: #(
			spatialList 				SpcActionList 
			socialList 				SpcActionList 
			passiveList 				SpcActionList 
			defineEntitiesLabel 	LabelModel).

	self defineEntitiesLabel label: self translator tDefineEntities.
	self spatialList label: self translator tSpatial.
	self socialList label: self translator tSocial.
	self passiveList label: self translator tPassive.

	self initializeMenuItems.
	self initializeFocusOrder.
	self initializeListsContents.


]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> menuForPassiveList [

	| aMenu |
	aMenu := MenuModel new.
	aMenu
		addGroup: [ : aGroup |
			aGroup addItem: [ : anItem |
				anItem
					name: self translator tEdit;
					subMenu: self subMenuForEditEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entitySpecialize ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstract ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self entityRemove ] ] ].
	^ aMenu buildWithSpecAsPopup.
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> menuForSocialList [

	| aMenu |
	aMenu := MenuModel new.
	aMenu
		addGroup: [ : aGroup |
			aGroup addItem: [ : anItem |
				anItem
					name: self translator tEdit;
					subMenu: self subMenuForEditEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entitySpecialize ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tRename;
						action: [ self entityRename ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstract ] ] ].
	^ aMenu buildWithSpecAsPopup.
	
	

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> menuForSpatialList [

	| aMenu |
	aMenu := MenuModel new.
	aMenu
		addGroup: [ : aGroup | 			
			aGroup addItem: [ : anItem |
				anItem
					name: self translator tEdit;
					subMenu: self subMenuForEditEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entitySpecialize ];
						enabled: false ];
				addItem: [ : anItem | 
					anItem
						name: self translator tRename;
						action: [ self entityRename ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self entityRemove ] ] ].
	^ aMenu buildWithSpecAsPopup.
	
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddAgentInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a social entity "
	
	^ (CMSpecAgentAddInterface openFor: self projectManager)	
		owner: self socialList;
		yourself

]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddEntityInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a spatial entity "

	^ (CMSpecEntityAddInterface openFor: self projectManager)	
		owner: self spatialList;
		yourself


]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddPassiveInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a passive entity "
	
	^ (CMSpecPassiveAddInterface openFor: self projectManager)	
		owner: self passiveList;
		yourself

]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openEditAttributes [
	" Open the edit attributes window "

	self projectManager openEditAttributes
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> passiveList [
	" Answer the passiveList of this CMSpecEntitiesBrowser "

	^ passiveList
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> passiveList: anObject [
	" Sets the passiveList of this CMSpecEntitiesBrowser "

	passiveList := anObject
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> socialList [
	" Answer the socialList of this CMSpecEntitiesBrowser "

	^ socialList
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> socialList: anObject [
	" Sets the socialList of this CMSpecEntitiesBrowser "

	socialList := anObject
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> spatialList [
	" Answer the spatialList of this CMSpecEntitiesBrowser "

	^ spatialList
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> spatialList: anObject [
	" Sets the spatialList of this CMSpecEntitiesBrowser "

	spatialList := anObject
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> subMenuForEditEntity [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributes ] ];
				addItem: [ : item | 
					item 
						name: self translator tMethods;
						action: [ self entityEditMethods ] ];
				addItem: [ : item | 
					item 
						name: self translator tActivityDiagrams;
						action: [ self entityEditActivityDiagrams ] ];
				addItem: [ : item | 
					item 
						name: self translator tPoVSetter;
						action: [ self entityEditPoVSetter ] ] ]

]

{ #category : #initialization }
CMSpecEntitiesBrowser >> title [
	^ 'Entities'
]
