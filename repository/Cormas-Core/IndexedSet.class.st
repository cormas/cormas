Class {
	#name : #IndexedSet,
	#superclass : #OrderedCollection,
	#category : #'Cormas-Core-Space'
}

{ #category : #private }
IndexedSet >> - aSet [
	"Answer those elements present in the receiver and absent from aSet."

	^ self reject: [ :i | aSet includes: i ]
]

{ #category : #private }
IndexedSet >> addFirst: newObject [ 
	"Add newObject to the beginning of the receiver.  Answer newObject."

	(self includes: newObject)
		ifFalse: [^super addFirst: newObject ].
	^ newObject
]

{ #category : #private }
IndexedSet >> addLast: newObject [ 
	"Add newObject to the end of the receiver.  Answer newObject."

	(self includes: newObject)
		ifFalse: [ ^ super addLast: newObject ].
	^ newObject
]

{ #category : #private }
IndexedSet >> collect: aBlock [ 
	"Evaluate aBlock with each of the values of the receiver as the  
	argument.  Collect the resulting values into a new OrderedCollection.
	Answer the new collection."
 	"Override superclass in order to collect and differentiate identical elements."

	^ self asOrderedCollection collect: aBlock
]

{ #category : #private }
IndexedSet >> insert: anObject before: spot [

	(self includes: anObject)
		ifFalse: [ ^ super insert: anObject before: spot].
	^ anObject
]
