menu-info
addSubMenuInfoTo: aMenuBuilder from: aListOfClasses
	"Add a Submenu with: info, track. 
a selection of an item calls the method displayEntity: aClass pov: aSymbol"
	
	| infoList |
	aListOfClasses
		do:
			[:aClass | 
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			infoList := self siConfig
				ifNil: [aClass availableInfo]
				ifNotNil: [self siConfig infoMethodsForSIMenu: aClass].
			infoList
				do:
					[:aSymbol | 
					aMenuBuilder
						addLabel: aSymbol asString
						value: [self changeInfo: aSymbol ofEntity: aClass]].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]