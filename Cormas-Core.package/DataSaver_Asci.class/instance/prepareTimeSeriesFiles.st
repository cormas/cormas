init
prepareTimeSeriesFiles
	"Create the files (one per probe) and save time steps (first column)"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getTimeSerieFilenameOfProbe: key asString.
			times := self timeSteps copy.
			times addFirst: 'Probe: ' , key asString , ' (Time)'.
			self updateFile: aFileName dataCollection: times]