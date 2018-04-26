util
inheritedMethodsFrom: aClass category: aCat
	"Retourne la liste des methodes des superclasses de aClass en s'arr√™tant √† Entity
	On rajoute povID et povClassName"
	
	| aList tmp classes |
	aList := OrderedCollection new.
	classes := aClass allSuperclasses copy.
	classes removeAll: Entity allSuperclasses.
	classes
		do:
			[:uneClasse | 
			tmp := uneClasse organization listAtCategoryNamed: aCat.	"specific case of Entity and #pov"	"no need anymore since the generic category has been renamed '* pov'"	"(uneClasse = Entity and: [aCat = #pov]) 
				ifTrue:[tmp := (Entity organization listAtCategoryNamed: aCat) select: [:sel | sel = #povId | (sel = #povClassName)]]."
			1
				to: tmp size
				do:
					[:i | 
					tmp
						at: i
						put: (tmp at: i) asString , ' (' , uneClasse name asString , ')'].
			aList addAll: tmp].
	^aList