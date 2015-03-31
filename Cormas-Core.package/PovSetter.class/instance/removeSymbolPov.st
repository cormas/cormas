action
removeSymbolPov
	
	| selectedSymbol |
	self listSymbols selection isNil
		ifFalse:
			[(self cormas
				confirm:
					(UserMessage defaultString: 'Remove this symbol ?' key:
							#confirmRemoveSymbol) asString)
				ifTrue:
					[selectedSymbol := self listSymbols selection.
					self removeClassMethodForSymbol: selectedSymbol.
					selectedClass colorsDict
						removeKey: selectedSymbol asSymbol
						ifAbsent: [nil].	"selectedClass povDict removeKey: selectedSymbol ifAbsent: [nil].  uniquement pour les agents"
					self removeSymbolPov: selectedSymbol.
					^selectedSymbol]]