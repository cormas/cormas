private - irregular polygons creation
initEntitesSpatiales: aClass
	"Creation de la collection d'entites spatiales du modele"
	"Ca me parait inutile !!"
	
	"self cormasModel theEntities: aClass .  Returns a indexedSet of all the instances of aClass collected by cormasModel"
	"	aggregatesCollection := 'the' , aClass name asString , 's'.
	self cormasModel class instVarNames detect: [:i | i = aggregatesCollection]
		ifNone: [self halt].
	self cormasModel perform: (aggregatesCollection , ':') asSymbol
		with: (self spatialEntities at: aClass name)"
	