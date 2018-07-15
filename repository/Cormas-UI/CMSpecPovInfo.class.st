"
CMSpecPovInfo example.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	povInfoList:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPovInfo,
	#superclass : #CMSpecObject,
	#instVars : [
		'povInfoList'
	],
	#category : 'Cormas-UI-PoV'
}

{ #category : #compiling }
CMSpecPovInfo class >> acceptsLoggingOfCompilation [
	^ true
]

{ #category : #specs }
CMSpecPovInfo class >> defaultSpec [

    <spec>
    ^ SpecLayout composed
		newColumn: [ : c | 
			c
				add: #povInfoList. ]
]

{ #category : #initialization }
CMSpecPovInfo >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400

]

{ #category : #initialization }
CMSpecPovInfo >> initializeFocus [
	" Private - See superimplementor's comment "

	self focusOrder
		add: self povInfoList. 
]

{ #category : #initialization }
CMSpecPovInfo >> initializePresenter [
	" Private - See superimplementor's comment "

	self povInfoList.
.
]

{ #category : #initialization }
CMSpecPovInfo >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(povInfoList	SpcActionList).
	self povInfoList 
		label: self translator tPoVListInfo;
		layoutSpecSelector: #buttonsOnTopSpec.
	self initializeFocus.
]

{ #category : #accessing }
CMSpecPovInfo >> povInfoList [
	" Answer the povInfoList of this CMSpecPovInfo "

	^ povInfoList
]

{ #category : #accessing }
CMSpecPovInfo >> povInfoList: anObject [
	" Sets the povInfoList of this CMSpecPovInfo "

	povInfoList := anObject
]

{ #category : #initialization }
CMSpecPovInfo >> title [
	" Private - See superimplementor's comment "

	^ self translator tPoVInfoDisplayed
]
