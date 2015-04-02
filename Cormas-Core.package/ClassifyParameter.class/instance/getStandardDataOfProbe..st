sensitivity
getStandardDataOfProbe: aProbeName
	
	| standardFile list data table |
	list := standardAnalysis dataSaver directory directoryContents asList.
	standardFile := list
		detect:
			[:f | 
			(f
				findString: aProbeName asString
				startingAt: 1) ~= 0].
	table := Cormas
		readCsv: (standardAnalysis dataSaver directory construct: standardFile).
	table removeFirst.
	data := OrderedCollection new.
	table do: [:coll | data add: coll last].
	^data