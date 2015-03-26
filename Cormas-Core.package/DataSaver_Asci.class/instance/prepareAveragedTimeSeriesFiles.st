init
prepareAveragedTimeSeriesFiles
	"Create the files (one per probe) and save time steps (first column)"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getAveragedTimeSeriesFilenameOfProbe: key asString.
			times := self timeSteps copy.
			times
				addFirst:
					'Probe: ' , key asString , ' (Average at Time, over repetitions)'.
			self updateFile: aFileName dataCollection: times]