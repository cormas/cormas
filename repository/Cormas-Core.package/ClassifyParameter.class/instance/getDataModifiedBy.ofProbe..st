sensitivity
getDataModifiedBy: aParameter ofProbe: aProbeName
	
	| standardFile list data table |
	list := self dataSaver directory directoryContents asList.
	standardFile := list
		detect:
			[:f | 
			(f
				findString: aProbeName asString
				startingAt: 1) ~= 0].
	table := Cormas
		readCsv: (self dataSaver directory construct: standardFile).
	table removeFirst.
	data := OrderedCollection new.
	(table select: [:t | (t first findString: aParameter startingAt: 1) ~= 0])
		do: [:coll | data add: coll last].
	^data