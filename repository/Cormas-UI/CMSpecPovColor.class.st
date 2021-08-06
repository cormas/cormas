"
CMSpecPovColor example.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	applyButton:		<Object>
	colorChooser:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPovColor,
	#superclass : #CMSpecObject,
	#instVars : [
		'colorChooser',
		'applyButton'
	],
	#category : #'Cormas-UI-Spec1-PoV'
}

{ #category : #specs }
CMSpecPovColor class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
		newColumn: [ : c | 
			c
				add: #colorChooser;
				add: #applyButton height: self toolbarHeight ]
]

{ #category : #accessing }
CMSpecPovColor >> applyButton [
	" Answer the applyButton of this CMSpecPovColor "

	^ applyButton
]

{ #category : #accessing }
CMSpecPovColor >> applyButton: anObject [
	" Sets the applyButton of this CMSpecPovColor "

	applyButton := anObject
]

{ #category : #accessing }
CMSpecPovColor >> colorChooser [
	" Answer the colorChooser of this CMSpecPovColor "

	^ colorChooser
]

{ #category : #accessing }
CMSpecPovColor >> colorChooser: anObject [
	" Sets the colorChooser of this CMSpecPovColor "

	colorChooser := anObject
]

{ #category : #initialization }
CMSpecPovColor >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 300

]

{ #category : #initialization }
CMSpecPovColor >> initializeFocus [
	" Private - See superimplementor's comment "

	self focusOrder
		add: self colorChooser;
	add: self applyButton. 
]

{ #category : #initialization }
CMSpecPovColor >> initializePresenter [
	" Private - See superimplementor's comment "

	self colorChooser.
self applyButton.
.
]

{ #category : #initialization }
CMSpecPovColor >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		colorChooser		SpcColorChooserModel		
		applyButton		ButtonModel
	).
	self initializeFocus.
]

{ #category : #initialization }
CMSpecPovColor >> title [
	" Private - See superimplementor's comment "

	^ 'PoV definition'
]
