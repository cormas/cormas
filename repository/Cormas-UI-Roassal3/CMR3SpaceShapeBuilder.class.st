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
CMR3SpaceShapeBuilder >> contextMenuItemsFor: anEntity [

	^ { CMInspectSpaceContextMenuCommand forOwner: anEntity }
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
		when: RSMouseRightClick send: #openContextMenu: to: self;
		yourself.
]

{ #category : 'as yet unclassified' }
CMR3SpaceShapeBuilder >> openContextMenu: anEvent [

	| entity menu |
	entity := anEvent shape model.
	
	menu := SpMenuPresenter new
		title: entity class name;
		yourself.
		
	((self contextMenuItemsFor: entity) sorted: [ :a :b | a class order < b class order ]) do: [ :command |
		menu addItem: [ :item |
			item
				name: command name;
				icon: command icon;
				action: [
					command action.
					diagramBuilder update ] ] ].
		
	menu addGroup: [ :group |
		entity actionSelectors do: [ :selector |
			group addItem: [ :item |
				item
					name: selector asString;
					icon: (self iconNamed: #jump);
					action: [
						entity perform: selector.
						diagramBuilder update] ] ] ].
		
	menu openWithSpecAt: self currentHand position.
]

{ #category : 'as yet unclassified' }
CMR3SpaceShapeBuilder >> paintFromImage: aForm [

	| paint |
	paint := AthensCairoPatternSurfacePaint createForSurface: (AthensCairoSurface fromForm: aForm).
	paint origin: aForm extent / -2.
	^ paint
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
