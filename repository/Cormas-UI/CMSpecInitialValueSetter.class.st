"
CMSpecInitialValueSetter example.

Internal Representation and Key Implementation Points.

    Instance Variables
	arrayRadioButton:		<Object>
	arrayTextField:		<Object>
	booleanList:		<Object>
	booleanRadioButton:		<Object>
	collectionList:		<Object>
	collectionRadioButton:		<Object>
	initialValueLabel:		<Object>
	newEntityRadioButton:		<Object>
	newEntityTextField:		<Object>
	noValueRadioButton:		<Object>
	numberRadioButton:		<Object>
	numberTextField:		<Object>
	randomRadioButton:		<Object>
	randomTextField:		<Object>
	stringRadioButton:		<Object>
	stringTextField:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecInitialValueSetter,
	#superclass : #CMSpecObject,
	#instVars : [
		'numberRadioButton',
		'randomRadioButton',
		'booleanRadioButton',
		'stringRadioButton',
		'collectionRadioButton',
		'arrayRadioButton',
		'newEntityRadioButton',
		'noValueRadioButton',
		'numberTextField',
		'randomTextField',
		'booleanList',
		'stringTextField',
		'collectionList',
		'arrayTextField',
		'newEntityTextField',
		'initialValueLabel'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecInitialValueSetter class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ : column |
			column 
				newRow: [ : r |	r add: #initialValueLabel ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #numberRadioButton; add: #numberTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #randomRadioButton; add: #randomTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #booleanRadioButton; add: #booleanList ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #stringRadioButton; add: #stringTextField ] height: self inputTextHeight;
				newRow: [ : r |	r add: #collectionRadioButton; add: #collectionList ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #arrayRadioButton; add: #arrayTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #newEntityRadioButton; add: #newEntityTextField ] height: self inputTextHeight;
				newRow: [ : r |	r add: #noValueRadioButton ] height: self inputTextHeight + 4;
					
				newRow: [ : r |	 ] 	] 			
		yourself
]

{ #category : #example }
CMSpecInitialValueSetter class >> example [

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: (CMTranslator newForLanguage: #EN);
		initialize;
		openWithSpec
]

{ #category : #accessing }
CMSpecInitialValueSetter >> arrayRadioButton [
	^ arrayRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> arrayRadioButton: anObject [
	arrayRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> arrayTextField [
	^ arrayTextField
]

{ #category : #accessing }
CMSpecInitialValueSetter >> arrayTextField: anObject [
	arrayTextField := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> arrayTextValue [

	^ self arrayTextField text 
		ifEmpty: [ self arrayTextField pendingText ]
		ifNotEmpty: [ : textVal | textVal ].
	
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> arrayTextValue: aString [ 
	
	self arrayTextValue text: aString asString
]

{ #category : #accessing }
CMSpecInitialValueSetter >> booleanList [
	^ booleanList
]

{ #category : #accessing }
CMSpecInitialValueSetter >> booleanList: anObject [
	booleanList := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> booleanRadioButton [
	^ booleanRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> booleanRadioButton: anObject [
	booleanRadioButton := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> booleanValue [

	^ self booleanList selectedItem
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> booleanValue: aBoolean [ 

	self booleanList setSelectedItem: aBoolean
]

{ #category : #accessing }
CMSpecInitialValueSetter >> collectionList [
	^ collectionList
]

{ #category : #accessing }
CMSpecInitialValueSetter >> collectionList: anObject [
	collectionList := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> collectionRadioButton [
	^ collectionRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> collectionRadioButton: anObject [
	collectionRadioButton := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> collectionValue [

	^ self collectionList selectedItem.
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> collectionValue: aValue [

	^ self collectionList setSelectedItem: aValue.
]

{ #category : #private }
CMSpecInitialValueSetter >> edit: anObject [
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
CMSpecInitialValueSetter >> initialValueLabel [
	^ initialValueLabel
]

{ #category : #accessing }
CMSpecInitialValueSetter >> initialValueLabel: anObject [
	initialValueLabel := anObject
]

{ #category : #initialization }
CMSpecInitialValueSetter >> initializeLabels [

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

{ #category : #initialization }
CMSpecInitialValueSetter >> initializePresenter [

	self booleanList items: #(true false).
	self collectionList items: #(#OrderedCollection #Set #Dictionary).
	

]

{ #category : #initialization }
CMSpecInitialValueSetter >> initializeWidgets [

	self
		instantiateModels: #(
			initialValueLabel 			LabelModel		
			numberRadioButton 			SpcRadioButtonModel
			numberTextField 			TextInputFieldModel						
			randomRadioButton 			SpcRadioButtonModel
			randomTextField 			TextInputFieldModel
			booleanRadioButton 		SpcRadioButtonModel
			booleanList 					DropListModel					
			stringRadioButton 			SpcRadioButtonModel
			stringTextField 			TextInputFieldModel						
			collectionRadioButton 	SpcRadioButtonModel
			collectionList				DropListModel
			arrayRadioButton 			SpcRadioButtonModel
			arrayTextField 				TextInputFieldModel
			newEntityRadioButton 		SpcRadioButtonModel
			newEntityTextField 		TextInputFieldModel			
			noValueRadioButton			SpcRadioButtonModel).
						
	self initializeLabels.
	self setFocus.
	self setGroup
]

{ #category : #accessing }
CMSpecInitialValueSetter >> newEntityRadioButton [
	^ newEntityRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> newEntityRadioButton: anObject [
	newEntityRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> newEntityTextField [
	^ newEntityTextField
]

{ #category : #accessing }
CMSpecInitialValueSetter >> newEntityTextField: anObject [
	newEntityTextField := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> newEntityValue [

	| enteredText |
	
	enteredText := self newEntityTextField text 
		ifEmpty: [ self newEntityTextField pendingText ]
		ifNotEmpty: [ : textVal | textVal ].
	^ enteredText

]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> newEntityValue: aValue [

	newEntityTextField text: aValue asString


]

{ #category : #accessing }
CMSpecInitialValueSetter >> noValueRadioButton [
	^ noValueRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> noValueRadioButton: anObject [
	noValueRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> numberRadioButton [
	^ numberRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> numberRadioButton: anObject [
	numberRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> numberTextField [
	^ numberTextField
]

{ #category : #accessing }
CMSpecInitialValueSetter >> numberTextField: anObject [
	numberTextField := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> numberTextValue [

	| enteredText |
	
	enteredText := self numberTextField text 
		ifEmpty: [ self numberTextField pendingText ]
		ifNotEmpty: [ : textVal | textVal ].
	enteredText isNumeric
		ifFalse: [ ^ self inform: 'Please enter a Number' ].
	^ enteredText asNumber
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> numberTextValue: anInteger [ 
	
	self numberTextField text: anInteger asString
]

{ #category : #initialization }
CMSpecInitialValueSetter >> on: button show: aMorph [

	button whenActivatedDo: [ self requestText: self translator tFillArray title: 'CORMAS' ].

]

{ #category : #accessing }
CMSpecInitialValueSetter >> randomRadioButton [
	^ randomRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> randomRadioButton: anObject [
	randomRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> randomTextField [
	^ randomTextField
]

{ #category : #accessing }
CMSpecInitialValueSetter >> randomTextField: anObject [
	randomTextField := anObject
]

{ #category : #private }
CMSpecInitialValueSetter >> selectorMap [

	^ Dictionary new
		at: 'numberRadioButton' put: #numberTextValue;
		at: 'stringRadioButton' put: #stringValue;
		at: 'booleanRadioButton' put: #booleanValue;
		at: 'collectionRadioButton' put: #collectionValue;
		at: 'arrayRadioButton' put: #arrayTextValue;
		at: 'newEntityRadioButton' put: #newEntityValue;
		yourself
]

{ #category : #initialization }
CMSpecInitialValueSetter >> setFocus [
	
"	self focusOrder
		add: button1;
		add: button2;
		add: button3.
	"
]

{ #category : #initialization }
CMSpecInitialValueSetter >> setGroup [

	RadioButtonGroupModel new
		addRadioButton: numberRadioButton;
		addRadioButton: randomRadioButton;
		addRadioButton: booleanRadioButton;
		addRadioButton: stringRadioButton;
		addRadioButton: collectionRadioButton;
		addRadioButton: arrayRadioButton;
		addRadioButton: newEntityRadioButton;
		addRadioButton: noValueRadioButton;
		default: numberRadioButton.
]

{ #category : #accessing }
CMSpecInitialValueSetter >> stringRadioButton [
	^ stringRadioButton
]

{ #category : #accessing }
CMSpecInitialValueSetter >> stringRadioButton: anObject [
	stringRadioButton := anObject
]

{ #category : #accessing }
CMSpecInitialValueSetter >> stringTextField [
	^ stringTextField
]

{ #category : #accessing }
CMSpecInitialValueSetter >> stringTextField: anObject [
	stringTextField := anObject
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> stringValue [

	| enteredText |
	
	enteredText := self stringTextField text 
		ifEmpty: [ self stringTextField pendingText ]
		ifNotEmpty: [ : textVal | textVal ].
	enteredText isNumeric
		ifTrue: [ ^ self inform: 'Please enter a String' ].
	^ enteredText string
]

{ #category : #'accessing - values' }
CMSpecInitialValueSetter >> stringValue: aString [ 
	
	self stringTextField text: aString asString
]

{ #category : #private }
CMSpecInitialValueSetter >> typesMap [

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
CMSpecInitialValueSetter >> typesMapAt: aClass [
	" Answer the selector <Symbol> associated to the radio button matching aClass 'type' "

	self typesMap keysDo: [ : classType |
		((aClass isKindOf: classType class) and: [ classType ~= Object ])
			ifTrue: [ ^ self typesMap at: classType ] ].
	^ self typesMap at: Object
]

{ #category : #accessing }
CMSpecInitialValueSetter >> valueAccessorAt: aString [ 
	" Anwer <anOject> with the receiver's entered value at widget identified by aString "

	^ self perform: (self selectorMap at: aString)
]
