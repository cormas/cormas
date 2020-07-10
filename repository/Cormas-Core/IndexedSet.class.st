Class {
	#name : #IndexedSet,
	#superclass : #OrderedCollection,
	#type : #variable,
	#category : #'Cormas-Core-Tools'
}

{ #category : #removing }
IndexedSet >> - aSet [
	"Answer those elements present in the receiver and absent from aSet."
	
	^self reject: [:i | aSet includes: i]
]

{ #category : #adding }
IndexedSet >> addFirst: newObject [
	"Add newObject to the beginning of the receiver.  Answer newObject."
	
	(self includes: newObject) ifFalse: [^super addFirst: newObject].
	^newObject
]

{ #category : #adding }
IndexedSet >> addLast: newObject [
	"Add newObject to the end of the receiver.  Answer newObject."
	
	(self includes: newObject) ifFalse: [^super addLast: newObject].
	^newObject
]

{ #category : #private }
IndexedSet >> insert: anObject before: spot [
	
	(self includes: anObject) ifFalse: [^super insert: anObject before: spot].
	^anObject
]
