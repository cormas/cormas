Class {
	#name : #CMSpecStepMethodChoice,
	#superclass : #CMSpecObject,
	#instVars : [
		'selectMethodLabel',
		'methodsLabeledList',
		'finalStepLabeledTextInput',
		'randomnessCheckbox',
		'toolbar'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecStepMethodChoice class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
		newColumn: [ : c | 
			c
				add: #methodsLabeledList;
				newRow: [ : r | r add: #finalStepLabeledTextInput left: 350 ] height: self toolbarHeight;
				add: #randomnessCheckbox height: self toolbarHeight;
				add: #toolbar height: self toolbarHeight ]
]

{ #category : #example }
CMSpecStepMethodChoice class >> example [

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: CMEnglishTranslator new;
		initialize;
		openWithSpec
]

{ #category : #accessing }
CMSpecStepMethodChoice >> finalStepLabeledTextInput [
	" Answer the finalStepLabeledTextInput of this CMSpecStepMethodChoice "

	^ finalStepLabeledTextInput
]

{ #category : #accessing }
CMSpecStepMethodChoice >> finalStepLabeledTextInput: anObject [
	" Sets the finalStepLabeledTextInput of this CMSpecStepMethodChoice "

	finalStepLabeledTextInput := anObject
]

{ #category : #initialization }
CMSpecStepMethodChoice >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400

]

{ #category : #initialization }
CMSpecStepMethodChoice >> initializeFocus [
	" Private - See superimplementor's comment "

	self focusOrder
		add: self methodsLabeledList;
	add: self finalStepLabeledTextInput;
	add: self randomnessCheckbox;
	add: self toolbar. 
]

{ #category : #initialization }
CMSpecStepMethodChoice >> initializePresenter [
	" Private - See superimplementor's comment "

	self toolbar 
		firstButtonLabel: self translator tCancel;
		firstButtonAction: [ self delete ];
		secondButtonLabel: self translator tApply;
		secondButtonAction: [ self halt ]
]

{ #category : #initialization }
CMSpecStepMethodChoice >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		methodsLabeledList				SpcLabeledList		
		finalStepLabeledTextInput	SpcLabeledTextField
		randomnessCheckbox				CheckBoxModel
		toolbar 							SpcTwoButtonToolbar).
	self initializeFocus.
	
	self methodsLabeledList
		label: self translator tSelectMethod.
	self finalStepLabeledTextInput
		label: self translator tFinalStepChoice;
		text: '0'.
	self randomnessCheckbox 
		label: self translator tInitializeRandomness.
]

{ #category : #accessing }
CMSpecStepMethodChoice >> methodsLabeledList [
	" Answer the methodsLabeledList of this CMSpecStepMethodChoice "

	^ methodsLabeledList
]

{ #category : #accessing }
CMSpecStepMethodChoice >> methodsLabeledList: anObject [
	" Sets the methodsLabeledList of this CMSpecStepMethodChoice "

	methodsLabeledList := anObject
]

{ #category : #accessing }
CMSpecStepMethodChoice >> randomnessCheckbox [
	" Answer the randomnessCheckbox of this CMSpecStepMethodChoice "

	^ randomnessCheckbox
]

{ #category : #accessing }
CMSpecStepMethodChoice >> randomnessCheckbox: anObject [
	" Sets the randomnessCheckbox of this CMSpecStepMethodChoice "

	randomnessCheckbox := anObject
]

{ #category : #accessing }
CMSpecStepMethodChoice >> selectMethodLabel [
	" Answer the selectMethodLabel of this CMSpecStepMethodChoice "

	^ selectMethodLabel
]

{ #category : #accessing }
CMSpecStepMethodChoice >> selectMethodLabel: anObject [
	" Sets the selectMethodLabel of this CMSpecStepMethodChoice "

	selectMethodLabel := anObject
]

{ #category : #initialization }
CMSpecStepMethodChoice >> title [
	" Private - See superimplementor's comment "

	^ ''
]

{ #category : #accessing }
CMSpecStepMethodChoice >> toolbar [
	" Answer the toolbar of this CMSpecStepMethodChoice "

	^ toolbar
]

{ #category : #accessing }
CMSpecStepMethodChoice >> toolbar: anObject [
	" Sets the toolbar of this CMSpecStepMethodChoice "

	toolbar := anObject
]
