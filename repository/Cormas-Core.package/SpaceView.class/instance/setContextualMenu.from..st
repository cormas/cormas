menus
setContextualMenu: aMenuBuilder from: aListOfClasses
	
	| lesPdv |
	aListOfClasses
		do:
			[:aClass | 
			lesPdv := (aClass organization listAtCategoryNamed: #pov)
				asOrderedCollection.	"lesPdv addFirst: #randomColor."
			aMenuBuilder beginSubMenuLabeled: aClass name asString.
			aMenuBuilder add: 'nil' -> (aClass name , '*nil') asSymbol.
			lesPdv
				do: [:a | aMenuBuilder add: a -> (aClass name , '*' , a) asSymbol].
			aMenuBuilder endSubMenu].
	aListOfClasses isEmpty ifFalse: [aMenuBuilder line]