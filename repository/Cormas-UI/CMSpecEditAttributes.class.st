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
		'targetAttributesTable',
		'tAttributesLabel',
		'toolbarAttributeActions',
		'toolbar'
	],
	#category : 'Cormas-UI-Core'
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
					add: #targetAttributesTable;
					add: #toolbarAttributeActions height: self toolbarHeight;
					add: #toolbar height: self toolbarHeight ]

]

{ #category : #private }
CMSpecEditAttributes >> attributesTableMenu [
	" Private - Configure the contextual menu items for receiver's tables "

	| aMenu |
	aMenu := MenuModel new.
	"showEntryItemMenu ifTrue: [ self addMenuItemsForSelectedItemsIn:	aMenu ]."
	^ aMenu buildWithSpecAsPopup
]

{ #category : #initialization }
CMSpecEditAttributes >> initialExtent [
	^ 600 @ 400
]

{ #category : #initialization }
CMSpecEditAttributes >> initializeAttributeTables [

	{ 'Class' . 'Attribute' . 'Value' } do: [ : attName | 
		self superclassesAttributesTable addColumn: (FTColumn id: attName).
		self targetAttributesTable addColumn: (FTColumn id: attName) ].
	"numberOfColumns: 3 withWidths: #(250 250 50);"

	self superclassesAttributesTable
		display: [ : attItem | self wrapItem: attItem ];
		menu: [ self menuMorphForSelectedItems ].
	
	self targetAttributesTable
		display: [ : attItem | self morphForItemAt: attItem ];
		menu: [ self menuMorphForSelectedItems ].

]

{ #category : #initialization }
CMSpecEditAttributes >> initializePresenter [
	
]

{ #category : #initialization }
CMSpecEditAttributes >> initializeWidgets [
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			superclassesAttributesTable 	SpcFastTable 
			sAttributesLabel 					LabelModel 
			targetAttributesTable 			SpcFastTable 
			tAttributesLabel 					LabelModel
			toolbarAttributeActions 			CMSpecAttributesToolbar
			toolbar 								SpcTwoButtonToolbar).

	self initializeAttributeTables.
	self sAttributesLabel label: self translator tAttributesSuperLabel.
	self tAttributesLabel label: self translator tAttributesTargetLabel.
	self toolbar 
		firstButtonLabel: self translator tReset;
		secondButtonLabel: self translator tApply.
	self focusOrder
		add: superclassesAttributesTable;
		add: targetAttributesTable
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

{ #category : #accessing }
CMSpecEditAttributes >> targetAttributesTable [
	" Answer the targetAttributesTable of this CMSpecEditAttributes "

	^ targetAttributesTable
]

{ #category : #accessing }
CMSpecEditAttributes >> targetAttributesTable: anObject [
	" Sets the targetAttributesTable of this CMSpecEditAttributes "

	targetAttributesTable := anObject
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

{ #category : #initialization }
CMSpecEditAttributes >> wrapItem: attItem [

	^ { attItem . attItem . attItem }
]
