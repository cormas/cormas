accessing
getLastValueOfGlobalData
	"Return a collection of the last value of the global probes. Each element of the collection is an array with 1st element = the probe name and the 2nd element = the last data value."

	| results |
	results := OrderedCollection new.
	self getGlobalData
		keysAndValuesDo: [ :name :coll | results add: (Array with: name with: coll last) ].
	^ results