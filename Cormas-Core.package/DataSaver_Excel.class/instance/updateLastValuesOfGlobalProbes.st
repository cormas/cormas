+ save
updateLastValuesOfGlobalProbes
	"Add the last value of the selected probes to each csv file"
	
	| aCollection varInformation |
	filename := directory construct: self getLastValueFilename asFilename.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.	"varInformation := key asString, varInformation."
			varInformation := key asString.
			self currentParameter isNil
				ifFalse:
					[varInformation := varInformation , ': ' , self currentParameter asString].
			aCollection addFirst: varInformation.
			self saveCollectionWithLabel: aCollection onSheet: 1]