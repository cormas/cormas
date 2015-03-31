menu-symbol
addSubMenuSymbolSameAsTo: aMenuBuilder from: aListOfStrings for: aClass
	"a selection of an item calls the method addSameSymbolAs: aSymbol ofEntity: aClass"
	
	aMenuBuilder beginSubMenuLabeled: aClass name asString.
	aListOfStrings
		do:
			[:aSymbolString | 
			aMenuBuilder
				addLabel: aSymbolString
				value: [self addSameSymbolAs: aSymbolString ofEntity: aClass]].
	aMenuBuilder endSubMenu.
	aMenuBuilder line