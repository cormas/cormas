read
getDataFromSheet: numOrName
	"Returns a collection of data from the Excel Application"
	
	| sheet data |
	numOrName isString
		ifTrue: [sheet := self sheets detect: [:s | s name = numOrName]]
		ifFalse: [sheet := self sheets at: numOrName].	"Get the wright worksheet in the workbook."
	data := sheet getValueRange value asOrderedCollection.
	data removeAllSuchThat: [:c | c allSatisfy: [:e | e isNil]].
	^data