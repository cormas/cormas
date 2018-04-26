+ save multi probes
updateValuesOfGlobalProbes
	"Add the value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation |
	varInformation := self getInformation.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			aFileName := self getTimeSerieFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]