model saving&loading
isPOVsymbolsSavedAsClassMethods
	"Check if the protocol 'pov symbols' exists in one of the entities class"
	
	| test |
	test := false.
	self cormasModelClass allEntityClasses
		do:
			[:entityClass | 
			(entityClass class organization categories includes: #'pov symbols')
				ifTrue: [test := true]].
	^test