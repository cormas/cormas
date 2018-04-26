menu-pov
addSubMenuTo: aMenuBuilder from: aListOfClasses
	"Add a Sub-Menu to a given menu (aMenuBuilder) for the classes.
A  selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| povList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			povList := self siConfig
				ifNil: [aClass availablePov]
				ifNotNil: [self siConfig povMethodsForSIMenu: aClass].
			povList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changePov: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]