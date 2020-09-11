"
CMSpecPassiveAddRBGroup new openWithSpec.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	buttonFullNetwork:		<Object>
	buttonLocatedObject:		<Object>
	buttonMessage:		<Object>
	buttonNetworkArc:		<Object>
	buttonNetworkNode:		<Object>
	buttonObject:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecPassiveAddRBGroup,
	#superclass : #ComposablePresenter,
	#instVars : [
		'buttonObject',
		'buttonLocatedObject',
		'buttonNetworkNode',
		'buttonNetworkArc',
		'buttonFullNetwork',
		'buttonMessage'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecPassiveAddRBGroup class >> defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :row |
			row 
				add: #buttonObject;
				add: #buttonLocatedObject;
				add: #buttonNetworkNode;
				add: #buttonNetworkArc;
				add: #buttonFullNetwork;
				add: #buttonMessage ];
		yourself
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonFullNetwork [
	^ buttonFullNetwork
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonFullNetwork: anObject [
	buttonFullNetwork := anObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonLocatedObject [
	^ buttonLocatedObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonLocatedObject: anObject [
	buttonLocatedObject := anObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonMessage [
	^ buttonMessage
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonMessage: anObject [
	buttonMessage := anObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonNetworkArc [
	^ buttonNetworkArc
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonNetworkArc: anObject [
	buttonNetworkArc := anObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonNetworkNode [
	^ buttonNetworkNode
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonNetworkNode: anObject [
	buttonNetworkNode := anObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonObject [
	^ buttonObject
]

{ #category : #accessing }
CMSpecPassiveAddRBGroup >> buttonObject: anObject [
	buttonObject := anObject
]

{ #category : #initialization }
CMSpecPassiveAddRBGroup >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		buttonObject  				RadioButtonModel
		buttonLocatedObject 		RadioButtonModel
		buttonNetworkNode 			RadioButtonModel
		buttonNetworkArc 			RadioButtonModel
		buttonFullNetwork 			RadioButtonModel
		buttonMessage 				RadioButtonModel).
	self setFocus.
	self setGroup.
]

{ #category : #initialization }
CMSpecPassiveAddRBGroup >> setFocus [
	
	self focusOrder
		add: buttonObject;
		add: buttonLocatedObject;
		add: buttonNetworkNode;
		add: buttonNetworkArc;
		add: buttonFullNetwork;
		add: buttonMessage

]

{ #category : #initialization }
CMSpecPassiveAddRBGroup >> setGroup [
	" Group receiver's radio buttons "

	RadioButtonGroupModel new
		addRadioButton: buttonObject;
		addRadioButton: buttonLocatedObject;
		addRadioButton: buttonNetworkNode;
		addRadioButton: buttonNetworkArc;
		addRadioButton: buttonFullNetwork;
		addRadioButton: buttonMessage;
		default: buttonObject.


]
