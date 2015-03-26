+ save
saveAveragedTimeSeriesFiles: aDictionaryOfAverages
	"Add the Averaged value of the selected probes at current time step (and averaged over repetitions) to each file"
	
	| aCollection varInformation |
	varInformation := self getInformation.
	aDictionaryOfAverages
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getAveragedTimeSeriesFilename]