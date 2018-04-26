probes - charts
exportGlobalCharts: aList inFile: aString
	
	| file labels x |
	file := ((Cormas dataPath: self class name) , aString) asFilename
		writeStream.
	labels := aList asOrderedCollection.
	labels addFirst: #pdt.
	labels do: [:l | file nextPutAll: l asString , '	'].
	file nextPutAll: '\' withCRs.
	1
		to: (self perform: aList first) size
		do:
			[:i | 
			file nextPutAll: (i - 1) printString , '	'.
			2
				to: labels size
				do:
					[:j | 
					x := (self perform: (labels at: j)) at: i.
					file
						nextPutAll:
							(x asFloat printString
								collect:
									[:a | 
									a = $.
										ifTrue: [$,]
										ifFalse: [a]]) , '	'].
			file nextPutAll: '\' withCRs].
	file close