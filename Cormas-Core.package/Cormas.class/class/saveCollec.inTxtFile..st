deprecated
saveCollec: aCollec inTxtFile: aString
	
	| file lastData i |
	file := aString asFilename appendStream.
	lastData := aCollec size.
	i := 1.
	aCollec
		do:
			[:a | 
			i = lastData
				ifFalse: [file nextPutAll: a asString , '\' withCRs]
				ifTrue: [file nextPutAll: a asString].
			i := i = 1].
	file close