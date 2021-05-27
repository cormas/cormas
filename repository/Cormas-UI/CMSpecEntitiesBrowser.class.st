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

	self entityAbstract: (CMEntityAbstractAnnouncement named: (selectedEntity asValidCormasClassName: self projectManager cormasProjectName))
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> entityClassesFor: entityTypeString [
	" Answer a <Collection> of classes of entityTypeString type "

	^ self cormasModelClass perform: (entityTypeString asLowercase , 'Classes') asSymbol
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditActivityDiagrams [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditMethods: selectedClass [
	" Open a browser tool to edit the receiver's model initialization "

	selectedClass ifNotNil: [ self openBrowserAt: selectedClass tag: #control ]
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditPassiveMethods [
	" Open a browser tool to edit the receiver's model initialization "

	self openBrowserAt: self passiveListSelectionRealClass tag: #control
	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditPoVSetter [
	self shouldBeImplemented.
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditSocialMethods [
	" Open a browser tool to edit the receiver's model initialization "

	self openBrowserAt: self socialListSelectionRealClass tag: #control

	
]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityEditSpatialMethods [
	" Open a browser tool to edit the receiver's model initialization "

	self openBrowserAt: self spatialListSelectionRealClass tag: #control

	
]

{ #category : #'accessing - specialization' }
CMSpecEntitiesBrowser >> entityPassiveSpecializeAction [

	| ann |
	ann := CMEntitySpecializeAnnouncement
		named: self passiveListSelectionRealClassSymbol
		type: 'Passive'.
	self entitySpecialize: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self informMessage: 'Entity class ' , ann entityName asString , ' not found' ].
	self passiveList addItem: ann entityName.
	self passiveList items: (self initializeListsContents: 'Passive').
	

]

{ #category : #callbacks }
CMSpecEntitiesBrowser >> entityRemove: realClassGetter type: aString [
	" Private - Ask for confirmation to remove the entity contained in aCMEntityRemoveAnnouncement "

	(self confirm: self translator tConfirmDeleteEntity)
		ifTrue: [ 
			self projectAnnouncer announce: ((CMEntityRemoveAnnouncement named: (self perform: realClassGetter) type: aString)).
			^ true ].
	^ false
]

{ #category : #'accessing - renaming' }
CMSpecEntitiesBrowser >> entityRename: anAnnouncement [
	" Private - Since the class is going to be renamed, we set the oldName as the Symbol name of the class to delete it from the list "
	| className |
	
	(className := UIManager default 
		request: self translator tRenameEntityDialogText 
		initialAnswer: anAnnouncement entityName) isEmptyOrNil 
			ifTrue: [ ^ self ].
	self projectAnnouncer announce: (
		anAnnouncement 
			oldName: anAnnouncement entityName name;
			entityName: (className asValidCormasClassName: self projectManager cormasProjectName)).

]

{ #category : #'accessing - renaming' }
CMSpecEntitiesBrowser >> entityRenameAction: listGetter selection: selectionGetter type: listName [

	| ann theList |
	
	theList := self perform: listGetter.
	ann := CMEntityRenameAnnouncement
		named: (self perform: selectionGetter)
		type: listName.

	self entityRename: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self informMessage: 'Entity class ' , ann entityName asString , ' not found' ].
	(theList includes: ann entityName)
		ifTrue: [ ^ self informMessage: 'There is already a ' , ann entityName ].
	theList addItem: ann entityName.
	theList remove: ann oldName.

]

{ #category : #'accessing - specialization' }
CMSpecEntitiesBrowser >> entitySocialSpecializeAction [

	| ann |
	ann := CMEntitySpecializeAnnouncement
		named: self socialListSelectionRealClassSymbol
		type: 'Social'.
	self entitySpecialize: ann.
	(Smalltalk hasClassNamed: ann entityName)
		ifFalse: [ ^ self informMessage: 'Entity class ' , ann entityName asString , ' not found' ].
	(self socialList includes: ann entityName)
		ifTrue: [ ^ self informMessage: 'There is already a ' , ann entityName ].
	self socialList addItem: ann entityName.
	self socialList items: (self initializeListsContents: 'Social').
	

]

{ #category : #'accessing - specialization' }
CMSpecEntitiesBrowser >> entitySpecialize: anAnnouncement [

	| className |
	
	(className := UIManager default 
		request: self translator tSpecializeEntityDialogText 
		initialAnswer: anAnnouncement entityName
		title: (self formattedWindowTitle: self translator tSpecialization)) isEmptyOrNil
			ifTrue: [ ^ self ].
	self projectAnnouncer announce: (
		anAnnouncement 
			superclass: anAnnouncement entityName;
			entityName: (className asValidCormasClassName: self projectManager cormasProjectName)).

]

{ #category : #initialization }
CMSpecEntitiesBrowser >> formatItem: className [
	" Answer a <String> formatted to be displayed in the receiver's lists "
	
	^ String streamContents: [ : stream |
		stream 
			nextPutAll: (String new: (className count: #isSpaceSeparator));
			nextPutAll: (className trimLeft allButFirst: 2) ]
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
	highLevelClasses := self rejectEntitySuperclassesIn: (self entityClassesFor: entityTypeString).
	(highLevelClasses asSortedCollection: [ : i : j | i name < j name]) 
		do: [ : entityClass | 
			(entityClass cmPrintHierarchy findTokens: Character cr)
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
		displayBlock: [ : className | self formatItem: className ];
		addActionBlock: [ self openAddSpatialEntityInterface ];
		removeActionBlock: [ self entityRemove: #spatialListSelectionRealClassSymbol type: 'Spatial' ].
	self socialList 
		displayBlock: [ : className | self formatItem: className ];
		addActionBlock: [ self openAddAgentInterface ];
		removeActionBlock: [ self entityRemove: #socialListSelectionRealClassSymbol type: 'Social' ].
	self passiveList 
		displayBlock: [ : className | self formatItem: className ];
		addActionBlock: [ self openAddPassiveInterface ];
		removeActionBlock: [ self entityRemove: #passiveListSelectionRealClassSymbol type: 'Passive' ].

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
						name: self translator tRename;
						action: [ self entityRenameAction: #passiveList selection: #passiveListSelectionRealClass type: 'Passive' ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstractAction: self selectedPassiveListItem ] ] ];
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
						action: [ self entityRenameAction: #socialList selection: #socialListSelectionRealClass type: 'Social' ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstractAction: self selectedSocialListItem ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self socialList removeAction. ] ] ].
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
						action: [ self entityAbstractAction: self selectedSpatialListItem ];
						enabled: false ];
				addItem: [ : anItem | 
					anItem
						name: self translator tRename;
						action: [ self entityRenameAction: #spatialList selection: #spatialListSelectionRealClass type: 'Spatial' ] ] ];
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
CMSpecEntitiesBrowser >> passiveListSelection [
	" Answer the currently selected item at the spatial list "

	^ self passiveList selectedItem
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> passiveListSelectionRealClass [
	" Answer the <Class> represented by the currently selected item at the passive list "

	| selection cmFormattedSelection |
	
	selection := self passiveList selectionHolderItem value.
	cmFormattedSelection := selection asValidCormasClassName: self projectManager cormasProjectName.
	
	^ self class environment 
		at: self passiveListSelectionRealClassSymbol
		ifAbsent: [ 
			self passiveList clickOnSelectedItem.
			self class environment 
				at: selection asSymbol
				ifAbsent: [ self class environment at: cmFormattedSelection ] ]

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> passiveListSelectionRealClassSymbol [
	" Answer the currently selected item at the passive list "

	^ self passiveListSelection asValidCormasClassName: self projectManager cormasProjectName.
]

{ #category : #accessing }
CMSpecEntitiesBrowser >> rejectEntitySuperclassesIn: aCollectionOfEntities [
	" Answer a <Collection> of entity classes without their superclasses "

	^ aCollectionOfEntities 
		collect: [ : anEntity | self class environment at: anEntity ifAbsent: [ self class environment at: anEntity name ] ]
		thenReject: [ : entityClass | entityClass cmEnvironment includes: entityClass superclass ]
	

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
CMSpecEntitiesBrowser >> socialListSelection [
	" Answer the currently selected item at the spatial list "

	^ self socialList selectedItem
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> socialListSelectionRealClass [
	" Answer the currently selected item at the social list "

	| selection cmFormattedSelection |
	
	selection := self socialList selectionHolderItem value.
	cmFormattedSelection := selection asValidCormasClassName: self projectManager cormasProjectName.
	
	^ self class environment 
		at: self socialListSelectionRealClassSymbol
		ifAbsent: [ 
			self socialList clickOnSelectedItem.
			self class environment 
				at: selection asSymbol
				ifAbsent: [ self class environment at: cmFormattedSelection ] ]
			
		

]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> socialListSelectionRealClassSymbol [
	" Answer a <Symbol> representing the CORMAS class selected at the social list "

	^ self socialListSelection asValidCormasClassName: self projectManager cormasProjectName.
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
CMSpecEntitiesBrowser >> spatialListSelectionRealClass [
	" Answer the currently selected item at the spatial list "

	| selection cmFormattedSelection |
	
	selection := self spatialList selectionHolderItem value.
	cmFormattedSelection := selection asValidCormasClassName: self projectManager cormasProjectName.
	
	^ self class environment 
		at: self spatialListSelectionRealClassSymbol
		ifAbsent: [ 
			self spatialList clickOnSelectedItem.
			self class environment 
				at: selection asSymbol
				ifAbsent: [ self class environment at: cmFormattedSelection ] ]
		
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> spatialListSelectionRealClassSymbol [
	" Answer the currently selected item at the spatial list "

	^ self selectedSpatialListItem asValidCormasClassName: self projectManager cormasProjectName.
]

{ #category : #'accessing-menu' }
CMSpecEntitiesBrowser >> subMenuForEditPassiveEntity [

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributesFor: self passiveListSelectionRealClass ] ];
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
						action: [ self openEditAttributesFor: self socialListSelectionRealClass ] ];
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
						action: [ self openEditAttributesFor: self spatialListSelectionRealClass ] ];
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
	" Private - See superimplementor's comment "

	^ self formattedWindowTitle: self translator tEntities
]
