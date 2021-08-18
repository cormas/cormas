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

{ #category : #testing }
CMSpaceNeighbourhood class >> cardinal [

	self subclassResponsibility
]

{ #category : #testing }
CMSpaceNeighbourhood class >> cardinalSymbol [

	self subclassResponsibility
]

{ #category : #'instance creation' }
CMSpaceNeighbourhood class >> forSpace: aSpaceModel [
	" Answer a new instance of the receiver accordingly to the number of neighbours specified in aSymborOrNumberNeighbours "
	
	^ self concreteSubclasses
		detect: [ : nbSubclass | nbSubclass isStartConditionFor: aSpaceModel ]
		ifFound: [ : nbSubclass | nbSubclass new initializeOn: aSpaceModel ]
		ifNone: [ self error: 'Should not happen' ]
]

{ #category : #testing }
CMSpaceNeighbourhood class >> isRegularNeighbourhood: aSpaceModel [

	^ aSpaceModel nbNeighbours = self cardinal or: [ aSpaceModel nbNeighbours == self cardinalSymbol ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> cardinal [
	" See class side comment "
	
	^ self class cardinal
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
	^ self isNotTorroidal
		ifTrue: [ 0 ]
		ifFalse: [ k - (self column - 1) ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> elementaryEntitiesAt: anInteger [

	^ self spaceModel elementaryEntities at: anInteger
]

{ #category : #accessing }
CMSpaceNeighbourhood >> gridCellShape [

	^ self spaceModel gridCellShape 
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeNeighbourhood [
	" Private - Initialize aSpaceModel neighbourhood values based on the receiver "

	1 to: self class cardinal do: [ :k | 
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
CMSpaceNeighbourhood >> isNotTorroidal [

	^ self spaceModel isNotTorroidal
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> line [

	^ self spaceModel line
]

{ #category : #'private - accessing' }
CMSpaceNeighbourhood >> nbNeighbours [

	^ self spaceModel nbNeighbours
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> northCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k > self column
		ifTrue: [ ^ k - self column ].
	^ self isNotTorroidal
		ifTrue: [ 0 ]
		ifFalse: [ self column * (self line - 1) + k ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> southCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k <= (self column * (self line - 1))
		ifTrue: [ ^ k + self column ].
	^ self isNotTorroidal
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
	^ self isNotTorroidal
		ifTrue: [ 0 ]
		ifFalse: [ k + self column - 1 ]
]
