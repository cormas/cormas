Class {
	#name : 'CMR3SpaceShapeBuilder',
	#superclass : 'RSAbstractShapesBuilder',
	#instVars : [
		'diagramBuilder',
		'masterShape'
	],
	#category : 'Cormas-UI-Roassal3-Space',
	#package : 'Cormas-UI-Roassal3',
	#tag : 'Space'
}

{ #category : 'instance creation' }
CMR3SpaceShapeBuilder class >> for: aBuilder [

	^ self new
		diagramBuilder: aBuilder;
		container: aBuilder container;
		yourself
]

{ #category : 'as yet unclassified' }
CMR3SpaceShapeBuilder >> defaultMasterShape [

	self subclassResponsibility
]

{ #category : 'accessing' }
CMR3SpaceShapeBuilder >> diagramBuilder: anObject [

	diagramBuilder := anObject
]

{ #category : 'initialization' }
CMR3SpaceShapeBuilder >> initialize [ 

	super initialize.
	
	self masterShape: self defaultMasterShape.
]

{ #category : 'as yet unclassified' }
CMR3SpaceShapeBuilder >> inspectEntity: anEvent [

	anEvent shape model inspect
]

{ #category : 'accessing' }
CMR3SpaceShapeBuilder >> masterShape [

	^ masterShape
]

{ #category : 'accessing' }
CMR3SpaceShapeBuilder >> masterShape: aShape [

	masterShape := aShape 
		when: RSMouseRightClick send: #inspectEntity: to: self;
		yourself.
]

{ #category : 'rendering' }
CMR3SpaceShapeBuilder >> renderIn: aCanvas [

	super renderIn: aCanvas.
	self update.
]

{ #category : 'hooks' }
CMR3SpaceShapeBuilder >> shapeFor: anObject index: aNumber [

	^ masterShape copyWithAnnouncer
		model: anObject;
		yourself
]

{ #category : 'as yet unclassified' }
CMR3SpaceShapeBuilder >> update [
	shapes do: [ :shape |
		self updateShape: shape ].
]

{ #category : 'updating' }
CMR3SpaceShapeBuilder >> updateShape: aShape [

	self subclassResponsibility.
]
