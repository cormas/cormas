"
I'm a cell of a FireAutomata. Four states are possible: #tree, #empty, #ash, #fire
"
Class {
	#name : #CMFireAutomataCell,
	#superclass : #CMSpatialEntityCell,
	#category : #'Cormas-Model-FireAutomata'
}

{ #category : #colors }
CMFireAutomataCell >> ash [

	^ Color gray
]

{ #category : #colors }
CMFireAutomataCell >> empty [

	^ Color black
]

{ #category : #colors }
CMFireAutomataCell >> fire [

	^ Color red
]

{ #category : #init }
CMFireAutomataCell >> init50 [
	Cormas random < 0.5
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]
]

{ #category : #init }
CMFireAutomataCell >> init53 [
	Cormas random < 0.53
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]
]

{ #category : #init }
CMFireAutomataCell >> init58 [
	Cormas random < 0.58
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]
]

{ #category : #init }
CMFireAutomataCell >> initEmpty [
	self state: #empty
]

{ #category : #init }
CMFireAutomataCell >> initWith: aNumber [

	Cormas random < aNumber
		ifTrue: [ self state: #tree ]
		ifFalse: [ self state: #empty ]
]

{ #category : #control }
CMFireAutomataCell >> newState [
	self state = #tree
		ifTrue: [( (self neighbourhood anySatisfy: [ :a | a state = #fire ]) and:[Cormas random < 0.5])
				ifTrue: [ self bufferState: #fire ]
				ifFalse: [ self bufferState: #tree ] ].
	self state = #fire
		ifTrue: [ Cormas random < 0.05
						ifTrue: [self bufferState: #ash]
						ifFalse: [self bufferState: #fire] ].
	self state = #ash
		ifTrue: [ Cormas random < 0.2
						ifTrue: [self bufferState: #empty ]
						ifFalse: [self bufferState: #ash]].
	self state = #empty
		ifTrue: [ self bufferState: #empty ].
		
]

{ #category : #pov }
CMFireAutomataCell >> pov [
	"^#empty ^#tree ^#fire ^#ash"
"	(self occupantsAt: CMFireman) isEmpty not ifTrue:[^Color brown]."

	^ self perform: self state
]

{ #category : #colors }
CMFireAutomataCell >> tree [

	^ Color green
]
