actions
validate
	
	| newList sp |
	self selectedPlayer notNil
		ifTrue:
			[sp := self selectedPlayer.
			self updateDecisionsSheet: sp.
			(self playersScheduling list includes: self selectedPlayer)
				ifFalse:
					[newList := self playersScheduling list.
					self selectedPlayer = 'Events'
						ifTrue:
							[newList add: self lineSep.
							newList add: sp]
						ifFalse: [newList addFirst: sp].
					self playersScheduling list: newList.
					self selectedPlayer: sp.
					self playersScheduling selection: self selectedPlayer.
					(((self builder menuAt: #menuDecisionsSheet) atNameKey:
							#DecisionsSheet) submenu atNameKey: self selectedPlayer asSymbol)
						disable]]