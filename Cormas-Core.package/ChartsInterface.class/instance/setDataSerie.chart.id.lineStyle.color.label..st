private
setDataSerie: index chart: aProbe id: id lineStyle: aSymbol color: aColor label: aName
	"index = <int> aProbe = <Symbol> id = <int> lineStyle: <Symbol>  aColor = <aColorValue> aName = <String>"
	
	| newDescriptor dataSet |
	newDescriptor := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: index);
		lineType: aSymbol;
		foregroundColor: aColor;
		name: aName.
	dataSet := ((self cormasModel_data at: self levelClassName) at: aProbe)
		at: id.
	self nbPts - dataSet size timesRepeat: [dataSet add: 0].
	^Array with: newDescriptor with: dataSet