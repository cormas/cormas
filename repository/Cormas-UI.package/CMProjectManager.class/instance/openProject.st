callbacks
openProject

	| locationName |
	locationName := self requestModelNameLocation
		ifNotNil: [ : locName | self perform: (self cormasOpenLocationsMap at: locName) ].
