import - export
getDataFromASCFile: aFileName onAttribute: att
	
	| file buffer separator fileData temp line2 cols rows i |
	separator := Character cr.
	file := ((Cormas mapsPath: self cormasModelClass name) construct:
			aFileName) readStream.	"On devine le format des lignes"
	file lineEndAuto.
	fileData := OrderedCollection new.
	buffer := [[file atEnd]
		whileFalse:
			[temp := file upTo: separator.
			line2 := temp copyReplaceAll: '-9999' with: 'nil'.
			fileData add: line2]].
	buffer valueNowOrOnUnwindDo: [file close].	"Remove the header of files"
	cols := ((fileData at: 1) asArrayOfSubstrings at: 2) asNumber.
	rows := ((fileData at: 2) asArrayOfSubstrings at: 2) asNumber.
	xll := ((fileData at: 3) asArrayOfSubstrings at: 2) asNumber.
	yll := ((fileData at: 4) asArrayOfSubstrings at: 2) asNumber.
	cellSize := ((fileData at: 5) asArrayOfSubstrings at: 2) asNumber.
	fileData removeFirst: 6.
	(cols ~= self columns or: [rows ~= self line])
		ifTrue:
			[self cormas
				warn: ' Rows and columns are not consistent in ' , aFileName asString].
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