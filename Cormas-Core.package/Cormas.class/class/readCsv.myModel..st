+ utilities - files
readCsv: file myModel: modelName
	"Purpose: Returns a dictionary containing the values of the csv file (separator is ';').
The file name is just a string containing the name of the file (with or without extension) that is stored in the /data directory of a model.
Ex:    Cormas readCsv: 'palaya1973' myModel: 'Thunupa'    		or 
	Cormas readCsv: 'palaya1973.cvs' myModel: 'Thunupa'           "
	
	| stream line dicoR dico l nbLine nbRow r key values |
	stream := ((Cormas dataPath: modelName) construct: file , '.csv')
		readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	dicoR := Dictionary new.
	dico := Dictionary new.	" Read file line per line and save it into DicoR which is a reversed line and row dictionary "
	l := 1.
	[stream atEnd]
		whileFalse:
			[line := Cormas splitLine: stream sep: $,.
			dicoR at: l put: line.
			l := l + 1].
	stream close.	"Reverse the dicoR into the dico"
	nbLine := dicoR keys size.
	nbRow := (dicoR at: 1) size.
	r := 1.
	nbRow
		timesRepeat:
			[l := 1.
			key := (dicoR at: l) at: r.
			values := OrderedCollection new.
			nbLine - 1
				timesRepeat:
					[l := l + 1.
					values add: ((dicoR at: l) at: r)].
			dico at: key put: values.
			r := r + 1].
	^dico