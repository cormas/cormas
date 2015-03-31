accessing
sumTimeSeriesProbes
	
	sumTimeSeriesProbes
		ifNil:
			[sumTimeSeriesProbes := Dictionary new.
			self globalDataAsDictionary
				keysDo:
					[:aProbe | 
					sumTimeSeriesProbes
						at: aProbe
						put:
							(List
								new: self timeSteps size
								withAll: 0)]].
	^sumTimeSeriesProbes