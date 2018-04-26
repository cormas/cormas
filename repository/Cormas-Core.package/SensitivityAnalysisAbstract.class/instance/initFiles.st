save
initFiles
	"'time series' ; 'last value' ; 'average per simulation' ;  'average on period...' ;  'averaged over repetitions' ."
	"self dataSaver createExcelConnexion."
	
	self filesExist ifTrue: [^nil].
	(self probeFormat selections includes: 'time series')
		ifTrue: [dataSaver prepareTimeSeriesFiles].
	(self probeFormat selections includes: 'last value')
		ifTrue: [dataSaver prepareLastValueFiles].
	(self probeFormat selections includes: 'average per simulation')
		ifTrue: [dataSaver prepareSimAverageFiles].
	(self probeFormat selections includes: 'average on period...')
		ifTrue: [dataSaver preparePeriodAverageFiles: self averagePeriod].
	(self probeFormat selections includes: 'averaged over repetitions')
		ifTrue: [dataSaver prepareAveragedTimeSeriesFiles]