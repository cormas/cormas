Class {
	#name : #IndexedSet,
	#superclass : #OrderedCollection,
	#type : #variable,
	#category : 'Cormas-Core-Tools'
}

{ #category : #'- utilities - binary storage' }
IndexedSet class >> newBoss: listElements [
	"Method only used for BOSS.
	Create a new instance of IndexedSet withour verifying if each element is already includes."
	
	| ag |
	ag := listElements isEmpty
		ifTrue: [self new]
		ifFalse: [self new: listElements size].
	listElements do: [:e | ag addLastNoCheck: e].
	^ag
]

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
