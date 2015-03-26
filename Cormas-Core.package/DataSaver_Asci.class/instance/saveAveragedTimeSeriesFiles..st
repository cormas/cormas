+ save multi probes
saveAveragedTimeSeriesFiles: aDictionaryOfAverages
	"Add the Averaged value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation |
	varInformation := self getInformation.
	aDictionaryOfAverages
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			aFileName := self getAveragedTimeSeriesFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]