+ save
updateLastValuesOfGlobalProbes
	"Add the last value of the selected probes to each csv file"
	
	| aCollection |
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getLastValueFilename]