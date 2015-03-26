histogram
setHistogramDataSerie: t1 chart: t2 lineStyle: t3 label: t4
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point to an incorrect position in 
	the file. The file may have been modified after this method was updated."
	
	| xAxe classes indiData yAxe temp |
	xAxe := (BG_ChartDataSetDescription new)
		adaptor: (IndexedAdaptor forIndex: t1);
		lineType: t3;
		name: t4.
	classes := ((self cormasModel_data at: #Histogram) at: t2) first.
	indiData := ((self cormasModel_data at: #Histogram) at: t2) last.
	yAxe := OrderedCollection new.
	classes
		do:
			[:v | 
			temp := indiData select: [:i | i < v].
			yAxe add: temp size.
			indiData removeAll: temp].
	yAxe add: indiData size.
	^Array with: xAxe with: yAxe