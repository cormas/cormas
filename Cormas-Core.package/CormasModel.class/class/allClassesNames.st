managing classes
allClassesNames
	"return all the Entity class names of the model (except the my self, Msg and other classes like Interface etc"
	
	^self allClasses collect: [:c | c name asString]