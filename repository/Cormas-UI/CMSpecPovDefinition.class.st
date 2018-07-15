"
CMSpecPovDefinition example.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	methodsList:		<Object>
	symbolsList:		<Object>
	toolbar:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPovDefinition,
	#superclass : #CMSpecObject,
	#instVars : [
		'methodsList',
		'symbolsList'
	],
	#category : 'Cormas-UI-PoV'
}

{ #category : #specs }
CMSpecPovDefinition class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
		newRow: [ : r | 
			r
				add: #methodsList;
				add: #symbolsList ]
]

{ #category : #initialization }
CMSpecPovDefinition >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400

]

{ #category : #initialization }
CMSpecPovDefinition >> initializeFocus [
	" Private - See superimplementor's comment "

	self focusOrder
		add: self methodsList;
		add: self symbolsList
]

{ #category : #initialization }
CMSpecPovDefinition >> initializePresenter [
	" Private - See superimplementor's comment "

	self methodsList
		editActionBlock: [ 
			Smalltalk tools browser 
				openOnClass: self projectManager cormasModelClass 
				selector: self methodsList selectedItem ].

	self symbolsList

	
]

{ #category : #initialization }
CMSpecPovDefinition >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		methodsList		SpcEditableList		
		symbolsList		SpcEditableList).
				
	self methodsList 
		label: self translator tPoVListMethods;
		layoutSpecSelector: #buttonsOnTopSpec.
	self symbolsList 
		label: self translator tPoVListSymbols;
		layoutSpecSelector: #buttonsOnTopSpec.
				
	self initializeFocus.
]

{ #category : #accessing }
CMSpecPovDefinition >> methodsList [
	" Answer the methodsList of this CMSpecPovDefinition "

	^ methodsList
]

{ #category : #accessing }
CMSpecPovDefinition >> methodsList: anObject [
	" Sets the methodsList of this CMSpecPovDefinition "

	methodsList := anObject
]

{ #category : #accessing }
CMSpecPovDefinition >> symbolsList [
	" Answer the symbolsList of this CMSpecPovDefinition "

	^ symbolsList
]

{ #category : #accessing }
CMSpecPovDefinition >> symbolsList: anObject [
	" Sets the symbolsList of this CMSpecPovDefinition "

	symbolsList := anObject
]

{ #category : #initialization }
CMSpecPovDefinition >> title [
	" Private - See superimplementor's comment "

	^ self translator tPoVDefinition
]
