+ instance creation - agents & objects
createN: aNumber entity: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge"
	
	^self createN: aNumber entity: aClass initMethod: aSymbol arguments: #()