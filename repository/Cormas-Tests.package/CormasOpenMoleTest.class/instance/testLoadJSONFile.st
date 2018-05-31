test
testLoadJSONFile
	| conf verif |
	CormasOpenMoleTest createInJSONFile.	"create a json file"
	conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
	verif := Dictionary
		newFrom:
			{('dimensionMax' -> 80).
			('dimensionMin' -> 60).
			('numberOfFiremen' -> 20).
			('numberOfFires' -> 3).
			('percentageOfTrees' -> 0.65)}.
	self assert: (conf at: #dimensionMax) == (verif at: #dimensionMax)