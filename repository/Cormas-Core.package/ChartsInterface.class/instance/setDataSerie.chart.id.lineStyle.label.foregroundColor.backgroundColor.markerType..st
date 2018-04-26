display
setDataSerie: index chart: aProbe id: id lineStyle: aSymbol label: aName foregroundColor: fgColor backgroundColor: bgColor markerType: markerSymbol
	"index = <int> aProbe = <Symbol> id = <int> lineStyle: <Symbol>  aColor = <aColorValue> aName = <String>"
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		markerType: markerSymbol;
		backgroundColor: bgColor;
		foregroundColor: fgColor;
		name: aName.
	dataSet := (self cormasModel_data at: self levelClassName) at: aProbe.
	dataSet isEmpty
		ifTrue: [dataSet := OrderedCollection new]
		ifFalse: [dataSet := (dataSet at: id) copy].	"dataSet := (((cormasModel data at: self levelClassName) at: aProbe) at: id) copy."
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	dataSet size - (1 + self toStep value) timesRepeat: [dataSet removeLast].
	self fromStep value timesRepeat: [dataSet removeFirst].
	^Array with: newDescriptor with: dataSet