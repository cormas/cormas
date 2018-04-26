init
prepareLastValueFiles
	"Create the files (one per probe, LastValue_XXX.csv.) and save last time step"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getLastValueFilenameOfProbe: key asString.
			times := List new.
			times add: 'Probe: '.
			times add: 'Value at ' , self timeSteps last asString.
			self updateFile: aFileName dataCollection: times]