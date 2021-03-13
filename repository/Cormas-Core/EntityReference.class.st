"
EntityReference can refer to an entity (which can be a RemoteObject).
It keep some usefull information about its entity (its class and its id) in order to avoid remote messages

Instance Variables:
	entity	<Entity>	an Entity which can be a RemoteObject
	entityClass	<Entity class>	the class of the entity
	id	<Integer>	the id of the entity


"
Class {
	#name : #EntityReference,
	#superclass : #Object,
	#instVars : [
		'entity',
		'entityClass',
		'entityId'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'instance creation' }
EntityReference class >> entity: anEntity class: aClass id: anId [
	
	^self new entity: anEntity class: aClass id: anId
]

{ #category : #'instance creation' }
EntityReference class >> on: anEntity [
	
	^self
		entity: anEntity
		class: anEntity class
		id: anEntity id
]

{ #category : #'instance creation' }
EntityReference class >> onEntities: aCollec [
	
	^aCollec collect: [:e | self on: e]
]

{ #category : #comparing }
EntityReference >> = anObject [
	
	^anObject class == EntityReference
		and:
			[anObject entityId == self entityId
				and: [anObject entityClass == self entityClass]]
]

{ #category : #accessing }
EntityReference >> entity [
	
	^entity
]

{ #category : #'initialize-release' }
EntityReference >> entity: anEntity class: aClass id: anInteger [
	
	entity := anEntity.
	entityClass := aClass.
	entityId := anInteger
]

{ #category : #accessing }
EntityReference >> entityClass [
	
	^entityClass
]

{ #category : #accessing }
EntityReference >> entityId [
	
	^entityId
]

{ #category : #printing }
EntityReference >> printOn: aStream [
	
	self class printOn: aStream.
	aStream nextPut: $(.
	self entityClass printOn: aStream.
	aStream space.
	self entityId printOn: aStream.
	aStream nextPut: $)
]

{ #category : #testing }
EntityReference >> refersId: anEntityId andClass: anEntityClass [
	
	^entityId = anEntityId and: [entityClass == anEntityClass]
]
