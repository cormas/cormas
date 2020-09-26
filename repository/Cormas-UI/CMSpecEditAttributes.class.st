"
CMSpecEditAttributes example.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSpecEditAttributes,
	#superclass : #CMSpecObject,
	#instVars : [
		'superclassesAttributesTable',
		'sAttributesLabel',
		'tAttributesLabel',
		'toolbarAttributeActions',
		'toolbar',
		'targetClass',
		'classAttributesTable'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #initialization }
CMSpecEditAttributes class >> defaultSpec [
	<spec>
	^ SpecLayout composed
			newColumn: [ : r |
				r
					add: #sAttributesLabel height: self toolbarHeight;
					add: #superclassesAttributesTable;
					add: #tAttributesLabel height: self toolbarHeight;
					add: #classAttributesTable;
					add: #toolbarAttributeActions height: self toolbarHeight;
					add: #toolbar height: self toolbarHeight ]

]

{ #category : #'instance creation' }
CMSpecEditAttributes class >> for: aClass owner: owner [
	" Answer a new instance of the receiver configuring project settings "
	
	^ self basicNew
		owner: owner;
		projectManager: owner projectManager;
		targetClass: aClass;
		initialize;
		yourself.
]

{ #category : #private }
CMSpecEditAttributes >> attributesTableMenu [
	" Private - Configure the contextual menu items for receiver's tables "

	| aMenu |
	aMenu := MenuModel new.
	"showEntryItemMenu ifTrue: [ self addMenuItemsForSelectedItemsIn:	aMenu ]."
	^ aMenu buildWithSpecAsPopup
]

{ #category : #accessing }
CMSpecEditAttributes >> classAttributesTable [
	" Answer the targetAttributesTable of this CMSpecEditAttributes "

	^ classAttributesTable
]

{ #category : #accessing }
CMSpecEditAttributes >> classAttributesTable: anObject [
	" Sets the targetAttributesTable of this CMSpecEditAttributes "

	classAttributesTable := anObject
]

{ #category : #private }
CMSpecEditAttributes >> configureTable: aTable for: attAssoc [

	aTable
		addColumn: ((FTColumn id: attAssoc key) width: attAssoc value);
		beResizable;
		intercellSpacing: 2 @ 1

]

{ #category : #callbacks }
CMSpecEditAttributes >> editSelectedCell: index inTable: anAttributesTable [

	| morph ed |

	morph :=anAttributesTable visibleRowMorphAtIndex: index.
	ed := RubFloatingEditorBuilder new 
		customizeEditorWith: [ :editor | 
			editor scrollbarsShowNever.
			editor bounds: (morph bounds insetBy:
									(Margin
										left: -2
										top: 0
										right: 0
										bottom: 0)) ];
		withEditedContentsDo: [ : editedContents | 
			(anAttributesTable dataSource elementAt: index) currentValue: editedContents.
			anAttributesTable listWidget refresh].
	^ ed
]

{ #category : #initialization }
CMSpecEditAttributes >> initialExtent [
	^ 600 @ 400
]

{ #category : #initialization }
CMSpecEditAttributes >> initializeAttributeTables [

	self tableColumns do: [ : attAssoc | 
		self 
			configureTable: self superclassesAttributesTable for: attAssoc;
			configureTable: self classAttributesTable for: attAssoc ].

	self initializeSuperclassAttributeTable.
	self initializeClassAttributeTable.


]

{ #category : #initialization }
CMSpecEditAttributes >> initializeClassAttributeTable [

	self classAttributesTable 
		dataSource: (CMClassAttributeValueDataSource forClass: self targetClass);
		beCellSelection;
		onAnnouncement: FTStrongSelectionChanged do: [ : ann | 
			| ed index |
			index := ann selectedIndex first.
			ed := self editSelectedCell: index inTable: self classAttributesTable.
			ed openEditorWithContents: (self classAttributesTable dataSource elementAt: index) currentValueAsString ].
"		display: [ : attItem | self morphForItemAt: attItem ];
		menu: [ self menuMorphForSelectedItems ]."

]

{ #category : #initialization }
CMSpecEditAttributes >> initializeFocus [

	self focusOrder
		add: superclassesAttributesTable;
		add: classAttributesTable

]

{ #category : #initialization }
CMSpecEditAttributes >> initializePresenter [

	self sAttributesLabel label: self translator tAttributesSuperLabel.
	self tAttributesLabel label: self translator tAttributesTargetLabel.
]

{ #category : #initialization }
CMSpecEditAttributes >> initializeSuperclassAttributeTable [

	self superclassesAttributesTable 
		dataSource: (CMClassAttributeValueDataSource forSuperclass: self targetClass);
		beCellSelection;
		onAnnouncement: FTStrongSelectionChanged do: [ : ann | 
			| ed index |
			index := ann selectedIndex first.
			ed := self editSelectedCell: index inTable: self superclassesAttributesTable.
			ed openEditorWithContents: (self superclassesAttributesTable dataSource elementAt: index) currentValueAsString ].

]

{ #category : #initialization }
CMSpecEditAttributes >> initializeToolbar [

	self toolbar 
		firstButtonLabel: self translator tReset;
		secondButtonLabel: self translator tApply.
]

{ #category : #initialization }
CMSpecEditAttributes >> initializeWidgets [
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			superclassesAttributesTable 	SpcTablePresenter 
			sAttributesLabel 					LabelModel 
			#classAttributesTable 			SpcTablePresenter 
			tAttributesLabel 					LabelModel
			toolbarAttributeActions 			CMSpecAttributesToolbar
			toolbar 								SpcTwoButtonToolbar).
	self 
		initializeAttributeTables; 
		initializeToolbar;
		initializeFocus.

]

{ #category : #accessing }
CMSpecEditAttributes >> sAttributesLabel [
	" Answer the sAttributesLabel of this CMSpecEditAttributes "

	^ sAttributesLabel
]

{ #category : #accessing }
CMSpecEditAttributes >> sAttributesLabel: anObject [
	" Sets the sAttributesLabel of this CMSpecEditAttributes "

	sAttributesLabel := anObject
]

{ #category : #accessing }
CMSpecEditAttributes >> superclassesAttributesTable [
	" Answer the superclassesAttributesTable of this CMSpecEditAttributes "

	^ superclassesAttributesTable
]

{ #category : #accessing }
CMSpecEditAttributes >> superclassesAttributesTable: anObject [
	" Sets the superclassesAttributesTable of this CMSpecEditAttributes "

	superclassesAttributesTable := anObject
]

{ #category : #accessing }
CMSpecEditAttributes >> tAttributesLabel [
	" Answer the tAttributesLabel of this CMSpecEditAttributes "

	^ tAttributesLabel
]

{ #category : #accessing }
CMSpecEditAttributes >> tAttributesLabel: anObject [
	" Sets the tAttributesLabel of this CMSpecEditAttributes "

	tAttributesLabel := anObject
]

{ #category : #private }
CMSpecEditAttributes >> tableColumns [

	^ { '#' -> 40 . 
	'Class' -> 200 . 
	'Attribute' -> 200 . 
	'Value' -> 200 } 
]

{ #category : #accessing }
CMSpecEditAttributes >> targetClass [
	^ targetClass
]

{ #category : #accessing }
CMSpecEditAttributes >> targetClass: anObject [
	targetClass := anObject
]

{ #category : #initialization }
CMSpecEditAttributes >> title [
	^ 'Attributes'
]

{ #category : #accessing }
CMSpecEditAttributes >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMSpecEditAttributes >> toolbar: anObject [
	toolbar := anObject
]

{ #category : #accessing }
CMSpecEditAttributes >> toolbarAttributeActions [
	^ toolbarAttributeActions
]

{ #category : #accessing }
CMSpecEditAttributes >> toolbarAttributeActions: anObject [
	toolbarAttributeActions := anObject
]
