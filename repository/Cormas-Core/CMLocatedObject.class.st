"
An instance of this class or its subclass should be a simple located entity of the world.
It is situated on a spatialEntityElement called its 'patch'.



Instance Variables:
	patch	<SpatialEntity>  the location of the passive object as a reference to a spatial entity. Symetrically, the spatial entity records the objects located there in its ""theOccupants"" attribute, a dictionary of collections of located entities.
	center	<?type?>  comment
"
Class {
	#name : 'CMLocatedObject',
	#superclass : 'CMPassiveObject',
	#instVars : [
		'patch',
		'center'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'testing' }
CMLocatedObject class >> isObjectLocationClass [
	
	^true
]

{ #category : 'testing' }
CMLocatedObject class >> isSituatedClass [
	
	^true
]

{ #category : 'displaying' }
CMLocatedObject >> center [
	
	^patch isNil
		ifTrue: [nil]
		ifFalse: [patch center]
]

{ #category : 'star control' }
CMLocatedObject >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self leave.
	super delete
]

{ #category : 'environment - distance' }
CMLocatedObject >> distanceTo: aSpatialEntityOrSituatedEntity [
	"Purpose: returns the Manhattan distance (in cells) between the patch of the agent and aSpatialEntityOrSituatedEntity
If it is the distance to a situatedEntity, returrns the distance to the patch of this entity.
Argument: aSpatialEntityOrSituatedEntity = <SpatialEntity> or <AgentLocation> or <ObjectLocation>
Return value: <Integer>"
	
	self isSituated ifFalse: [^nil].
	aSpatialEntityOrSituatedEntity isSituated
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity patch].
	aSpatialEntityOrSituatedEntity isSpatialEntity
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity]
]

{ #category : 'testing' }
CMLocatedObject >> isLocatedEntity [
	
	^true
]

{ #category : 'moving' }
CMLocatedObject >> isMovedTo: aSpatialEntity [
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self isMovedTo: self patch neighbourN"

	| alreadySituated |
	aSpatialEntity isSpatialEntity
		ifFalse: [ ^ nil ].
	alreadySituated := self isSituated.
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	(self patch occupantsOfClassNamed: self class name) add: self.
]

{ #category : 'testing' }
CMLocatedObject >> isObjectLocation [
	
	^true
]

{ #category : 'star testing' }
CMLocatedObject >> isSituated [
"Purpose: tests the location somewhere in the spatial grid"
	^patch notNil
]

{ #category : 'star moving' }
CMLocatedObject >> leave [
"Purpose: moves the agent away from the spatial grid (sets his patch attribute to nil): the situated agent is not located any more, but it is still 'alive'  "	

	self leaveWhileMoving: false.
]

{ #category : 'moving' }
CMLocatedObject >> leaveWhileMoving: isBeingMoved [
	"The situated object is not located any more. But it is still 'alive'  "

	self patch ifNil: [ ^ self ].
	
	isBeingMoved
		ifFalse:
			[ "The situated agent doesn't move; it is not located any more. But it is still 'alive'  "
			self cormasModel spaceModel ifNil: [ ^ nil ] ].
	(self patch theOccupants at: self class name)
		remove: self
		ifAbsent: [  ].
	self patch: nil
]

{ #category : 'moving' }
CMLocatedObject >> moveTo: aSpatialEntity [
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self moveTo: self patch neighbourN"
	
	self isMovedTo: aSpatialEntity
]

{ #category : 'accessing' }
CMLocatedObject >> patch [
	
	^patch
]

{ #category : 'accessing' }
CMLocatedObject >> patch: unPatch [
	
	patch := unPatch
]

{ #category : 'accessing' }
CMLocatedObject >> patchID [
	"return ID of patch"
	
	self patch ifNil: [^0].
	^self patch id
]

{ #category : 'star moving' }
CMLocatedObject >> randomMove [
"Purpose: moves to a spatial entity randomly picked from the direct neighbourhood (relative distance = 1) of the current location "

| destination |
	patch ifNil: [^nil].
	( patch neighbourhood isNil or: [ patch neighbourhood isEmpty])
		ifTrue: [self halt].
	destination := Cormas selectRandomlyFrom: patch neighbourhood.
	self isMovedTo: destination
]

{ #category : 'accessing' }
CMLocatedObject >> sizeOfPOV [
"To be overwritten if needed"
 ^ 20
]
