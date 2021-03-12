Class {
	#name : #SpaceController,
	#superclass : #Object,
	#category : #'Cormas-Core-Space'
}

{ #category : #changing }
SpaceController >> changedTool [
	
	view clearSelections.
	(self currentTool)
		controller: self;
		selected.
	self currentTool cursor show.
	self setAsCurrentConsumer
]

{ #category : #events }
SpaceController >> dispatchMenuSelection22: menuSelection [
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue:
			[self view mainInterface updatePov: menuSelection	]
]

{ #category : #events }
SpaceController >> dispatchMenuSelection: menuSelection [
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue:
			[self view mainInterface updatePov: menuSelection	"ifFalse: [self halt]"]
]

{ #category : #events }
SpaceController >> handleEvent: anEvent [
	
	super handleEvent: anEvent	"ce n'est plus la peine de passer par l√†. Il faut utiliser Tool.
	(anEvent isKindOf: DoubleClickEvent) ifTrue:[self doubleClickEvent: anEvent].

	anEvent key == #enter ifTrue: [self currentTool cursor show].
	anEvent key == #exit ifTrue: [Cursor normal show].
	(anEvent isMouseEvent or: [anEvent isKeyboard]) 
		ifTrue: 
			[(self currentTool handleEvent: anEvent) 
				ifTrue: [self setAsCurrentConsumer]]"
]

{ #category : #events }
SpaceController >> isControlWanted [
	
	^super isControlWanted	"	^self viewHasCursor and: [self model notNil]"
]

{ #category : #manipulate }
SpaceController >> manipulationMenuForMultipleTypeEntities: entities [
	" Create a contextual menu for manipulating the entity which contains the control methods that can be called for this entity "
	
	| aMenuBuilder aEntity aSIConfig menuItems entityClass |
	aMenuBuilder := MenuBuilder new.
	aSIConfig := self model siConfig.
	[entities isEmpty]
		whileFalse:
			[aEntity := entities removeFirst.
			entityClass := aEntity class.
			menuItems := aSIConfig
				ifNil: [aEntity manipulationMenuItems]
				ifNotNil: [aSIConfig manipulationMenuItemsForEntityType: entityClass].
			menuItems isEmpty
				ifFalse:
					[(entities removeAllSuchThat: [:e | e class = entityClass]) isEmpty
						ifTrue:
							[aMenuBuilder
								beginSubMenuLabeled:
									entityClass name , '-' , aEntity id printString]
						ifFalse: [aMenuBuilder beginSubMenuLabeled: entityClass name , ' *'].
					menuItems do: [:aMenuItem | aMenuBuilder add: aMenuItem].
					aMenuBuilder endSubMenu]
				ifTrue: [entities removeAllSuchThat: [:e | e class = entityClass]]].
	^aMenuBuilder menu
]

{ #category : #manipulate }
SpaceController >> processManipulateMenuAt: globalPoint local: localPoint forSelectedFigures: sFigs localFigures: lFigs [
	
	| valueResult entities chossenMethod chossenEntityClass |
	sFigs isEmpty
		ifTrue:
			[entities := (lFigs
				select:
					[:f | 
					((f isKindOf: TrackFigure)
						or:
							[(f isKindOf: TentativePositionHandle)
								or:
									[(f isKindOf: IndexedTrackHandle) or: [f isKindOf: TrackHandle]]])
						not]) collect: [:f | f model entity].
			model entityForManipulation ~= #any
				ifTrue:
					[entities := entities
						select: [:e | e class name = model entityForManipulation]]]
		ifFalse: [entities := sFigs collect: [:f | f model entity]].
	entities isEmpty ifTrue: [^self].
	(entities asSet collect: [:e | e class]) size > 1
		ifTrue:
			[valueResult := self
				trackMenu:
					(self manipulationMenuForMultipleTypeEntities: entities copy)
				at: globalPoint
				centered: true]
		ifFalse:
			[valueResult := self
				trackMenu: (self manipulationMenuForSingleTypeEntities: entities copy)
				at: globalPoint
				centered: true].
	(valueResult isNil or: [valueResult value isNil]) ifTrue: [^self].
	chossenMethod := valueResult value value.
	chossenEntityClass := valueResult value key.
	entities copy
		do:
			[:aEntity | 
			chossenEntityClass = aEntity class
				ifTrue:
					[(chossenMethod includes: $:)
						ifFalse: [aEntity perform: chossenMethod]
						ifTrue:
							[aEntity
								perform: chossenMethod
								withArguments:
									((Cormas askUserArgumentsForMethod: chossenMethod) ifNil: [^nil])]]]
]

{ #category : #events }
SpaceController >> processMenuAt: aPoint centered: centered [
	
	self view contextualMenu.
	super processMenuAt: aPoint centered: centered.
	self view mainInterface updateWindowName.
	self view mainInterface initMenuAttributs
]

{ #category : #'menu processing' }
SpaceController >> processMenuAt: globalPoint local: localPoint for: aFigure [
	
	| valueResult |
	aFigure class = TrackFigure ifTrue: [^nil].
	valueResult := self
		trackMenu: (aFigure menuAt: localPoint)
		at: globalPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	valueResult := Cormas valueFrom: valueResult.
	valueResult isSymbol
		ifTrue:
			[(self localMenuItem: valueResult)
				ifTrue:
					[aFigure isDrawing ifFalse: [view selection: aFigure].
					view perform: valueResult]
				ifFalse:
					[(aFigure model notNil and: [aFigure model respondsTo: valueResult])
						ifTrue: [aFigure model perform: valueResult]
						ifFalse: [aFigure perform: valueResult]]]
		ifFalse: [valueResult value]
]

{ #category : #'modify figure' }
SpaceController >> processModifyFigureMenuAt: globalPoint local: localPoint for: aFigure [
	
	| valueResult |
	(aFigure isTrackFigure or: [aFigure isHandle]) ifTrue: [^nil].
	valueResult := self
		trackMenu: (aFigure modifyingFigureMenuAt: localPoint)
		at: globalPoint
		centered: true.
	valueResult ifNil: [^self].
	valueResult := Cormas valueFrom: valueResult.
	valueResult isSymbol
		ifTrue:
			[(self localMenuItem: valueResult)
				ifTrue:
					[aFigure isDrawing ifFalse: [view selection: aFigure].
					view perform: valueResult]
				ifFalse:
					[(aFigure model notNil and: [aFigure model respondsTo: valueResult])
						ifTrue: [aFigure model perform: valueResult]
						ifFalse: [aFigure perform: valueResult]]]
		ifFalse: [valueResult value]
]

{ #category : #events }
SpaceController >> redButtonPressedEvent22: anEvent [
	"Click droit"
	
	[self sensor redButtonPressed]
		whileTrue:
			["	self sensor redButtonPressed ifTrue: "
			self sensor shiftDown
				ifTrue:
					[self sensor ctrlDown
						ifTrue:
							[self view performShiftCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performShiftRedButton: self sensor cursorPoint]]
				ifFalse:
					[self sensor ctrlDown
						ifTrue: [self view performCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performRedButton: self sensor cursorPoint]]].
	self sensor waitNoButton
]

{ #category : #events }
SpaceController >> redButtonPressedEvent: anEvent [
	"Click droit"
	
	[self sensor redButtonPressed]
		whileTrue:
			["	self sensor redButtonPressed ifTrue: "
			self sensor shiftDown
				ifTrue:
					[self sensor ctrlDown
						ifTrue:
							[self view performShiftCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performShiftRedButton: self sensor cursorPoint]]
				ifFalse:
					[self sensor ctrlDown
						ifTrue: [self view performCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performRedButton: self sensor cursorPoint]]].
	self sensor waitNoButton
]

{ #category : #'initialize-release' }
SpaceController >> tool: aValueModel [
	
	tool := aValueModel.
	tool onChangeSend: #changedTool to: self.
	self changedTool
]
