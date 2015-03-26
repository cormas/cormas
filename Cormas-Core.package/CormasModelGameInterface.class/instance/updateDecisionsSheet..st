decisions sheets
updateDecisionsSheet: playerName
	
	playerName = 'Events'
		ifTrue: [self majBlock: #Events]
		ifFalse:
			[(self model playersBlocks at: playerName)
				do: [:b | self majBlock: b asSymbol]]