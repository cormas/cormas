action
removeInfo
	
	| unSymb |
	self listInfo selection notNil
		ifTrue:
			[(self cormas
				confirm:
					'Delete the method '
						asString , ' ' , self listInfo selection , ' ?')
				ifTrue:
					[unSymb := (self removeBrackets: listInfo selection) asSymbol.
					selectedClass removeSelector: unSymb.
					self listInfo list remove: listInfo selection.
					self listInfo selectionIndex: 0]]