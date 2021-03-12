"
DisplayPovChange represents an event used for transmitting a changed from spaceModel to its SpaceInterfaces

Instance Variables:
	entityClass	<Class> the class of the entity
	povName	<aSymbol>	the povName


"
Class {
	#name : #CMDisplayPovChange,
	#superclass : #Object,
	#instVars : [
		'povName',
		'entityClass'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #'instance creation' }
CMDisplayPovChange class >> forPov: aSymbol ofEntity: aClass [
	
	^(self new)
		povName: aSymbol;
		entityClass: aClass;
		yourself
]

{ #category : #accessing }
CMDisplayPovChange >> entityClass [
	
	^entityClass
]

{ #category : #accessing }
CMDisplayPovChange >> entityClass: anObject [
	
	entityClass := anObject
]

{ #category : #accessing }
CMDisplayPovChange >> povName [
	
	^povName
]

{ #category : #accessing }
CMDisplayPovChange >> povName: anObject [
	
	povName := anObject
]

{ #category : #printing }
CMDisplayPovChange >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll: ' pov: ';
		print: povName;
		nextPutAll: ' ofEntity: ';
		nextPutAll: entityClass printString
]
