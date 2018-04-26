init
globalDataByLineOrColumn
	"If the number of probes exceeds 256, the data are saved by line.
self probes : <Dictionary> simple :
	[ #probe1 (1 3 0 99 )
	  #probe2 (1 3 0 99 )
	  #probe3 (7 4 0 92 )]
	  #probe4 (4 3 0 29 ) ]"
	
	| v |
	v := self probes size > 255.
	v ifTrue: [self excel dataSavedByLine: true].
	self probes
		keysAndValuesDo:
			[:probe :coll | 
			coll size > 255
				ifTrue:
					[v
						ifTrue:
							[self cormas warn:
									'Excel is unable to save more than 256 time steps and probes'.
							self halt]]]	"self excel dataSavedByLine: false   ... by default, it is false"