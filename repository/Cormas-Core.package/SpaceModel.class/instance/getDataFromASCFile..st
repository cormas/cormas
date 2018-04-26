import - export
getDataFromASCFile: aFileName
	"Create the cells from an ASC filename. Each value = '-9999'  is set to 'nil' then translated as 0."
	
	| file buffer separator fileData temp line2 cols rows i list att |
	separator := Character cr.	"Read aFileName and store the data into the fileData collection"
	file := ((Cormas mapsPath: self cormasModelClass name) construct:
			aFileName) asFilename readStream.	"On devine le format des lignes"
	file lineEndAuto.
	fileData := OrderedCollection new.
	buffer := [[file atEnd]
		whileFalse:
			[temp := file upTo: separator.
			line2 := temp copyReplaceAll: '-9999' with: 'nil'.
			fileData add: line2]].
	buffer valueNowOrOnUnwindDo: [file close].	"Read the main information (cols, rows,...)"
	cols := ((fileData at: 1) asArrayOfSubstrings at: 2) asNumber.
	rows := ((fileData at: 2) asArrayOfSubstrings at: 2) asNumber.
	xll := ((fileData at: 3) asArrayOfSubstrings at: 2) asNumber.
	yll := ((fileData at: 4) asArrayOfSubstrings at: 2) asNumber.
	cellSize := ((fileData at: 5) asArrayOfSubstrings at: 2) asNumber.	"Remove the header of files"
	fileData removeFirst: 6.	"Create the Cells if necessary"
	(cols ~= self column or: [rows ~= self line])
		ifTrue:
			[(Dialog
				confirm:
					' Rows and columns are not consistent in ' , aFileName asString ,
							'
 Do you want to respectively set them to: ' , cols printString , ' & '
						, rows printString , '? ')
				ifTrue:
					[self initializeRegularX: cols Y: rows shape: #squared nbNeighbours: #four
						boundaries: #closed]].	"User must choose the attribute for the current filename"
	list := self cormasModel class cellClass instVarNames asList.
	list addFirst: 'flag'.
	att := Dialog
		choose: 'Which attribute for the filename ' , aFileName , '?'
		fromList: list
		values: list
		lines: 8
		cancel: [nil].
	att ifNil: [^nil].	"set the value for the selected attribute"
	i := 1.
	1
		to: rows
		do:
			[:r | 
			1
				to: cols
				do:
					[:c | 
					(self cormasModel theESE at: i)
						perform: (att , ':') asSymbol
						with: ((fileData at: r) asArrayOfSubstrings at: c) asNumber.
					i := i + 1]]