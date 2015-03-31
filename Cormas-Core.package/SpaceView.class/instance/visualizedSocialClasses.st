visualized classes
visualizedSocialClasses
	"return a collection of the Social classes of the model for which a pov has been defined"
	
	| modelClass |
	modelClass := self model cormasModelClass.
	^modelClass visualizedClasses
		select: [:e | modelClass socialClasses includes: e]