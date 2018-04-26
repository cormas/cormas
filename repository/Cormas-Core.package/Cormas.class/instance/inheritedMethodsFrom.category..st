util
inheritedMethodsFrom: aClass category: aCat
	"Retourne la liste des methodes des superclasses de aClass 
	sauf celles de Object"
	"Inutile avec cormas2000"
	
	| aList tmp |
	aList := OrderedCollection new.
	aClass allSuperclasses
		do:
			[:uneClasse | 
			tmp := uneClasse organization listAtCategoryNamed: aCat.
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList