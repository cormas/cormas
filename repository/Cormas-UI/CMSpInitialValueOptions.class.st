Class {
	#name : #CMSpInitialValueOptions,
	#superclass : #CMProjectSpPresenter,
	#instVars : [
		'numberRadio',
		'numberPresenter',
		'randomRadio',
		'randomPresenter',
		'booleanRadio',
		'booleanPresenter',
		'stringRadio',
		'stringPresenter',
		'collectionRadio',
		'collectionPresenter',
		'arrayRadio',
		'arrayPresenter',
		'newEntityRadio',
		'newEntityPresenter',
		'noValueRadio',
		'noValuePresenter',
		'editedValue'
	],
	#category : #'Cormas-UI-Spec2-Attributes'
}

{ #category : #specs }
CMSpInitialValueOptions class >> defaultSpec [

	^ SpGridLayout new
			beColumnHomogeneous;
			beRowHomogeneous;
			add: #numberRadio at: 1@1;
			add: #numberPresenter at: 2@1;
			add: #randomRadio at: 1@2;
			add: #randomPresenter at: 2@2;
			add: #booleanRadio at: 1@3;
			add: #booleanPresenter at: 2@3;
			add: #stringRadio at: 1@4;
			add: #stringPresenter at: 2@4;
			add: #collectionRadio at: 1@5;
			add: #collectionPresenter at: 2@5;
			add: #arrayRadio at: 1@6;
			add: #arrayPresenter at: 2@6;
			add: #newEntityRadio at: 1@7;
			add: #newEntityPresenter at: 2@7;
			add: #noValueRadio at: 1@8;
			add: #noValuePresenter at: 2@8;
			yourself
]

{ #category : #accessing }
CMSpInitialValueOptions >> arrayPresenter [

	^ arrayPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> arrayPresenter: anObject [

	arrayPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> arrayRadio [

	^ arrayRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> arrayRadio: anObject [

	arrayRadio := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> booleanPresenter [

	^ booleanPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> booleanPresenter: anObject [

	booleanPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> booleanRadio [

	^ booleanRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> booleanRadio: anObject [

	booleanRadio := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> collectionPresenter [

	^ collectionPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> collectionPresenter: anObject [

	collectionPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> collectionRadio [

	^ collectionRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> collectionRadio: anObject [

	collectionRadio := anObject
]

{ #category : #private }
CMSpInitialValueOptions >> edit: anObject [
	" Set anObject to be editable in the receiever "

	| widget widgetAccessor |
	
	widgetAccessor := self typesMapAt: anObject class.
	widget := self perform: widgetAccessor.
	self 
		perform: (self selectorMap at: widgetAccessor) asMutator
		with: anObject.
	widget click.
]

{ #category : #accessing }
CMSpInitialValueOptions >> editedValue [

	^ editedValue
]

{ #category : #accessing }
CMSpInitialValueOptions >> editedValue: anObject [

	editedValue := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> initializeLabels [

	self initialValueLabel label: self translator tInitialValueLabel.
	self numberRadioButton label: self translator tNumber.
	self randomRadioButton label: self translator tRandom.
	self booleanRadioButton label: self translator tBoolean.
	self stringRadioButton label: self translator tStringSymbol.
	self collectionRadioButton label: self translator tCollectionEmpty.
	self arrayRadioButton label: self translator tArray.
	self newEntityRadioButton label: self translator tNewEntity.
	self noValueRadioButton label: self translator tNoValue.
]

{ #category : #accessing }
CMSpInitialValueOptions >> initializePresenters [

	numberRadio := self newRadioButton label: 'Number'; state: false; yourself.
	numberPresenter := self newTextInput.
	randomRadio := self newRadioButton label: 'Random'; state: false; yourself.
	randomPresenter := self newTextInput.
	booleanRadio := self newRadioButton label: 'Boolean'; state: false; yourself.
	booleanPresenter := self newDropList items: #(true false); yourself. 
	stringRadio := self newRadioButton label: 'String'; state: false; yourself.
	stringPresenter := self newTextInput. 
	collectionRadio := self newRadioButton label: self translator tCollectionEmpty; state: false; yourself.
	collectionPresenter := self newDropList items: #(#OrderedCollection #Set #Dictionary); yourself. 
	arrayRadio := self newRadioButton label: 'Array'; state: false; yourself.
	arrayPresenter := self newTextInput. 
	newEntityRadio := self newRadioButton label: self translator tNewEntity; state: false; yourself.
	newEntityPresenter := self newTextInput. 
	noValueRadio := self newRadioButton label: 'No value'; state: false; yourself.
	noValuePresenter := self newTextInput.
	
	numberRadio associatedRadioButtons: { randomRadio . booleanRadio . stringRadio . collectionRadio . arrayRadio . newEntityRadio . noValueRadio }
]

{ #category : #accessing }
CMSpInitialValueOptions >> newEntityPresenter [

	^ newEntityPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> newEntityPresenter: anObject [

	newEntityPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> newEntityRadio [

	^ newEntityRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> newEntityRadio: anObject [

	newEntityRadio := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> noValuePresenter [

	^ noValuePresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> noValuePresenter: anObject [

	noValuePresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> noValueRadio [

	^ noValueRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> noValueRadio: anObject [

	noValueRadio := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> numberPresenter [

	^ numberPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> numberPresenter: anObject [

	numberPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> numberRadio [

	^ numberRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> numberRadio: anObject [

	numberRadio := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> randomPresenter [

	^ randomPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> randomPresenter: anObject [

	randomPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> randomRadio [

	^ randomRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> randomRadio: anObject [

	randomRadio := anObject
]

{ #category : #private }
CMSpInitialValueOptions >> selectorMap [

	^ Dictionary new
		at: 'numberRadioButton' put: #numberTextValue;
		at: 'stringRadioButton' put: #stringValue;
		at: 'booleanRadioButton' put: #booleanValue;
		at: 'collectionRadioButton' put: #collectionValue;
		at: 'arrayRadioButton' put: #arrayTextValue;
		at: 'newEntityRadioButton' put: #newEntityValue;
		yourself
]

{ #category : #accessing }
CMSpInitialValueOptions >> stringPresenter [

	^ stringPresenter
]

{ #category : #accessing }
CMSpInitialValueOptions >> stringPresenter: anObject [

	stringPresenter := anObject
]

{ #category : #accessing }
CMSpInitialValueOptions >> stringRadio [

	^ stringRadio
]

{ #category : #accessing }
CMSpInitialValueOptions >> stringRadio: anObject [

	stringRadio := anObject
]

{ #category : #private }
CMSpInitialValueOptions >> typesMap [

	^ Dictionary new
		at: Number put: #numberRadioButton;
		at: String put: #stringRadioButton;
		at: Boolean put: #booleanRadioButton;
		at: OrderedCollection put: #collectionRadioButton;
		at: Array put: #arrayRadioButton;
		at: Object put: #newEntityRadioButton;
		yourself
]

{ #category : #private }
CMSpInitialValueOptions >> typesMapAt: aClass [
	" Answer the selector <Symbol> associated to the radio button matching aClass 'type' "

	self typesMap keysDo: [ : classType |
		((aClass isKindOf: classType class) and: [ classType ~= Object ])
			ifTrue: [ ^ self typesMap at: classType ] ].
	^ self typesMap at: Object
]

{ #category : #private }
CMSpInitialValueOptions >> valueAccessorAt: aString [ 
	" Anwer <anOject> with the receiver's entered value at widget identified by aString "

	^ self perform: (self selectorMap at: aString)
]
