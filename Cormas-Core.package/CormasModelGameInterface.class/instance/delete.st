actions
delete
	
	| newList |
	self selectedPlayer notNil
		ifTrue:
			[self prepareDecisionsSheet: self selectedPlayer.
			(self playersScheduling list includes: self selectedPlayer)
				ifTrue:
					[newList := self playersScheduling list.
					newList remove: self selectedPlayer.
					self selectedPlayer = 'Events'
						ifTrue:
							[(newList includes: self lineSep)
								ifTrue: [newList remove: self lineSep]
								ifFalse: [self halt]].
					self playersScheduling list: newList.
					(((self builder menuAt: #menuDecisionsSheet) atNameKey:
							#DecisionsSheet) submenu atNameKey: self selectedPlayer asSymbol)
						enable.
					self selectedPlayer: nil]]