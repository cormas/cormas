"
An instance of this class or its subclass should be a simple located entity of the world.
It is situated on a spatialEntityElement called its 'patch'.



Instance Variables:
	patch	<SpatialEntity>  the location of the passive object as a reference to a spatial entity. Symetrically, the spatial entity records the objects located there in its ""theOccupants"" attribute, a dictionary of collections of located entities.
	center	<?type?>  comment
"
Class {
	#name : #CMObjectLocation,
	#superclass : #CMPassiveObject,
	#instVars : [
		'patch',
		'center'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #testing }
CMObjectLocation class >> isObjectLocationClass [
	
	^true
]

{ #category : #testing }
CMObjectLocation class >> isSituatedClass [
	
	^true
]

{ #category : #displaying }
CMObjectLocation >> center [
	
	^patch isNil
		ifTrue: [nil]
		ifFalse: [patch center]
]

{ #category : #'star control' }
CMObjectLocation >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self leave.
	super delete
]

{ #category : #displaying }
CMObjectLocation >> displayOn: aGC [
	
	self
		displayOn: aGC
		at: self center
]

{ #category : #displaying }
CMObjectLocation >> displayOn: aGC at: unPoint [
	
	self halt	"self povs2 isNil
		ifFalse: 
			[(self class image) color: (self class colorsDict at: self povs2 ifAbsent:[^nil]);
				displayOn: aGC at: unPoint]"
]

{ #category : #'environment - distance' }
CMObjectLocation >> distanceTo: aSpatialEntityOrSituatedEntity [
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

{ #category : #testing }
CMObjectLocation >> isClassLocation [
	"Answer if the entity is a kind of AgentLocation or of ObjectLocation"
	
	^true
]

{ #category : #moving }
CMObjectLocation >> isMovedTo: aSpatialEntity [
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self isMovedTo: self patch neighbourN"

	| alreadySituated |
	aSpatialEntity isSpatialEntity
		ifFalse: [ ^ nil ].
	alreadySituated := self isSituated.
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	(self patch occupants: self class name) add: self.
	alreadySituated
		ifFalse:
			[ "the agent is arriving on the grid for the first time, the SpaceInterfaces should be aware"
			self cormasModel
				registerEntityChange: #newOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self) ]
		ifTrue: [ self cormasModel
				registerEntityChange: #movingOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self) ]
]

{ #category : #testing }
CMObjectLocation >> isObjectLocation [
	
	^true
]

{ #category : #'star testing' }
CMObjectLocation >> isSituated [
"Purpose: tests the location somewhere in the spatial grid"
	^patch notNil
]

{ #category : #'star moving' }
CMObjectLocation >> leave [
"Purpose: moves the agent away from the spatial grid (sets his patch attribute to nil): the situated agent is not located any more, but it is still 'alive'  "	

	self leaveWhileMoving: false.
]

{ #category : #moving }
CMObjectLocation >> leaveWhileMoving: isBeingMoved [
	"The situated object is not located any more. But it is still 'alive'  "

	self patch isNil
		ifTrue: [ ^ self ].
	isBeingMoved
		ifFalse:
			[ "The situated agent doesn't move; it is not located any more. But it is still 'alive'  "
			self cormasModel spaceModel ifNil: [ ^ nil ].
			self cormasModel spaceModel logLeaveOf: self from: patch.
			self cormasModel
				registerEntityChange: #leavingOccupant
				from: (EntityReference on: self) ].
	(self patch theOccupants at: self class name)
		remove: self
		ifAbsent: [  ].
	self patch: nil
]

{ #category : #deprecated }
CMObjectLocation >> menu [
	
	| aMenuBuilder |
	self halt.
"	aMenuBuilder := MenuBuilder new.
	aMenuBuilder add: 'Edition' -> [self inspect].
	^aMenuBuilder menu"
]

{ #category : #moving }
CMObjectLocation >> moveTo: aSpatialEntity [
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self moveTo: self patch neighbourN"
	
	self isMovedTo: aSpatialEntity
]

{ #category : #accessing }
CMObjectLocation >> patch [
	
	^patch
]

{ #category : #accessing }
CMObjectLocation >> patch: unPatch [
	
	patch := unPatch
]

{ #category : #accessing }
CMObjectLocation >> patchID [
	"return ID of patch"
	
	self patch ifNil: [^0].
	^self patch id
]

{ #category : #'star moving' }
CMObjectLocation >> randomMove [
"Purpose: moves to a spatial entity randomly picked from the direct neighbourhood (relative distance = 1) of the current location "

| destination |
	patch ifNil: [^nil].
	( patch neighbourhood isNil or: [ patch neighbourhood isEmpty])
		ifTrue: [self halt].
	destination := Cormas selectRandomlyFrom: patch neighbourhood.
	self isMovedTo: destination
]

{ #category : #accessing }
CMObjectLocation >> sizeOfPOV [
"To be overwritten if needed"
 ^ 20
]
