actions
moveUp
	
	| selection orderedList indice itemPrec |
	selection := self playersScheduling selection.
	(selection = 'Events' or: [selection = self lineSep])
		ifFalse:
			[indice := self playersScheduling selectionIndexHolder value.
			(selection notNil and: [indice ~= 1])
				ifTrue:
					[orderedList := self playersScheduling list asOrderedCollection.
					itemPrec := orderedList at: indice - 1.
					orderedList remove: selection.
					orderedList add: selection before: itemPrec.
					self playersScheduling list: orderedList.
					self playersScheduling selection: selection]]