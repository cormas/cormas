zoom
setDataSerieZoom: index chart: aChartName lineStyle: aSymbol label: aName
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		name: aName.
	dataSet := ((self cormasModel_data at: self levelClassName) at: aChartName)
		copy.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet