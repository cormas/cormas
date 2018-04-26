classes list for menu
passiveClassesForMenu: aMenuName
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of the LocatedObjects classes of the model for which a pov has been defined"
	
	| methodName |
	self siConfig
		ifNil:
			[^self cormasModelClass visualizedClasses
				select: [:e | self cormasModelClass locatedObjectClasses includes: e]]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: PassiveObject]