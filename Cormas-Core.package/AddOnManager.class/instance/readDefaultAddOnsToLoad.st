default add-ons
readDefaultAddOnsToLoad
	
	| aFile |
	aFile := Cormas addOnsPath asFilename construct:
			'Cormas_DefaultAddOnsToLoad.txt'.
	aFile exists
		ifTrue: [^Cormas loadLinesInCollecFromTxtFile: aFile]
		ifFalse: [^#()]