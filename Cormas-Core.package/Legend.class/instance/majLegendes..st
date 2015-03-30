actions
majLegendes: classMethod
	"classMethod = an Array ex:#(Plant 'pov')"
	
	| classe methode found posFound |
	classe := classMethod first.
	methode := classMethod at: 2.
	found := legendes
		detect: [:leg | leg classe = classe]
		ifNone: [nil].
	found
		ifNotNil:
			[found methode = methode
				ifFalse:
					[methode = 'nil'
						ifFalse:
							[posFound := found builder window displayBox origin.
							self removeLegend: found.
							self addLegend: classMethod location: posFound]
						ifTrue:
							[found builder window displayBox origin = currentWinPos
								ifTrue:
									[currentWinPos := (currentWinPos x - 10) @ (currentWinPos y - 30)].
							self removeLegend: found]]]
		ifNil:
			[methode = 'nil'
				ifFalse:
					[isOpen
						ifTrue:
							[currentWinPos := (currentWinPos x + 10) @ (currentWinPos y + 30)].
					self addLegend: classMethod location: currentWinPos]]