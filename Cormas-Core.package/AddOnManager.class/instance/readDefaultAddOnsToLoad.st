default add-ons
readDefaultAddOnsToLoad
	
	| aFile |
	aFile := CormasOld addOnsPath asFilename construct:
			'Cormas_DefaultAddOnsToLoad.txt'.
	aFile exists
		ifTrue: [^CormasOld loadLinesInCollecFromTxtFile: aFile]
		ifFalse: [^#()]