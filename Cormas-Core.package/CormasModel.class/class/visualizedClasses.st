managing classes
visualizedClasses
	"Return a list of the model' classes inheriting from Entity for whom a 'pov' protocol exists"
	
	^self allClasses	"select: [:cl | (cl organization listAtCategoryNamed: #pov) isEmpty not]"