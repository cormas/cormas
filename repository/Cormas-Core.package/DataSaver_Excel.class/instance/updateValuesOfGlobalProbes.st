+ save
updateValuesOfGlobalProbes
	"Add the value of the selected probes to each csv file"
	
	| aCollection varInformation |
	filename := directory construct: self getTimeSerieFilename asFilename.
	self currentParameter isNil
		ifFalse: [varInformation := self currentParameter asString].
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			self saveCollectionWithLabel: aCollection onSheet: 1]