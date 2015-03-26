private
setDataSerie: index chart: aChartName lineStyle: aSymbol label: aName color: aColor
	
	| newDescriptor dataSet |
	newDescriptor := BG_ChartDataSetDescription new.
	newDescriptor
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dataSet := (self cormasModel_data at: self levelClassName) at: aChartName.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	^Array with: newDescriptor with: dataSet