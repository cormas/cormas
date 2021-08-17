"
This abstract class groups behavior for neighbourhood management of a CORMAS space model.
Subclasses should implement at least #initializeOrderedNeighbourhood: method to customize depending on the number of neighbours (k).

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spaceModel:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpaceNeighbourhood,
	#superclass : #CMObject,
	#instVars : [
		'spaceModel'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'instance creation' }
CMSpaceNeighbourhood class >> for: aSymborOrNumberNeighbours space: aSpaceModel [
	" Answer a new instance of the receiver accordingly to the number of neighbours specified in aSymborOrNumberNeighbours "
	
	^ self subclasses 
		detect: [ : nbSubclass | nbSubclass implements: aSymborOrNumberNeighbours ]
		ifFound: [ : nbSubclass | nbSubclass new initializeOn: aSpaceModel ]
		ifNone: [ self error: 'Should not happen' ]
]

{ #category : #private }
CMSpaceNeighbourhood class >> implements: aSymborOrNumberNeighbours [
	" Answer <true> if the receiver meet the conditions for creating an instance based in aSymbolOrNumberOfNeighbours "

	^ false
]

{ #category : #initialization }
CMSpaceNeighbourhood >> cardinal [ 

	^ self spaceModel cardinal
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> closed [

	^ self spaceModel closed
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> column [

	^ self spaceModel column
]

{ #category : #accessing }
CMSpaceNeighbourhood >> cormasModel [

	^ self spaceModel cormasModel
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> eastCell: k [
	k \\ self column = 0
		ifFalse: [ ^ k + 1 ].
	^ self closed
		ifTrue: [ 0 ]
		ifFalse: [ k - (self column - 1) ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> eastCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ k ] "ligne impaire ou premiere"
		ifFalse: [ self eastCell: k ] "ligne paire"
]

{ #category : #accessing }
CMSpaceNeighbourhood >> elementaryEntitiesAt: anInteger [

	^ self spaceModel elementaryEntities at: anInteger
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeNeighbourhood [
	" Private - Initialize aSpaceModel neighbourhood values based on the receiver "

	1 to: self cardinal do: [ :k | 
		(self elementaryEntitiesAt: k) ifNotNil: [ 
			self initializeOrderedNeighbourhood: k ] ]
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeOn: aSpaceModel [
	" Private - Initialize aSpaceModel neighbourhood values based on the receiver "

	self spaceModel: aSpaceModel.
	self initializeNeighbourhood.
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeOrderedNeighbourhood: k [

	self subclassResponsibility
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> line [

	^ self spaceModel line
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> northCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k > self column
		ifTrue: [ ^ k - self column ].
	^ self closed
		ifTrue: [ 0 ]
		ifFalse: [ self column * (self line - 1) + k ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> southCell: k [

	k = 0
		ifTrue: [ ^ 0 ].
	k <= (self column * (self line - 1))
		ifTrue: [ ^ k + self column ].
	^ self closed
		ifTrue: [ 0 ]
		ifFalse: [ k - (self column * (self line - 1)) ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> spaceModel [

	^ spaceModel
]

{ #category : #accessing }
CMSpaceNeighbourhood >> spaceModel: anObject [

	spaceModel := anObject
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> westCell: k [

	k \\ self column = 1
		ifFalse: [ ^ k - 1 ].
	^ self closed
		ifTrue: [ 0 ]
		ifFalse: [ k + self column - 1 ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> westCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ self westCell: k ] "ligne impaire ou premiere"
		ifFalse: [ k ] "ligne paire"
]
