+ save multi probes
savePeriodAverageFiles: list2
	"Add the average value between the first and last list2 of the selected probes to each PeriodAverage csv file"
	
	| aCollection aFileName varInformation info |
	info := self getInformation.
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
			info = ' '
				ifTrue: [varInformation := key asString]
				ifFalse: [varInformation := key asString , ': ' , info].
			aCollection addFirst: varInformation.
			aFileName := self getPeriodAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]