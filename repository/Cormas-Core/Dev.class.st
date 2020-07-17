Class {
	#name : #Dev,
	#superclass : #Object,
	#classInstVars : [
		'debug'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #accessing }
Dev class >> debug [
	
	^debug ifNil: [debug := false]
]

{ #category : #accessing }
Dev class >> debug: anObject [
	
	debug := anObject
]

{ #category : #api }
Dev class >> done: aString [
	"a message for marking something done. 
	use senders for retrieve the things left to do.
		Dev done: 'Something to do'
	"
	
	
]

{ #category : #api }
Dev class >> todo: aString [
	"a message for marking something to do. 
	use senders for retrieve the things left to do.
		Dev todo: 'Something to do'
	"
	
	
]
