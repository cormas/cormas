save
getFileNames
	"'return the names (string) of the files to be saved (or already saved)"
	
	| set |
	set := Set new.
	dataSaver ifNil: [^set].
	self dataSaver probes keys
		do:
			[:key | 
			(self probeFormat selections includes: 'time series')
				ifTrue:
					[set add: (dataSaver getTimeSerieFilenameOfProbe: key asString)].
			(self probeFormat selections includes: 'last value')
				ifTrue:
					[set add: (dataSaver getLastValueFilenameOfProbe: key asString)].
			(self probeFormat selections includes: 'average per simulation')
				ifTrue:
					[set add: (dataSaver getSimAverageFilenameOfProbe: key asString)].
			(self probeFormat selections includes: 'average on period...')
				ifTrue:
					[set add: (dataSaver getPeriodAverageFilenameOfProbe: key asString)].
			(self probeFormat selections includes: 'averaged over repetitions')
				ifTrue:
					[set add: (dataSaver getAveragedTimeSeriesFilenameOfProbe: key asString)]].
	^set