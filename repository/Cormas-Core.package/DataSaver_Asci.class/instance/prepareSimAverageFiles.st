init
prepareSimAverageFiles
	"Create the files (one per probe,SimAverage_XXX.csv.) and save the average of each probe"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getSimAverageFilenameOfProbe: key asString.
			times := List new.
			times add: 'Probe: '.
			times add: 'Average on simulation'.
			self updateFile: aFileName dataCollection: times]