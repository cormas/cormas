private-resize dataset
columnsRatioChange
	"A method to resize the columns when size of the window changed"
	
	| aDatasetobject totWidth |
	self ratioColumns value < self minRatioColumn
		ifTrue: [^self ratioColumns value: self minRatioColumn].
	self ratioColumns value > self maxRatioColumn
		ifTrue: [^self ratioColumns value: self maxRatioColumn].
	((self wrapperAt: #Dataset1) isNil not
		and:
			[(self ratioColumns value - self previousRatioColumns) abs
				/ self previousRatioColumns > 0.03])
		ifTrue:
			[aDatasetobject := self widgetAt: #Dataset1.
			aDatasetobject dropEdit.	"update width "
			totWidth := (aDatasetobject columnDescriptors at: 1) width
				+ (aDatasetobject columnDescriptors at: 2) width.
			(aDatasetobject columnDescriptors at: 1)
				width: (totWidth * self ratioColumns value) asFloat asInteger.
			(aDatasetobject columnDescriptors at: 2)
				width: totWidth - (aDatasetobject columnDescriptors at: 1) width.	"refresh display"
			aDatasetobject computeStarts.
			aDatasetobject invalidateRectangle: aDatasetobject bounds.	"update previousRatioColumns:"
			self previousRatioColumns: self ratioColumns value]