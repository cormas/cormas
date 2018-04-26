+ save
savePeriodAverageFiles: list2
	"Add the average value between the first and last list2 of the selected probes to the PeriodAverage file"
	
	| aCollection |
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List
				with:
					(Cormas
						averageOf:
							((self getCollectionOfNumbers: coll)
								copyFrom: 1 + list2 first
								to: 1 + list2 last)).
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getPeriodAverageFilename]