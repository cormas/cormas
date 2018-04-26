decisions sheets
prepareDecisionsSheet: playerName
	
	self model gameStep > 1
		ifFalse: [self nullDecisionsSheet: playerName]
		ifTrue:
			[self model decisionsSheets
				at: playerName
				put:
					((self model decisionsSheetsReport at: self model gameStep - 1) at:
							playerName)]