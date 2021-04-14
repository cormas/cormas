"
EntityChange is the abstract of all delayed changes used in Cormas.

Instance Variables:
	entity	<Entity>	the entity who has changed
	entityClass	<Entity class>	the class of this entity (computed on the server in case of remotly distributed change)
	entityId	<Integer>	the id of this entity (computed on the server in case of remotly distributed change)
"
Class {
	#name : #EntityChange,
	#superclass : #Object,
	#instVars : [
		'entity'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'instance creation' }
EntityChange class >> newChange: aSymbol with: aParameter from: anEntity [
	"create a new instance for remembering the change information"
	
	^self new newChange: aSymbol with: aParameter from: anEntity
]

{ #category : #dispatching }
EntityChange >> dispatchOn: anObject [
	
	anObject noticeEntityChange: self
]

{ #category : #accessing }
EntityChange >> entity [
	
	^entity
]

{ #category : #printing }
EntityChange >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll:
			('(<1p>, <2p>, <3p>)'
				expandMacrosWith: self symbol
				with: self parameter
				with: self entity)
]
