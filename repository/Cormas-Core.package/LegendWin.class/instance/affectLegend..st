actions
affectLegend: legendList
	
	| list |
	list := TwoDList
		on: legendList copy
		columns: 2
		rows: legendList size / 2.
	sightingsTable := SelectionInTable with: list.
	tableInterface := TableInterface new selectionInTable: sightingsTable	"tableInterface columnFormats: #(#left #left)."