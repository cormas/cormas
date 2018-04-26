action
removePov
	
	| unSymb |
	self listMethods selection notNil
		ifTrue:
			[(self cormas
				confirm:
					'Delete the method '
						asString , self listMethods selection , ' ?')
				ifTrue:
					[unSymb := (self removeBrackets: listMethods selection) asSymbol.
					selectedClass removeSelector: unSymb.
					self listMethods list remove: listMethods selection.
					self listMethods selectionIndex: 0]]