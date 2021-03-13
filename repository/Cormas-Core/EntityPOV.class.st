Class {
	#name : #EntityPOV,
	#superclass : #Model,
	#instVars : [
		'name',
		'entityReference',
		'sizeRatio',
		'povResult',
		'infoName',
		'infoResult'
	],
	#classInstVars : [
		'rMax'
	],
	#category : #'Cormas-Core-Legacy'
}

{ #category : #viewCorrespondance }
EntityPOV class >> asFigure [
	self subclassResponsibility
]

{ #category : #'instance-creation' }
EntityPOV class >> new [
	
	^super new
]

{ #category : #accessing }
EntityPOV class >> rMax [
	
	^rMax ifNil: [rMax := 83]
]

{ #category : #accessing }
EntityPOV class >> rMax: anObject [
	
	rMax := anObject
]

{ #category : #private }
EntityPOV >> asFigure [
	self subclassResponsibility
]

{ #category : #accessing }
EntityPOV >> bounds [
	self subclassResponsibility
]

{ #category : #accessing }
EntityPOV >> center [
	self subclassResponsibility
]

{ #category : #changed }
EntityPOV >> changeColor [
	self subclassResponsibility
]

{ #category : #changed }
EntityPOV >> changeWith: anOtherImage [
	"This message is sent when a figure (self) is being deleted and replaced by anOtherCoordinate. The old one (self) is removed from SpaceView and the new one is added"
	
	self changed: #replace with: anOtherImage
]

{ #category : #accessing }
EntityPOV >> color: aColor [
	self subclassResponsibility
]

{ #category : #accessing }
EntityPOV >> entity [
	
	entityReference isNil ifTrue: [^nil].
	^entityReference entity
]

{ #category : #accessing }
EntityPOV >> entityReference [
	
	^entityReference
]

{ #category : #accessing }
EntityPOV >> entityReference: anObject [
	
	entityReference := anObject
]

{ #category : #private }
EntityPOV >> getInfoFor: infoSelectorName [
	"Returns another String according to infoSelectorName.
infoSelectorName = <Symbol>."
	
	infoSelectorName = #nil ifTrue: [^nil].
	^self entity getInfoFor: infoSelectorName
]

{ #category : #info }
EntityPOV >> getTextFor: infoSelectorName [
	"this method is called from a Figure, to display an information text"
	
	infoName := infoSelectorName.
	infoResult := self entity getInfoFor: infoSelectorName.
	^infoResult
]

{ #category : #accessing }
EntityPOV >> infoName [
	
	^infoName ifNil: [#nil]
]

{ #category : #accessing }
EntityPOV >> infoName: anObject [
	
	infoName := anObject
]

{ #category : #accessing }
EntityPOV >> infoResult [
	
	^infoResult
]

{ #category : #accessing }
EntityPOV >> infoResult: anObject [
	
	infoResult := anObject
]

{ #category : #'initialize-release' }
EntityPOV >> init [
	
	self sizeRatio
]

{ #category : #'user interface' }
EntityPOV >> inspectEntity [
	"Create and schedule an Inspector in which the user can examine the
	model's variables."
	
	^self entity inspect
]

{ #category : #testing }
EntityPOV >> isArcPOV [
	
	^false
]

{ #category : #testing }
EntityPOV >> isBitmapPOV [
	
	^false
]

{ #category : #testing }
EntityPOV >> isVectorialCompositePOV [
	
	^false
]

{ #category : #testing }
EntityPOV >> isVectorialPOV [
	
	^false
]

{ #category : #accessing }
EntityPOV >> name [
	
	^name
]

{ #category : #accessing }
EntityPOV >> name: anObject [
	
	name := anObject
]

{ #category : #accessing }
EntityPOV >> povResult [
	
	^povResult
]

{ #category : #accessing }
EntityPOV >> povResult: anObject [
	
	povResult := anObject
]

{ #category : #display }
EntityPOV >> show [
	
	self subclassResponsibility
]

{ #category : #accessing }
EntityPOV >> sizeRatio [
	"sizeRatio is an information on the actual size of the vectorial figure"
	
	^sizeRatio ifNil: [sizeRatio := 1]
]

{ #category : #accessing }
EntityPOV >> sizeRatio: unNombre [
	
	sizeRatio := unNombre
]
