initialization
setListSymbols

	| liste |

	liste := OrderedCollection new.
	liste addAll: (selectedClass colorsDict keys collect: #asString).
	(liste includes: selectedClass name asString) 
		ifFalse: [ liste addFirst: selectedClass name asString ].
	self listSymbols list: liste sort.
	liste isEmpty 
		ifFalse: [ self listSymbols selectFirstItem ]