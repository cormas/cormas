+ save
updateValuesOfGlobalProbes
	"Add the value of the selected probes to each Excel file"
	
	| aCollection |
	self currentParameter isNil ifFalse: [self currentParameter asString].
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getTimeSerieFilename]