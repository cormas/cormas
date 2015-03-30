accessing
value: anObject
	
	value := anObject.
	entity
		ifNotNil:
			[entity
				perform: (name , ':') asSymbol
				with: value	"(Cormas valueOfValueInString:"	")"]