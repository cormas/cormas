- user interface
doesHabitusExists: aString
	
	^(self class respondsTo: ('SIconfig_' , aString) asSymbol)
		ifFalse:
			[self cormas warn: 'No habitus named <1s> exists' with: aString.
			false]
		ifTrue: [true]