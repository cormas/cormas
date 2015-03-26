+ save multi probes
saveSimAverageFiles
	"Add the Sim Average value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation info |
	info := self getInformation.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List
				with: (Cormas averageOf: (self getCollectionOfNumbers: coll)).
			info = ' '
				ifTrue: [varInformation := key asString]
				ifFalse: [varInformation := key asString , ': ' , info].
			aCollection addFirst: varInformation.
			aFileName := self getSimAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]