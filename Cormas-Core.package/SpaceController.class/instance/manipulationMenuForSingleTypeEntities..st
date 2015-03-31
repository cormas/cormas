manipulate
manipulationMenuForSingleTypeEntities: entities
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