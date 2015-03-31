menu-symbol
initMenuAddSameAs
	"a selection of one of this item create a new symbol which shape is a copy of the selected item"
	
	| aMenuBuilder ve listOfSymbolsString |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuSymbolSameAsTo: aMenuBuilder
		from: self listSymbols list
		for: selectedClass.
	ve := self visualizedEntities.
	ve remove: selectedClass.
	ve
		do:
			[:aClass | 
			listOfSymbolsString := List new.
			aClass povDict keys do: [:aS | listOfSymbolsString add: aS asString].
			self addSubMenuSymbolSameAsTo: aMenuBuilder from: listOfSymbolsString
				for: aClass].
	self menuAddSameAs addPart: aMenuBuilder menu.
	self menuAddSameAs hideItem: (self menuAddSameAs menuItemLabeled: 'bidon')