public
saveLocalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel
	"aDicoOfData : <Dictionary> complex :
	[ #attribut1 [ id_1 (1 3 0 99 )
				id_2 (1 3 0 99 )
				id_4 (7 4 0 92 )]
	  #attribut2 [ id_1 (4 3 0 29 )
				id_2 (6 3 0 93 )
				id_4 (7 4 0 92 )] ]"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst localDataByLineOrColumn.
	inst saveValuesOfLocalProbe