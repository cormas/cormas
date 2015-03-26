actions
moveDown
	
	| selection orderedList indice itemSuiv extra |
	selection := self playersScheduling selection.
	(selection = 'Events' or: [selection = self lineSep])
		ifFalse:
			[indice := self playersScheduling selectionIndexHolder value.
			extra := (self playersScheduling list includes: self lineSep)
				ifTrue: [2]
				ifFalse: [0].
			(selection notNil
				and: [indice < (self playersScheduling list size - extra)])
				ifTrue:
					[orderedList := self playersScheduling list asOrderedCollection.
					itemSuiv := orderedList at: indice + 1.
					orderedList remove: selection.
					orderedList add: selection after: itemSuiv.
					self playersScheduling list: orderedList.
					self playersScheduling selection: selection]]