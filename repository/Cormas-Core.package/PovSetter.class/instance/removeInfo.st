action
removeInfo
	
	| unSymb |
	self listInfo selection notNil
		ifTrue:
			[(self cormas
				confirm:
					(UserMessage defaultString: 'Delete the method ' key: #removeMethod)
						asString , ' ' , self listInfo selection , ' ?')
				ifTrue:
					[unSymb := (self removeBrackets: listInfo selection) asSymbol.
					selectedClass removeSelector: unSymb.
					self listInfo list remove: listInfo selection.
					self listInfo selectionIndex: 0]]