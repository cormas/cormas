accessing
dataAsDictionary
	"return a dictionary of the data: probe name as key and values"
	
	self levelClassName = cormasModel class name
		ifFalse: [^self localDataAsDictionary]
		ifTrue: [^self globalDataAsDictionary]