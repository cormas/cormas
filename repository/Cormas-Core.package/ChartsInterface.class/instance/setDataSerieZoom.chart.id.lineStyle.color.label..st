zoom
setDataSerieZoom: index chart: aChartName id: x lineStyle: aSymbol color: aColor label: aName
	
	| newDescriptor dataSet dico |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dico := (self cormasModel_data at: self levelClassName) at: aChartName.
	dataSet := (dico
		at: x
		ifAbsent: [OrderedCollection new]) copy.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet