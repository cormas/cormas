accessing
getStepNumberOfBosFilename: aFilename
	"Return the number from the name of the bosFile.
	Example: 'step_26.bos' => 26
	aFilename = <String>"
	
	| name |
	name := (Cormas splitString: aFilename with: $.) first.
	name := name
		copyFrom: self stepNameStart size + 1
		to: name size.
	^Cormas stringAsObjectType: name