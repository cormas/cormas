init
localDataByLineOrColumn
	"If the number of instances (ID) or the number of time steps exceeds 256, the data are saved by line.
self probes : <Dictionary> complex :
	[ #attribut1 [ id_1 (1 3 0 99 )
				id_2 (1 3 0 99 )
				id_4 (7 4 0 92 )]
	  #attribut2 [ id_1 (4 3 0 29 )
				id_2 (6 3 0 93 )
				id_4 (7 4 0 92 )] ]"
	
	self probes
		keysAndValuesDo:
			[:probe :id_Dict | 
			id_Dict size > 255
				ifTrue:
					[self excel dataSavedByLine: true.
					^true].
			id_Dict
				keysAndValuesDo:
					[:id :coll | 
					coll size > 255
						ifTrue:
							[self excel dataSavedByLine: true.
							^true]]]	"self excel dataSavedByLine: false   ... by default, it is false"