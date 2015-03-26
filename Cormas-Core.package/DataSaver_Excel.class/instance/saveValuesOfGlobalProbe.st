+ save
saveValuesOfGlobalProbe
	"Add the value of a probe to each sheet (probeFile type) at time 'time' 
	aDictionary : probeName + aCollection"
	
	| aCollection |
	excel createSheetsFromProbes: (List with: 'Data').
	self
		saveTimeStepsLabeled: 'Time' asString
		OnSheet: 'Data'.
	self probes keys asSortedCollection
		do:
			[:k | 
			| coll |
			coll := self probes at: k.	"self probes keysAndValuesDo: 
			[:k :coll | "
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: k asString.
			self saveCollectionWithLabel: aCollection onSheet: 'Data'].
	self excel formatSheet: 'Data'.
	self excel isVisible: true.
	self excel createChartFromSheet: self excel sheets first.
	self excel saveFile.
	COMSessionManager shutdownImage.
	excel := nil	"self excel closeApplication"