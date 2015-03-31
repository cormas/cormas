save
saveAveragedTimeSeriesFiles
	
	| collProbe averages |
	self globalDataAsDictionary
		keysAndValuesDo:
			[:key :coll | 
			1
				to: coll size
				do:
					[:time | 
					collProbe := self sumTimeSeriesProbes at: key.
					collProbe
						at: time
						put: (collProbe at: time) + (coll at: time)]].
	self isLastSimOfRepeat
		ifTrue:
			[averages := Dictionary new.
			self sumTimeSeriesProbes
				keysAndValuesDo:
					[:key :coll | 
					averages
						at: key
						put:
							(coll collect: [:val | (val / (self nbOfRepeat value max: 1)) asFloat])].
			dataSaver saveAveragedTimeSeriesFiles: averages.
			self sumTimeSeriesProbes: nil]