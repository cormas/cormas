+ save multi probes
updateLastValuesOfGlobalProbes
	"Add the last value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation info |
	info := self getInformation.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.	"varInformation := key asString, varInformation."
			info = ' '
				ifTrue: [varInformation := key asString]
				ifFalse: [varInformation := key asString , ': ' , info].
			aCollection addFirst: varInformation.
			aFileName := self getLastValueFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]