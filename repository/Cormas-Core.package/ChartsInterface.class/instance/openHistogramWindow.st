interface opening
openHistogramWindow
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point to an incorrect position in 
	the file. The file may have been modified after this method was updated."
	
	(self cormasModel_data includesKey: #Histogram)
		ifTrue:
			[self openInterface: #barChart	"	self setLocalChartsListFor: t1.
			self chartsList selections: (cormasModel class environment at: t1) probes asList.
			self idList selections: t2 asList"].
	^self