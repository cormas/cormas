deprecated
saveCollec: aCollec inCsvFile: aString
	
	self
		saveElementsOfCollec: aCollec
		inFile: (self removeExtensionOf: aString) asString , '.csv'