Class {
	#name : #CMTrapLocationStategy,
	#superclass : #Object,
	#instVars : [
		'families',
		'space'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #'instance creation' }
CMTrapLocationStategy class >> newFor: aFamily [

	^ self new
		addFamily: aFamily;
		space: aFamily space;
		yourself
]

{ #category : #'instance creation' }
CMTrapLocationStategy class >> newFor: aFamily in: aSpaceModel [

	^ self new
		addFamily: aFamily;
		space: aSpaceModel;
		yourself
]

{ #category : #adding }
CMTrapLocationStategy >> addFamily: aFamily [

	self families add: aFamily
]

{ #category : #accessing }
CMTrapLocationStategy >> chooseTrapLocation [ 

	self subclassResponsibility 
]

{ #category : #accessing }
CMTrapLocationStategy >> families [

	^ families
		ifNil: [ families := OrderedCollection new ]
]

{ #category : #accessing }
CMTrapLocationStategy >> families: anObject [

	families := anObject
]

{ #category : #accessing }
CMTrapLocationStategy >> space [

	^ space
]

{ #category : #accessing }
CMTrapLocationStategy >> space: anObject [

	space := anObject
]
