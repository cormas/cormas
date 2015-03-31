menu processing
processMenuAt: globalPoint local: localPoint forMultipleFigures: allFigures
	
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