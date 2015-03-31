manipulate
manipulationMenuForMultipleTypeEntities: entities
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