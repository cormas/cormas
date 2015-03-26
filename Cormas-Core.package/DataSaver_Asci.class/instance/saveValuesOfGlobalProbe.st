+ save
saveValuesOfGlobalProbe
	"Add the value of a probe to each sheet (probeFile type) at time 'time' 
	aDictionary : probeName + aCollection"
	
	| aCollection |
	self saveTimes: self timeSteps.
	self probes
		keysAndValuesDo:
			[:k :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: k asString.
			self saveCollection: aCollection]