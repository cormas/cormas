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
	#category : #'Cormas-UI-Core'
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
CMSpecEntitiesBrowser >> entityAbstract: aCMEntityAbstractAnnouncement [

	(self class environment at: aCMEntityAbstractAnnouncement entityName) isAbstract
		ifTrue: [ 
			(self confirm: aCMEntityAbstractAnnouncement entityName , self translator tConfirmAbstractEntity)
				ifTrue: [ self projectAnnouncer announce: aCMEntityAbstractAnnouncement beConcrete ] ]
		ifFalse: [ 
			(self confirm: aCMEntityAbstractAnnouncement entityName , self translator tConfirmConcreteEntity)
				ifTrue: [ self projectAnnouncer announce: aCMEntityAbstractAnnouncement beAbstract ] ].

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entityAbstractAction: selectedEntity [

	self entityAbstract: (CMEntityAbstractAnnouncement named: selectedEntity)
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditActivityDiagrams [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditMethods: selectedClass [
	" Open a browser tool to edit the receiver's model initialization "

	selectedClass ifNotNil: [ 
		ClyFullBrowser openWithState: [ : browser | 
			browser 
				selectClass: selectedClass
				atMethodTag: #control ] ]
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditPassiveMethods [
	" Open a browser tool to edit the receiver's model initialization "

	ClyFullBrowser openWithState: [ : browser | 
		browser 
			selectClass: self passiveListSelectedClass
			atMethodTag: #control ]
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditPoVSetter [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditSocialMethods [
	" Open a browser tool to edit the receiver's model initialization "

	ClyFullBrowser openWithState: [ : browser | 
		browser 
			selectClass: self socialListSelectedClass
			atMethodTag: #control ]
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditSpatialMethods [
	" Open a browser tool to edit the receiver's model initialization "

	ClyFullBrowser openWithState: [ : browser | 
		browser 
			selectClass: self spatialListSelectedClass
			atMethodTag: #control ]
	
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entityPassiveSpecializeAction [

	| ann |
	ann := CMEntitySpecializeAnnouncement
		named: self selectedPassiveListItem asValidCormasClassName
		type: 'Passive'.
	self entitySpecialize: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self ].
	self passiveList addItem: ann entityName.
	self passiveList items: (self initializeListsContents: 'Passive').
	

]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRemove: aCMEntityRemoveAnnouncement [

	(self confirm: self translator tConfirmDeleteEntity)
		ifTrue: [ 
			self entityRemoveConfirmed: aCMEntityRemoveAnnouncement.
			^ true ].
	^ false
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRemoveConfirmed: aCMEntityRemoveAnnouncement [
	" Trigger an announcement to actually remove the selected entity "

	self projectAnnouncer announce: aCMEntityRemoveAnnouncement.
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRename: anAnnouncement [
	| className |
	
	(className := UIManager default 
		request: self translator tRenameEntityDialogText 
		initialAnswer: anAnnouncement entityName) isEmptyOrNil 
			ifTrue: [ ^ self ].
	self projectAnnouncer announce: (
		anAnnouncement 
			oldName: anAnnouncement entityName;
			entityName: className asValidCormasClassName).

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entitySocialRenameAction [
	| ann |
	ann := CMEntityRenameAnnouncement
		named: self selectedSocialListItem asValidCormasClassName
		type: 'Social'.
	self entityRename: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self ].
	(self socialList includes: ann entityName)
		ifTrue: [ ^ self ].
	self socialList addItem: ann entityName.
	self socialList remove: ann oldName
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entitySocialSpecializeAction [

	| ann |
	ann := CMEntitySpecializeAnnouncement
		named: self selectedSocialListItem asValidCormasClassName
		type: 'Social'.
	self entitySpecialize: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self ].
	self socialList addItem: ann entityName.
	self socialList items: (self initializeListsContents: 'Social').
	

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entitySpatialRenameAction [
	| ann |
	ann := CMEntityRenameAnnouncement
		named: self selectedSpatialListItem asValidCormasClassName
		type: 'Spatial'.
	self entityRename: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self ].
	(self spatialList includes: ann entityName)
		ifTrue: [ ^ self ].
	self spatialList addItem: ann entityName.
	self spatialList remove: ann oldName
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> entitySpecialize: anAnnouncement [

	| className |
	
	(className := UIManager default 
		request: self translator tSpecializeEntityDialogText 
		initialAnswer: anAnnouncement entityName
		title: self translator tSpecialization) isEmptyOrNil
			ifTrue: [ ^ self ].
	self projectAnnouncer announce: (
		anAnnouncement 
			superclass: anAnnouncement entityName;
			entityName: className asValidCormasClassName).

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

	self spatialList 
		addActionBlock: [ self openAddSpatialEntityInterface ];
		removeActionBlock: [ self entityRemove: (
			CMEntityRemoveAnnouncement 
				named: self selectedSpatialListItem asValidCormasClassName
				type: 'Spatial') ].
	self socialList 
		addActionBlock: [ self openAddAgentInterface ];
		removeActionBlock: [ self entityRemove: (
			CMEntityRemoveAnnouncement 
				named: self selectedSocialListItem asValidCormasClassName
				type: 'Social') ].
	self passiveList 
		addActionBlock: [ self openAddPassiveInterface ];
		removeActionBlock: [ self entityRemove: (
			CMEntityRemoveAnnouncement 
				named: self selectedPassiveListItem asValidCormasClassName
				type: 'Passive')  ].

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
					subMenu: self subMenuForEditPassiveEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entityPassiveSpecializeAction ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstractAction: self selectedPassiveListItem asValidCormasClassName ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self passiveList removeAction. ] ] ].
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
					subMenu: self subMenuForEditSocialEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entitySocialSpecializeAction ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tRename;
						action: [ self entitySocialRenameAction ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstractAction: self selectedSocialListItem asValidCormasClassName ] ] ].
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
					subMenu: self subMenuForEditSpatialEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entityAbstractAction: self selectedSpatialListItem asValidCormasClassName ];
						enabled: false ];
				addItem: [ : anItem | 
					anItem
						name: self translator tRename;
						action: [ self entitySpatialRenameAction ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self spatialList removeAction ] ] ].
	^ aMenu buildWithSpecAsPopup.
	
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddAgentInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a social entity "
	
	(CMSpecAgentAddInterface openFor: self projectManager)	
		owner: self socialList.
	" This is because openDialogWithSpec is not working right now "
	^ nil
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddPassiveInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a passive entity "
	
	(CMSpecPassiveAddInterface openFor: self projectManager)	
		owner: self passiveList.
	" This is because openDialogWithSpec is not working right now "
	^ nil
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openAddSpatialEntityInterface [
	" Private - Callback for opening UI. The user clicked the add button to add a spatial entity "

	(CMSpecSpatialEntityAddInterface openFor: self projectManager)	
		owner: self spatialList.
	" This is because openDialogWithSpec is not working right now "
	^ nil

]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> openEditAttributesFor: aClass [
	" Open the edit attributes window "

	self projectAnnouncer announce: (CMEditAttributesAnnouncement new targetClass: aClass).

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

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> passiveListSelectedClass [
	" Answer the currently selected item at the social list "

	^ self class environment 
		at: self passiveListSelection asValidCormasClassName
		ifAbsent: [ 
			self passiveList clickOnSelectedItem.
			self class environment 
				at: self passiveList selectionHolderItem value asValidCormasClassName
				ifAbsent: [ self error ] ]
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> passiveListSelection [
	" Answer the currently selected item at the spatial list "

	^ self passiveList selectedItem
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> selectedPassiveListItem [
	" Answer a <String> with the currently selected item in the passive list "

	^ self passiveList selectedItem
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> selectedSocialListItem [
	" Answer a <String> with the currently selected item in the social list "

	^ self socialList selectedItem
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> selectedSpatialListItem [
	" Answer a <String> with the currently selected item in the spatial list "

	^ self spatialList selectedItem
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

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> socialListSelectedClass [
	" Answer the currently selected item at the social list "

	| listSelection |
	listSelection := self socialListSelection asValidCormasClassName.
	^ self class environment 
		at: listSelection trimBoth asSymbol
		ifAbsent: [ 
			self socialList clickOnSelectedItem.
			self class environment 
				at: self socialList selectionHolderItem value asValidCormasClassName
				ifAbsent: [ self error ] ]
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> socialListSelection [
	" Answer the currently selected item at the spatial list "

	^ self socialList selectedItem
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
CMSpecEntitiesBrowser >> spatialListSelectedClass [
	" Answer the currently selected item at the spatial list "

	^ self class environment 
		at: self spatialListSelection asValidCormasClassName
		ifAbsent: [ 
			self spatialList clickOnSelectedItem.
			self class environment 
				at: self spatialList selectionHolderItem value asValidCormasClassName
				ifAbsent: [ self error ] ]
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> spatialListSelection [
	" Answer the currently selected item at the spatial list "

	^ self spatialList selectedItem
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> subMenuForEditPassiveEntity [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributesFor: self passiveListSelectedClass ] ];
				addItem: [ : item | 
					item 
						name: self translator tMethods;
						action: [ self entityEditPassiveMethods ] ];
				addItem: [ : item | 
					item 
						name: self translator tActivityDiagrams;
						action: [ self entityEditActivityDiagrams ] ];
				addItem: [ : item | 
					item 
						name: self translator tPoVSetter;
						action: [ self entityEditPoVSetter ] ] ]

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> subMenuForEditSocialEntity [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributesFor: self socialListSelectedClass ] ];
				addItem: [ : item | 
					item 
						name: self translator tMethods;
						action: [ self entityEditSocialMethods ] ];
				addItem: [ : item | 
					item 
						name: self translator tActivityDiagrams;
						action: [ self entityEditActivityDiagrams ] ];
				addItem: [ : item | 
					item 
						name: self translator tPoVSetter;
						action: [ self entityEditPoVSetter ] ] ]

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> subMenuForEditSpatialEntity [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributesFor: self spatialListSelectedClass ] ];
				addItem: [ : item | 
					item 
						name: self translator tMethods;
						action: [ self entityEditSpatialMethods ] ];
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
	^ String streamContents: [ : stream |
		stream
			<< 'Cormas - ';
			<< self cormasModelClass asString;
			<< ' - ';
			<< self translator tEntities ]
]
