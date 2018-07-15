"
I am responsible for the full name used to identify the current code author.
"
Class {
	#name : #CMAuthor,
	#superclass : #Object,
	#instVars : [
		'name',
		'email'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #accessing }
CMAuthor >> email [
	
	^email ifNil: [email := ' ']
]

{ #category : #accessing }
CMAuthor >> email: anObject [
	
	email := anObject
]

{ #category : #accessing }
CMAuthor >> name [
	
	^name ifNil: [name := '']
]

{ #category : #accessing }
CMAuthor >> name: anObject [
	
	name := anObject
]
