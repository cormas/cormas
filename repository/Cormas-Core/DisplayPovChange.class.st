"
DisplayPovChange represents an event used for transmitting a changed from spaceModel to its SpaceInterfaces

Instance Variables:
	entityClass	<Class> the class of the entity
	povName	<aSymbol>	the povName


"
Class {
	#name : #DisplayPovChange,
	#superclass : #Object,
	#instVars : [
		'povName',
		'entityClass'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #'instance creation' }
DisplayPovChange class >> forPov: aSymbol ofEntity: aClass [
	
	^(self new)
		povName: aSymbol;
		entityClass: aClass;
		yourself
]

{ #category : #accessing }
DisplayPovChange >> entityClass [
	
	^entityClass
]

{ #category : #accessing }
DisplayPovChange >> entityClass: anObject [
	
	entityClass := anObject
]

{ #category : #accessing }
DisplayPovChange >> povName [
	
	^povName
]

{ #category : #accessing }
DisplayPovChange >> povName: anObject [
	
	povName := anObject
]

{ #category : #printing }
DisplayPovChange >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll: ' pov: ';
		print: povName;
		nextPutAll: ' ofEntity: ';
		nextPutAll: entityClass printString
]
