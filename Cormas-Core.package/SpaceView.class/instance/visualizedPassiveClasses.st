visualized classes
visualizedPassiveClasses
	"return a collection of the LocatedObjects classes of the model for which a pov has been defined"
	
	^self visualizedClasses
		select:
			[:e | self model cormasModelClass locatedObjectClasses includes: e]