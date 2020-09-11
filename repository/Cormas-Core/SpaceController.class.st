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
SpaceController >> manipulationMenuForSingleTypeEntities: entities [
	" Create a contextual menu for manipulating a set of entities of the same type  which contains the control methods that can be called for this entity"
	
	| aMenuBuilder aSIConfig entityClass |
	aMenuBuilder := MenuBuilder new.
	entityClass := entities first class.	"ask the entity to add its control methods "
	aMenuBuilder
		addItem:
			(MenuItem
				labeled:
					entityClass name
						,
							(entities size > 1
								ifTrue: [' *']
								ifFalse: ['-' , entities first id printString])).
	aMenuBuilder line.
	aSIConfig := self model siConfig.
	(aSIConfig
		ifNil: [entities first manipulationMenuItems]
		ifNotNil: [aSIConfig manipulationMenuItemsForEntityType: entityClass])
		do: [:aMenuItem | aMenuBuilder add: aMenuItem].
	^aMenuBuilder menu
]

{ #category : #manipulate }
SpaceController >> processChangeFigureMenuAt: aPoint forSelectedFigures: sfigures [
	
	| valueResult figures aMenuBuilder color |
	figures := sfigures
		select:
			[:f | 
			((f isKindOf: TrackFigure)
				or:
					[(f isKindOf: TentativePositionHandle)
						or: [(f isKindOf: IndexedTrackHandle) or: [f isKindOf: TrackHandle]]])
				not].
	figures isEmpty ifTrue: [^nil].	"menu for changing color and line of the figure itself"
	aMenuBuilder := MenuBuilder new.
	aMenuBuilder add: 'fill color' -> #fillColor:.	"Refactory.HotDraw.Figure new"
	figures first addLineWidthMenuTo: aMenuBuilder.
	aMenuBuilder add: 'line color' -> #lineColor:.
	valueResult := self
		trackMenu: aMenuBuilder menu
		at: aPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	(valueResult isKindOf: MenuItem)
		ifTrue: [valueResult := valueResult value].
	valueResult isSymbol
		ifTrue:
			[(valueResult = #fillColor: or: [valueResult = #lineColor:])
				ifTrue:
					[color := PovSetter colorChooser.
					color ifNil: [^nil].
					figures do: [:aFigure | aFigure perform: valueResult with: color]]
				ifFalse: [figures do: [:aFigure | aFigure perform: valueResult]]]
		ifFalse:
			["in such case the the valueresult is a block containing instruction for executing linewidth to a certain size. we here below extract this value and ask directly the figures to perform it"
			figures
				do: [:aFigure | aFigure lineWidth: valueResult copiedValues last]]
]

{ #category : #manipulate }
SpaceController >> processManipulateMenuAt: globalPoint local: localPoint for: aFigure [
	
	| valueResult |
	((aFigure isKindOf: TrackFigure)
		or:
			[(aFigure isKindOf: TentativePositionHandle)
				or:
					[(aFigure isKindOf: IndexedTrackHandle) or: [aFigure isKindOf: TrackHandle]]])
		ifTrue: [^nil].
	valueResult := self
		trackMenu: (aFigure manipulationMenuAt: localPoint)
		at: globalPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	(valueResult isKindOf: MenuItem)
		ifTrue: [valueResult := valueResult value].
	valueResult isSymbol
		ifTrue:
			[(self localMenuItem: valueResult)
				ifTrue:
					[aFigure isDrawing ifFalse: [view selection: aFigure].
					view perform: valueResult]
				ifFalse:
					[(aFigure model notNil and: [aFigure model entity respondsTo: valueResult])
						ifTrue:
							[(valueResult includes: $:)
								ifFalse: [aFigure model entity perform: valueResult]
								ifTrue:
									[| arg |
									arg := Cormas askUserArgumentsForMethod: valueResult value.
									arg ifNil: [^self].
									aFigure model entity
										perform: valueResult value
										withArguments: arg]]
						ifFalse: [aFigure perform: valueResult]]]
		ifFalse: [valueResult value]
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

{ #category : #'menu processing' }
SpaceController >> processMenuAt: globalPoint local: localPoint forMultipleFigures: allFigures [
	
	| valueResult figures aMenuBuilder fIndex aFigure orderedFigures |
	figures := allFigures select: [:f | f class ~= TrackFigure].
	orderedFigures := OrderedCollection new.
	orderedFigures
		addAll:
			((figures
				select:
					[:f | f entityType = model spaceModel cormasModelClass cellClass])
				sort: [:x :y | x model entity id < y model entity id]).
	orderedFigures
		addAll:
			((figures
				select:
					[:f | 
					model spaceModel cormasModelClass compoundSpatialClasses
						includes: f entityType])
				sort:
					[:x :y | 
					x entityType name < y entityType name
						or: [x model entity id < y model entity id]]).
	orderedFigures
		addAll:
			((figures
				select:
					[:f | model spaceModel cormasModelClass socialClasses includes: f entityType])
				sort:
					[:x :y | 
					x entityType name < y entityType name
						or: [x model entity id < y model entity id]]).
	orderedFigures
		addAll:
			((figures
				select:
					[:f | model spaceModel cormasModelClass passiveClasses includes: f entityType])
				sort:
					[:x :y | 
					x entityType name < y entityType name
						or: [x model entity id < y model entity id]]).
	aMenuBuilder := MenuBuilder new.
	fIndex := 0.
	orderedFigures
		do:
			[:f | 
			fIndex := fIndex + 1.
			aMenuBuilder
				beginSubMenuLabeled:
					f entityType name , '-' , f model entity id printString.
			(f menuAt: localPoint) allMenuItemGroups
				do:
					[:g | 
					g isEmpty
						ifTrue: [aMenuBuilder line]
						ifFalse:
							[g
								do:
									[:i | 
									i hasSubmenu
										ifTrue:
											[aMenuBuilder beginSubMenuLabeled: i label.
											i submenu menuItems
												do:
													[:si | 
													aMenuBuilder
														addLabel: si label
														value:
															(Array
																with: fIndex
																with: si value)].
											aMenuBuilder endSubMenu]
										ifFalse:
											[aMenuBuilder
												addLabel: i label
												value:
													(Array
														with: fIndex
														with: i value)]]]].
			aMenuBuilder endSubMenu].
	valueResult := self
		trackMenu: aMenuBuilder menu
		at: globalPoint
		centered: true.
	valueResult isNil ifTrue: [^self].
	(valueResult isKindOf: MenuItem)
		ifTrue: [valueResult := valueResult value].
	valueResult ifNil: [^nil].
	aFigure := orderedFigures at: valueResult first.
	valueResult := valueResult last.
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
