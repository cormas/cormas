public
saveGlobalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel
	"Save a dictionary of data on HD (ask for file).
aDicoOfData : <Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ]
aCollOfTimeSteps : <OrderedCollection> OrderedCollection (0 1 2 3 4 .....19 20)
cormasModel : an instance of <CormasModel>"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst saveValuesOfGlobalProbe