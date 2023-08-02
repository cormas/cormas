Class {
	#name : #CMR3SpaceShapeBuilder,
	#superclass : #RSAbstractShapesBuilder,
	#instVars : [
		'diagramBuilder',
		'activePoVsDictionary',
		'masterShape'
	],
	#category : #'Cormas-UI-Roassal3-Space'
}

{ #category : #'instance creation' }
CMR3SpaceShapeBuilder class >> for: aBuilder [

	^ self new
		diagramBuilder: aBuilder;
		yourself
]

{ #category : #accessing }
CMR3SpaceShapeBuilder >> activePoVsDictionary [
	" Each presenter could have customized PoV's. If this Dictionary is empty, we use the PoV's defined in the receiver's space model "

	^ activePoVsDictionary ifNil: [ activePoVsDictionary := self defaultActivePoVs ]
]

{ #category : #'accessing - pov' }
CMR3SpaceShapeBuilder >> activeSpatialEntityPov [
	" Answer a <Symbol> representing the selector of the active PoV which is a Spatial Entity "
	
	| spatialEntitySelections |
	
	spatialEntitySelections := self activePoVsDictionary associationsSelect: [ : assoc | assoc key isKindOf: CMSpatialEntityElement class ].
	^ spatialEntitySelections size = 1
		ifTrue: [ spatialEntitySelections anyOne value ]
		ifFalse: [ spatialEntitySelections ifEmpty: [ #pov ] ifNotEmpty: [ self error ] ]
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilder >> createAdaptivePopup [

	"RSPopup text: [ : aCMEntity | aCMEntity asString ]"
	^ RSPopup new shapeBuilder: [ : aCMEntity |
		| composite lb colors |
		composite := RSComposite new.
		colors := NSScale category20c.
		lb := RSLegend new.
		lb container: composite.
		lb title: aCMEntity friendlyName.
		aCMEntity interestingDetails do: [ : att | 
			lb 
				text: (self formatEntityDetail: aCMEntity attribute: att)
				withShape: (RSEllipse new size: 8; color: Color black) ].
		lb build.
		composite adjustToChildren.
		composite
			color: (Color white alpha: 0.7);
			withBorder;
			padding: 5;
			yourself.
		 ].
]

{ #category : #accessing }
CMR3SpaceShapeBuilder >> defaultActivePoVs [
	" Answer a <Dictionary> of receiver's model active points of view "
	
	^ diagramBuilder cormasModel spaceModel activePoVsDictionary
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilder >> defaultMasterShape [

	self subclassResponsibility
]

{ #category : #accessing }
CMR3SpaceShapeBuilder >> diagramBuilder: anObject [

	diagramBuilder := anObject
]

{ #category : #formatting }
CMR3SpaceShapeBuilder >> formatEntityDetail: aCMEntity attribute: att [

	^ String << [ : stream |
		stream 
			<< att key;
			space;
			<< att value asString ]
]

{ #category : #initialization }
CMR3SpaceShapeBuilder >> initialize [ 

	super initialize.
	
	self masterShape: self defaultMasterShape.
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilder >> inspectEntity: anEvent [

	anEvent shape model inspect
]

{ #category : #accessing }
CMR3SpaceShapeBuilder >> masterShape [

	^ masterShape
]

{ #category : #accessing }
CMR3SpaceShapeBuilder >> masterShape: aShape [

	| popUp |
	
	popUp := self createAdaptivePopup.

	masterShape := aShape 
		@ popUp;
		when: RSMouseLeftClick send: #inspectEntity: to: self;
		yourself.
]

{ #category : #rendering }
CMR3SpaceShapeBuilder >> renderIn: aCanvas [

	super renderIn: aCanvas.
	self update.
]

{ #category : #hooks }
CMR3SpaceShapeBuilder >> shapeFor: anObject index: aNumber [

	^ masterShape copyWithAnnouncer
		model: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilder >> update [

	shapes do: [ :shape |
		self updateShape: shape ].
]

{ #category : #updating }
CMR3SpaceShapeBuilder >> updateShape: aShape [

	self subclassResponsibility.
]
