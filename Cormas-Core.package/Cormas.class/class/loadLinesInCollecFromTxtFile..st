util_files
loadLinesInCollecFromTxtFile: aString
	
	| aFile stream line collec |
	aFile := aString asFilename.
	aFile exists
		ifFalse:
			[^Dialog warn: 'The file ''' , aFile tail , ''' does''nt exists'].
	collec := OrderedCollection new.
	stream := aFile readStream.
	[stream atEnd]
		whileFalse:
			[line := stream upTo: Character cr.
			collec add: line].
	stream close.
	^collec