private-resize dataset
minRatioColumn
	
	| aDatasetobject |
	aDatasetobject := self widgetAt: #Dataset1.
	^130
		/
			((aDatasetobject columnDescriptors at: 1) width
				+ (aDatasetobject columnDescriptors at: 2) width)