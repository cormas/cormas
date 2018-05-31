test
testsaveJSONFile
	| result wd |
	wd := FileSystem disk workingDirectory.
	(wd / 'out.json') exists
		ifTrue: (wd / 'out.json') delete.
	result := Dictionary
		newFrom:
			{('dimensionMax' -> 80).
			('dimensionMin' -> 60).
			('numberOfFiremen' -> 20).
			('numberOfFires' -> 3).
			('percentageOfTrees' -> 0.65)}.
	CMOpenMoleExchange saveJSONFile: result.
	self assert:  (((wd / 'out.json') size) == 122).