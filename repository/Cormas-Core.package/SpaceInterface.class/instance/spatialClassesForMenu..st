classes list for menu
spatialClassesForMenu: aMenuName
	"aMenuName can #pov #info #track or #delimitor"
	"return a collection of all the spatial classes of the model,  even if no pov has been defined"
	
	| methodName |
	self siConfig
		ifNil: [^self spaceModel spatialClasses]
		ifNotNil:
			[methodName := 'classesFor' , (Cormas upperCaseFirstChar: aMenuName) ,
					'MenuInheritingFrom:'.
			^siConfig
				perform: methodName asSymbol
				with: CMSpatialEntity]