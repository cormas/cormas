+ instance creation - agents & objects
createN: aNumber entity: aClass initMethod: aSymbol arguments: aCollec
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	ex: self createN: 10 entity: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
	| anEntity collec |
	collec := List new.
	aNumber
		timesRepeat:
			[anEntity := self newEntity: aClass.
			anEntity perform: aSymbol withArguments: aCollec.
			collec add: anEntity].
	^collec