"
CMSpecInitialValueChooser new openWithSpec.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	arrayRadioButton:		<Object>
	booleanRadioButton:		<Object>
	collectionRadioButton:		<Object>
	getterAccessorCheckbox:		<Object>
	initialValueRadio:		<Object>
	newEntityRadioButton:		<Object>
	noValueRadioButton:		<Object>
	notifyObsCheckbox:		<Object>
	numberRadioButton:		<Object>
	randomRadioButton:		<Object>
	setterAccessorCheckbox:		<Object>
	stringRadioButton:		<Object>
	toolbar:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecInitialValueChooser,
	#superclass : #CMSpecObject,
	#instVars : [
		'setterAccessorCheckbox',
		'getterAccessorCheckbox',
		'notifyObsCheckbox',
		'toolbar',
		'initialRBGroup',
		'attributeName'
	],
	#category : #'Cormas-UI-Spec1-Attributes'
}

{ #category : #specs }
CMSpecInitialValueChooser class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
			newColumn: [ : c | 
				c 
					newRow: [ : r | r add: #setterAccessorCheckbox ] origin: 0 @ 0 corner: 0 @ 0.1;
					newRow: [ : r | r 
						add: #getterAccessorCheckbox;
						add: #notifyObsCheckbox ] origin: 0 @ 0.35 corner: 0 @ 0.5 ]
			origin: 0.05 @ 0.03 corner: 0.95 @ 0.4;
			newColumn: [ : c | c add: #initialRBGroup ]
			origin: 0.05 @ 0.15 corner: 0.95 @ 1;
			newRow: [ : r | r add: #toolbar ] origin: 0 @ 0.9 corner: 1 @ 1;
			yourself.
]

{ #category : #adding }
CMSpecInitialValueChooser class >> on: attributeName for: aCMProjectManager [

	(self for: aCMProjectManager)
		attributeName: attributeName;
		openWithSpec

]

{ #category : #adding }
CMSpecInitialValueChooser class >> on: attributeName for: aCMProjectManager owner: aPresenter [

	(self for: aCMProjectManager)
		owner: aPresenter;
		attributeName: attributeName;
		openWithSpec

]

{ #category : #callbacks }
CMSpecInitialValueChooser >> applyInitialValueChooserSetting [
	" Private - Obtain the selected radio button and its value "

	| settingRBClass |
	settingRBClass := self initialRBGroup class.
	((settingRBClass organization listAtCategoryNamed: #accessing) reject: #isKeyword)
		detect: [ : widgetAccessor | 
			| rb | 
			(rb := self initialRBGroup perform: widgetAccessor) isRadioButton and: [ rb state ] ]
		ifFound: [ : rb | self setInitialValue: (self initialRBGroup valueAccessorAt: rb) ]
		ifNone: [ self informMessage: 'Please select an option' ]
]

{ #category : #accessing }
CMSpecInitialValueChooser >> attributeName [

	^ attributeName
]

{ #category : #accessing }
CMSpecInitialValueChooser >> attributeName: anObject [

	attributeName := anObject
]

{ #category : #accessing }
CMSpecInitialValueChooser >> codeGenerator [

	^ self projectManager codeGenerator.
]

{ #category : #accessing }
CMSpecInitialValueChooser >> getterAccessorCheckbox [
	" Answer the getterAccessorCheckbox of this CMSpecInitialValueChooser "

	^ getterAccessorCheckbox
]

{ #category : #accessing }
CMSpecInitialValueChooser >> getterAccessorCheckbox: anObject [
	" Sets the getterAccessorCheckbox of this CMSpecInitialValueChooser "

	getterAccessorCheckbox := anObject
]

{ #category : #api }
CMSpecInitialValueChooser >> initialExtent [

	^ 500 @ 450
]

{ #category : #accessing }
CMSpecInitialValueChooser >> initialRBGroup [
	" Answer the initialValueRadio of this CMSpecInitialValueChooser "

	^ initialRBGroup
]

{ #category : #accessing }
CMSpecInitialValueChooser >> initialRBGroup: anObject [
	" Sets the initialValueRadio of this CMSpecInitialValueChooser "

	initialRBGroup := anObject
]

{ #category : #initialization }
CMSpecInitialValueChooser >> initializeFocus [

	self focusOrder
		add: self setterAccessorCheckbox;
		add: self getterAccessorCheckbox;
		add: self notifyObsCheckbox;
		add: self initialRBGroup;
		add: self toolbar
]

{ #category : #initialization }
CMSpecInitialValueChooser >> initializeLabels [
	" Private - See superimplementor's comment "

	self setterAccessorCheckbox label: self translator tSetterAccessor.
	self getterAccessorCheckbox label: self translator tGetterAccessor.
	self notifyObsCheckbox label: self translator tNotifyObs.
	self toolbar
		firstButtonLabel: self translator tCancel;
		firstButtonAction: [ self delete ];
		secondButtonLabel: self translator tOk;
		secondButtonAction: [ self applyInitialValueChooserSetting ]


]

{ #category : #initialization }
CMSpecInitialValueChooser >> initializePresenter [
	" Private - See superimplementor's comment "

	self setterAccessorCheckbox state: true.
	self getterAccessorCheckbox state: true.

]

{ #category : #initialization }
CMSpecInitialValueChooser >> initializeWidgets [
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			setterAccessorCheckbox 	CheckBoxModel 
			getterAccessorCheckbox 	CheckBoxModel 
			notifyObsCheckbox 			CheckBoxModel 
			initialRBGroup 				CMSpecInitialValueSetter			
			toolbar 						SpcTwoButtonToolbar).
									
	self initializeLabels.
	self initializeFocus.
]

{ #category : #accessing }
CMSpecInitialValueChooser >> notifyObsCheckbox [
	" Answer the notifyObsCheckbox of this CMSpecInitialValueChooser "

	^ notifyObsCheckbox
]

{ #category : #accessing }
CMSpecInitialValueChooser >> notifyObsCheckbox: anObject [
	" Sets the notifyObsCheckbox of this CMSpecInitialValueChooser "

	notifyObsCheckbox := anObject
]

{ #category : #accessing }
CMSpecInitialValueChooser >> setterAccessorCheckbox [
	" Answer the setterAccessorCheckbox of this CMSpecInitialValueChooser "

	^ setterAccessorCheckbox
]

{ #category : #accessing }
CMSpecInitialValueChooser >> setterAccessorCheckbox: anObject [
	" Sets the setterAccessorCheckbox of this CMSpecInitialValueChooser "

	setterAccessorCheckbox := anObject
]

{ #category : #accessing }
CMSpecInitialValueChooser >> targetClass [
	" Answer the <Class> where the code is targeted "

	^ self codeGenerator targetClass.
]

{ #category : #api }
CMSpecInitialValueChooser >> title [
	" Private - See superimplementor's comment "

	^ self formattedWindowTitle: self translator tInitialValueChooser
]

{ #category : #accessing }
CMSpecInitialValueChooser >> toolbar [
	" Answer the toolbar of this CMSpecInitialValueChooser "

	^ toolbar
]

{ #category : #accessing }
CMSpecInitialValueChooser >> toolbar: anObject [
	" Sets the toolbar of this CMSpecInitialValueChooser "

	toolbar := anObject
]

{ #category : #initialization }
CMSpecInitialValueChooser >> updateDataSource [

	self owner classAttributesTable dataSource: (CMClassAttributeValueDataSource forClass: self targetClass).
]
