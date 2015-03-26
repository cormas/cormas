charts
createChartFromSheet: aSheet
	"Create the chart based on the data in aSheet."
	
	| chart aRangeController spellDetails chartArea font |
	"Add a new Chart object to the Excel workbook."
	chart := self controller addChart.	" chart = <ExcelChartController>"
	["Get the Excel Range object for the cells in the worksheet where
	our data has been inserted. We will need the Range object as an 
	argument to the Chart Wizard."
	["<ExcelRangeController>"
	aRangeController := aSheet getDataRange] ensure: [aSheet release].	"Get the Excel ChartArea's Font property and change some Font attributes."
	chartArea := chart chartArea.	"<ExcelChartAreaController>"	"The Font Controller we get back is a Standard COM Object."
	[font := chartArea font] ensure: [chartArea release].
	[font size: 12	"; isBold: true; isOutlineFont: true"]
		ensure: [font release].	"Create a Dictionary for all of the named arguments we want to invoke the
	Chart Wizard with. Note that the Source argument is a controller."
	spellDetails := (Dictionary new)
		at: 'Source'
			put: aRangeController dispatchDriver;
		at: 'Gallery'
			put: ((Smalltalk at: #ExcelConstants) at: #xlLine);
		at: 'Format' put: 2;
		at: 'HasLegend' put: true;
		at: 'Title'
			put: (self setTitleFromSheet: aSheet);
		at: 'CategoryLabels' put: 1;
		at: 'ValueTitle' put: 'Unit';
		yourself.	"	at: 'Gallery' put: ((Smalltalk at: #ExcelConstants) at:#xlXYScatter);"	"xl3DColumn => graphe en barre (colonne); xlLine= en trait,"	"All the charts take the values as line ! ; The best should be 'xlXYScatterLines' but it does'nt exist for the moment in Smalltalk"	"Invoke the Chart Wizard."
	chart chartWizard: spellDetails]
		ensure:
			[aRangeController release.
			chart release]	"self halt"