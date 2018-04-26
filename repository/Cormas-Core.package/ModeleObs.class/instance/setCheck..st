gestion controller
setCheck: unMenu
	
	| tmp subM testPdvActif |
	self fonction msgObs isNil
		ifFalse:
			[tmp := self fonction msgObs asList.
			tmp
				do:
					[:i | 
					i isObserved isNil
						ifTrue: [testPdvActif := 'nil']
						ifFalse: [testPdvActif := i isObserved asString].
					subM := (unMenu menuItemLabeled: i name asString) submenu.
					subM menuItems
						do:
							[:item | 
							item label = testPdvActif
								ifTrue: [item beOn]
								ifFalse: [item beOff]]]].
	^unMenu