accessing
isSingleDefaultPovShown: aBoolean
	
	| menuDyn |
	isSingleDefaultPovShown := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultPov.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]