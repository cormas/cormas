save
saveData
	"'time series' ; 'last value' ; 'average per simulation' ;  'average on period...' ;  'averaged over repetitions' ."
	
	self dataSaver probes: self globalDataAsDictionary.
	self setDataSaverCurrentParameter.
	(self probeFormat selections includes: 'time series')
		ifTrue: [dataSaver updateValuesOfGlobalProbes].
	(self probeFormat selections includes: 'last value')
		ifTrue: [dataSaver updateLastValuesOfGlobalProbes].
	(self probeFormat selections includes: 'average per simulation')
		ifTrue: [dataSaver saveSimAverageFiles].
	(self probeFormat selections includes: 'average on period...')
		ifTrue: [dataSaver savePeriodAverageFiles: self averagePeriod].
	(self probeFormat selections includes: 'averaged over repetitions')
		ifTrue: [self saveAveragedTimeSeriesFiles]