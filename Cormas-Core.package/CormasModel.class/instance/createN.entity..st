+ instance creation - agents & objects
createN: aNumber entity: aClass
	"Return a collection of aNumber of entities of aClass for wich the init method has been send.
	ex: self createN: 10 entity: Predator "
	
	^self createN: aNumber entity: aClass initMethod: #init arguments: #()