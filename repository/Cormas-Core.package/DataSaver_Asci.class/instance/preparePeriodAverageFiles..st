init
preparePeriodAverageFiles: periodList
	"Create the files (one per probe) and save last time step"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			times := List new.
			times add: 'Probe: '.
			times
				add:
					'Average on period [' , periodList first asString , ' '
						, periodList last asString , ']'.
			aFileName := self getPeriodAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: times]