initialize-release
setListSymbols
	
	| liste |
	listSymbols selectionIndexHolder onChangeSend: #listSymbolsChanged to:
			self.
	liste := List new.
	liste
		addAll: (selectedClass colorsDict keys collect: [:pov | pov asString]).
	(liste includes: selectedClass name asString)
		ifFalse: [liste addFirst: selectedClass name asString].
	self listSymbols list: liste sort.
	liste isEmpty ifFalse: [listSymbols selection: listSymbols list first]