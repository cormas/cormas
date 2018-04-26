sensitivity
getExcelDataModifiedBy: aParameter ofProbe: aProbeName
	
	| data table |
	table := self dataSaver getDataFromSheet: aProbeName asString.	"table removeFirst."
	data := OrderedCollection new.
	(table select: [:t | (t first findString: aParameter startingAt: 1) ~= 0])
		do: [:coll | data add: coll last].
	^data