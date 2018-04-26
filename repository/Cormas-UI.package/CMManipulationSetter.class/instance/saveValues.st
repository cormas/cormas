actions
saveValues
	
	| methodsName |
	"collect user define Init methods for a class"
	methodsName := (self methodsForManip_List list
		select: [:i | i isInit = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForInit_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForInit_UserDefined inClass: c]].	"collect user define Control methods for a self entityClasslass"
	methodsName := (self methodsForManip_List list
		select: [:i | i isControl = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForControl_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForControl_UserDefined inClass: c]].	"collect user define Testing methods for a self entityClasslass"
	methodsName := (self methodsForManip_List list
		select: [:i | i isTesting = true]) collect: [:i | i methodName].
	self
		write: methodsName
		inMethod: #methodsForTesting_UserDefined
		inClass: self entityClass.
	self applyToSubclasses value
		ifTrue:
			[self entityClass subclasses
				do:
					[:c | self write: methodsName inMethod: #methodsForTesting_UserDefined inClass: c]]