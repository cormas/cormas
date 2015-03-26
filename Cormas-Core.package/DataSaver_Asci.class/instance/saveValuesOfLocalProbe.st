+ save
saveValuesOfLocalProbe
	
	| aCollection |
	self saveTimes: self timeSteps.
	self probes
		keysAndValuesDo:
			[:attribut :dicoID | 
			dicoID
				keysAndValuesDo:
					[:id :coll | 
					aCollection := self getCollectionOfNumbers: coll.
					aCollection addFirst: attribut asString , '_' , id printString.
					self saveCollection: aCollection]]