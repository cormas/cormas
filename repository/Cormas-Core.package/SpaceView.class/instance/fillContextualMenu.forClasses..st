menus
fillContextualMenu: aMenuBuilder forClasses: aCollectionOfClasses
	
	| lesPdv |
	aCollectionOfClasses
		do:
			[:aClass | 
			lesPdv := (aClass organization listAtCategoryNamed: #pov)
				asOrderedCollection.
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			aMenuBuilder add: 'nil' -> (aClass name , '*nil') asSymbol.
			lesPdv
				do:
					[:aPOV | aMenuBuilder add: aPOV -> (aClass name , '*' , aPOV) asSymbol].
			aMenuBuilder endSubMenu].
	^aCollectionOfClasses