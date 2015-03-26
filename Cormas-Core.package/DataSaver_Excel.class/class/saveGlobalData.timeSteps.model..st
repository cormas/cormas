public
saveGlobalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel
	"aDicoOfData : <Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ]"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst globalDataByLineOrColumn.
	inst saveValuesOfGlobalProbe