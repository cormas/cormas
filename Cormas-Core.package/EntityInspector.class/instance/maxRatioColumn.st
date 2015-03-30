private-resize dataset
maxRatioColumn
	
	| aDatasetobject |
	aDatasetobject := self widgetAt: #Dataset1.
	^1
		-
			(45
				/
					((aDatasetobject columnDescriptors at: 1) width
						+ (aDatasetobject columnDescriptors at: 2) width))