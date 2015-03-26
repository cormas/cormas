managing classes
allClasses
	"return all the Entity classes of the model (except the classes that inheriting from Msg and other classes like Interface etc"
	
	| collec |
	collec := self environment allClasses
		select: [:cl | cl cormasHelper isTypeEntityClass].
	collec
		remove: Entity
		ifAbsent: [nil].
	^collec