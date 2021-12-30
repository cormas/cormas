Class {
	#name : #CMSpViewAttributesPresenter,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'classAttributesTable',
		'classAttributesLabel',
		'selectedClass',
		'initialChooserPresenter'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpViewAttributesPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom 
		add: #classAttributesLabel height: self labelHeight;
		add: #classAttributesTable;
		yourself.
]

{ #category : #examples }
CMSpViewAttributesPresenter class >> example [

	^ (self on: (CMProjectManager newMockProjectNamed: 'Mock1')) openWithSpec
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> beSelected [

	self classAttributesTable selectedItem
		ifNotNil: [ : sel | 
			self classAttributesTable update.		
			self classAttributesTable unselectAll. ].
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> candidateSetters: varName [
	" Private - Answer a <Collection> of possible setters pairs for instVarName in receiver's class, both in class and instance sides "

	^ { 
		((varName , '_default') asSymbol) -> self selectedClass .
		varName asSymbol -> self selectedClass .
		
		((varName uncapitalized , '_default') asSymbol) -> self selectedClass .
		varName uncapitalized asSymbol -> self selectedClass .

		((varName , '_default') asSymbol) -> self selectedClass basicNew .
		varName asSymbol -> self selectedClass basicNew
		}
		
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesLabel [

	^ classAttributesLabel
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesLabel: anObject [

	classAttributesLabel := anObject
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesTable [

	^ classAttributesTable
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> classAttributesTable: anObject [

	classAttributesTable := anObject
]

{ #category : #private }
CMSpViewAttributesPresenter >> collectAttributes [

	^ self selectedClass instVarNames , self selectedClass classVarNames
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> defaultValueFor: instVarName [
	" Answer the default value of anAttribut (static or instance) of aClass, using the  'anAttribut_default' accessor  located into the ' - default value ' protocol.
Compatibility with previous Cormas version: before changing, it tests if the default class method exists otherwise compiles it
	anAttribut = <Symbol>
	aClass = <Class>"

	self selectedClass isGenericEntity ifTrue: [ ^ nil ].
	^ (self candidateSetters: instVarName)
		detect: [ : assocSelectorClass | (self tryMethod: assocSelectorClass key onClass: assocSelectorClass value) notNil ]
		ifFound: [ : assocSelectorClass | (self tryMethod: assocSelectorClass key onClass: assocSelectorClass value) ]
		ifNone: [ nil ].

]

{ #category : #initialization }
CMSpViewAttributesPresenter >> initializePresenters [ 

	classAttributesLabel := self newLabel label: self label.
	classAttributesTable := self newTable
		beResizable;
		addColumn: (SpStringTableColumn title: 'Type' evaluated: [ : instVarName | self typeValueFor: instVarName ]);
		addColumn: (SpStringTableColumn title: 'Attribute' evaluated: [ : each | each asString ]);
		addColumn: (SpStringTableColumn title: 'Initial Value' evaluated: [ : instVarName | (self defaultValueFor: instVarName) asString ]);
		whenSelectionChangedDo: [ : sel | sel isEmpty ifFalse: [ self selectionChanged: sel ] ];
		yourself
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> label [

	^ self translator tAttributesSuperLabel.
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> selectedClass [

	^ selectedClass
]

{ #category : #accessing }
CMSpViewAttributesPresenter >> selectedClass: anObject [

	selectedClass := anObject
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> selectionChanged: sel [

	initialChooserPresenter := self instantiate: CMSpInitialValueChooser on: self projectManager.
	self layout: (SpBoxLayout newLeftToRight 
			add: self class defaultSpec;
			add: #initialChooserPresenter);
			yourself
]

{ #category : #private }
CMSpViewAttributesPresenter >> tryMethod: aSelector onClass: aClassOrInstance [
	
	| result |
	
	^ [ result := aClassOrInstance perform: aSelector ]
	on: Exception
	do: [ : ex | nil  ]
]

{ #category : #initialization }
CMSpViewAttributesPresenter >> typeValueFor: instVarName [

	^ (self selectedClass hasClassVarNamed: instVarName)
		ifTrue: [ 'class' ]
		ifFalse: [ 
			(self selectedClass hasInstVarNamed: instVarName)
				ifTrue: [ 'instance' ]
				ifFalse: [ 'class instance' ] ]
]

{ #category : #callbacks }
CMSpViewAttributesPresenter >> updateAttributesFrom: aClass [

	self selectedClass: aClass.
	self classAttributesTable items: self collectAttributes
]
