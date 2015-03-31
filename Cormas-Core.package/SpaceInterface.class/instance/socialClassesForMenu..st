classes list for menu
socialClassesForMenu: aMenuName
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of the Social classes of the model for which a pov has been defined and that are for Located agents√í"
	
	| methodName |
	self siConfig
		ifNil:
			[^self cormasModelClass visualizedClasses
				select:
					[:e | (self cormasModelClass socialClasses includes: e) and: [e isSituatedClass]]]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: Agent]