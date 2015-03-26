+ save
saveSimAverageFiles
	"Add the Sim Averaged value of the selected probes to the SimAverage file"
	
	| aCollection |
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List
				with: (Cormas averageOf: (self getCollectionOfNumbers: coll)).
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getSimAverageFilename]