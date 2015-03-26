getAttributes
attributsFromClass: aClass
	"returns a list of ClassAttributeValues of Entities"
	"Add the attributs"
	
	| set |
	set := IndexedSet new.
	aClass superclass = SpatialEntityCell
		ifTrue:
			[set add: 'state'	"Parmis les attributs herites, il n'y a que state qui puisse etre un nombre"].
	(aClass superclass = CormasModelGameInterface
		or: [aClass superclass = CormasModel])
		ifTrue:
			[set add: 'periodicity'	"Parmis les attributs herites, il n'y a que periodicity qui puisse etre un nombre a analyser"].
	set addAll: aClass instVarNames.	"and add attributs superclasses except from Entities"
	set addAll: (self inheritedInstVarNamesForClass: aClass).	"Remove all collections of CormasModel automaticaly buid from a model classes . i.e: theCells  "	"(aClass superclass = CormasModelGameInterface or:[aClass superclass = CormasModel])
		ifTrue: [aClass spatialClasses do: [:c | set remove: ('the' , c name asString , 's')  ifAbsent:[]].
			    aClass socialClasses do: [:c | set remove: ('the' , c name asString , 's') ifAbsent:[]].
			    aClass passiveClasses do: [:c | set remove: ('the' , c name asString , 's') ifAbsent:[]]   ]."
	^set