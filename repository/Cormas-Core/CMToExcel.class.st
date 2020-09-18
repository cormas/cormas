"
Connect Cormas to Excel spreadsheets

This class does not work anymore on Pharo and should be redesigned correctly.
With the Tabular project, we should be able to import/export .xlsx
https://github.com/VincentBlondeau/Tabular
"
Class {
	#name : #CMToExcel,
	#superclass : #Object,
	#instVars : [
		'workbook',
		'sheets',
		'sheetName',
		'visible',
		'linePos',
		'controller',
		'fileName',
		'dataSavedByLine'
	],
	#category : #'Cormas-Core-Connect'
}

{ #category : #new }
CMToExcel class >> connectToFilename: aFilename visible: aBoolean [
	"Load COM-All to connect to Excel"
	
	| inst |
	Screen default platformName = 'MS-Windows'
		ifTrue: [Parcel ensureLoadedParcel: 'Com- All' withVersion: '7.1']
		ifFalse:
			["To fix"
			self subclassResponsibility].
	inst := self new.
	inst linePos: 1.
	inst fileName: aFilename asString.
	inst launchApplicationVisible: aBoolean.
	^inst
]

{ #category : #'run_private' }
CMToExcel >> addWorkbook [
	"Add a new workbook to the Excel Application"
	
	workbook := self controller addWorkbook
]

{ #category : #run }
CMToExcel >> addWorksheet [
	
	| worksheetsDD worksheetDD |
	worksheetsDD := workbook getMethod: 'Worksheets'.
	worksheetDD := worksheetsDD invokeMethod: 'Add'.
	ExcelWorksheetController currentClass onDispatchDriver: worksheetDD
]

{ #category : #run }
CMToExcel >> closeApplication [
	"Close the Excel application and save the worksheet a the given 
	fileName at the pathName"
	
	[ self closeWorkbook ] ensure: [ self workbook release ].
	"COMSessionManager shutdownImage	""terminateServer allOwnedInterfaces"
]

{ #category : #'run_private' }
CMToExcel >> closeWorkbook [
	"Close the workbook and save the file"
	
	[self workbook
		close: self shouldSaveToFile
		fileName: fileName
		routeWorkbook: nil]
		on: COMDispatchError
		do: [:ex | ex exceptionInfo wCode = 1004 ifFalse: [ex pass]].
	self workbook release.
	self release
]

{ #category : #'run_private' }
CMToExcel >> closeWorkbook_old [
	"Close the workbook and save the file"
	"["
	
	self workbook
		close: self shouldSaveToFile
		fileName: fileName
		routeWorkbook: nil	"self workbook release.
	self workbook: nil.
	self release"	"]
		on: COMDispatchError do: [:ex |
		ex exceptionInfo wCode = 1004 ifFalse: [ex pass]]"
]

{ #category : #accessing }
CMToExcel >> controller [
	"Answer the Excel Application controller"
	
	controller notNil ifTrue: [^controller].
	^controller := ExcelApplicationController new
]

{ #category : #charts }
CMToExcel >> createChartFromSheet: aSheet [
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
			chart release]
]

{ #category : #charts }
CMToExcel >> createCharts [
	
	self sheets do: [:aSheet | self createChartFromSheet: aSheet]
]

{ #category : #run }
CMToExcel >> createSheets: number [
	
	self sheets: OrderedCollection new.
	1
		to: number
		do:
			[:index | 
			index <= 3
				ifTrue: [self setWorksheet: 4 - index]
				ifFalse:
					[self addWorksheet.
					self setWorksheet: 1]]
]

{ #category : #run }
CMToExcel >> createSheetsFromProbes: nameList [
	
	| index |
	" (workbook getMethod: 'Worksheets') invokeMethod: 'Add'   
(self controller worksheetAt: 1) invokeMethod: #Delete  
self deleteWorksheet "
	self sheets: OrderedCollection new.	"removing default sheets"
	self deleteWorksheet.
	self deleteWorksheet.	"normalement il en reste 1"
	index := 1.
	nameList
		do:
			[:aName | 
			index = 1
				ifTrue: [self setWorksheet: 1]
				ifFalse:
					[self addWorksheet.
					self setWorksheet: 1].
			self sheets first setName: aName asString.
			index := index + 1]
]

{ #category : #accessing }
CMToExcel >> dataSavedByLine [
	
	dataSavedByLine ifNil: [dataSavedByLine := false].
	^dataSavedByLine
]

{ #category : #accessing }
CMToExcel >> dataSavedByLine: aBoolean [
	
	dataSavedByLine := aBoolean.
	self sheets do: [:aSheet | aSheet dataSavedByLine: aBoolean]	"aBoolean 
		ifTrue: 
			[Dialog 
				warn: 'Number of data exceeds Excel capacities (max number of column is 256). \The data will be save in lines' 
						withCRs]"
]

{ #category : #run }
CMToExcel >> deleteWorksheet [
	
	self deleteWorksheetNum: 1
]

{ #category : #run }
CMToExcel >> deleteWorksheetNum: num [
	
	(self controller worksheetAt: num) invokeMethod: #Delete
]

{ #category : #accessing }
CMToExcel >> fileName: aFileName [
	
	fileName := aFileName
]

{ #category : #write }
CMToExcel >> fillLine: anOrderedCollection [
	"Run the damage report."
	
	| sheet |
	"Get the right worksheet in the workbook."
	sheet := self controller worksheetAt: self sheetName.	"Copy our data to the new worksheet."
	[self fillLine: anOrderedCollection onSheet: sheet]
		ensure: [sheet release]
]

{ #category : #write }
CMToExcel >> fillLine: anOrderedCollection onSheet: sheetNum [
	"Fill a line in the Excel Application. The ordered collection 
	contains the values"
	
	| sheet |
	sheet := self sheets at: sheetNum.	"Get the right worksheet in the workbook."
	sheet fillFirstLineWith: anOrderedCollection
]

{ #category : #write }
CMToExcel >> formatSheet: numOrName [
	"Fill a line in the Excel Application. The ordered collection contains numbers"
	
	| sheet |
	numOrName isString
		ifTrue: [sheet := self sheets detect: [:s | s name = numOrName]]
		ifFalse: [sheet := self sheets at: numOrName].	"Get the wright worksheet in the workbook."
	sheet getValueRange autoFormat: 10	" 1 < xlFormat < 15"
]

{ #category : #read }
CMToExcel >> getDataFromSheet: numOrName [
	"Returns a collection of data from the Excel Application"
	
	| sheet data |
	numOrName isString
		ifTrue: [sheet := self sheets detect: [:s | s name = numOrName]]
		ifFalse: [sheet := self sheets at: numOrName].	"Get the wright worksheet in the workbook."
	data := sheet getValueRange value asOrderedCollection.
	data removeAllSuchThat: [:c | c allSatisfy: [:e | e isNil]].
	^data
]

{ #category : #run }
CMToExcel >> isVisible: aBoolean [
	"Show or hide the Excel window"
	
	self controller isVisible: aBoolean
]

{ #category : #releasing }
CMToExcel >> justRelease [
	"Do not quit the application, but release the receiver's resources"
	
	workbook release	"controller notNil
		ifTrue: 
			[controller release.
			controller := nil]"
]

{ #category : #'run_private' }
CMToExcel >> launchApplicationVisible: aBoolean [
	"Open a new Excel application. The application will be visible 
	according to aBoolean value"
	
	self addWorkbook.
	self isVisible: aBoolean
]

{ #category : #accessing }
CMToExcel >> linePos [
	"Return the value of linePos"
	
	^linePos
]

{ #category : #accessing }
CMToExcel >> linePos: anInteger [
	"Assign anInteger to linePos"
	
	linePos := anInteger
]

{ #category : #write }
CMToExcel >> nextCellPut: aValue onSheet: aSheetNum [
	"Fill a cell in the Excel Application."
	
	| sheet |
	"Get the right worksheet in the workbook."
	sheet := self sheets at: aSheetNum.
	sheet saveValue: aValue
]

{ #category : #run }
CMToExcel >> prepareForNextSim [
	
	self sheets do: [:sh | sh prepareForNextSim]
]

{ #category : #releasing }
CMToExcel >> release [
	"Make the application quit and release the receiver's resources"
	
	controller notNil
		ifTrue:
			[controller
				quit;
				release.
			controller := nil]
]

{ #category : #obsolete }
CMToExcel >> removeWorksheet [
	
	| worksheetsDD worksheetDD sheet r application |
	"worksheetsDD := workbook getMethod: 'Worksheets'.
	worksheetDD := worksheetsDD invokeMethod: 'Add'.
	ExcelWorksheetController currentClass onDispatchDriver: worksheetDD."
	sheet := self controller worksheetAt: 1.
	application := self controller.	"<COMDispatchDriver>"
	worksheetsDD := workbook getMethod: 'Worksheets'.	"<COMDispatchDriver>"
	worksheetDD := worksheetsDD invokeMethod: 'Add'.	"self controller saveActiveWorkbookAs: fileName."	"sheet saveAs: fileName."
	r := sheet invokeMethod: 'Name' with: #('LULU').
	self halt	"This is obsolete    ->"	"ExcelWorksheetController currentClass onDispatchDriver: r."
]

{ #category : #'run_private' }
CMToExcel >> resetLinePos [
	"reassign the default value to linePos"
	
	self linePos: 1
]

{ #category : #write }
CMToExcel >> save: anOrderedCollection onSheet: numOrName [
	"Fill a line in the Excel Application. The ordered collection contains numbers"
	
	| sheet |
	numOrName isString
		ifTrue: [sheet := self sheets detect: [:s | s name = numOrName]]
		ifFalse: [sheet := self sheets at: numOrName].	"Get the wright worksheet in the workbook."
	sheet saveValues: anOrderedCollection
]

{ #category : #write }
CMToExcel >> saveFile [
	
	self workbook saveAsFileName: fileName
]

{ #category : #write }
CMToExcel >> saveLabel: aString and: anOrderedCollection onSheet: numOrName [
	"Fill a line in the Excel Application. The ordered collection contains numbers"
	
	| sheet |
	numOrName isString
		ifTrue: [sheet := self sheets detect: [:s | s name = numOrName]]
		ifFalse: [sheet := self sheets at: numOrName].	"Get the wright worksheet in the workbook."
	[sheet saveValue: aString.
	sheet saveCollection: anOrderedCollection]
		on: GenericException
		do: [:ex | ]
]

{ #category : #charts }
CMToExcel >> setTitleFromSheet: aSheet [
	"Answer a String with the title of the graph"
	
	| info title |
	info := aSheet columnTitles.
	title := 'Dynamics of '.
	2
		to: info size
		do:
			[:i | 
			title := title , (info at: i).
			i = (info size - 1)
				ifTrue: [title := title , ' and ']
				ifFalse: [title := title , ', ']].
	^title
		copyFrom: 1
		to: title size - 2
]

{ #category : #run }
CMToExcel >> setWorksheet: aNameOrNumber [
	"Set a worksheet <aNameOrNumber>"
	
	| sheet |
	sheet := ExcelSheet newWith: (self controller worksheetAt: aNameOrNumber).
	self sheets addFirst: sheet.
	self resetLinePos
]

{ #category : #accessing }
CMToExcel >> sheetName [
	"Answer the Excel sheet name the data is in. Answer an integer 
	which will work for any language. Note: Managing the number in 
	this method allow to use several sheets"
	
	^sheetName
]

{ #category : #accessing }
CMToExcel >> sheetName: aName [
	"Set the Excel sheet name. Can be an integer 
	which will work for any language. Note: Managing the number in 
	this method allow to use several sheets"
	
	sheetName := aName
]

{ #category : #accessing }
CMToExcel >> sheets [
	
	sheets ifNil: [sheets := OrderedCollection new].
	^sheets
]

{ #category : #accessing }
CMToExcel >> sheets: aCollection [
	
	sheets := aCollection
]

{ #category : #accessing }
CMToExcel >> shouldSaveToFile [
	"Answer wether to save the results to a file"
	
	^fileName ~= nil
]

{ #category : #accessing }
CMToExcel >> visible [
	"Return the value of visible (true or false)"
	
	^visible
]

{ #category : #accessing }
CMToExcel >> visible: aBoolean [
	"Assign aBoolean to visible"
	
	visible := aBoolean
]

{ #category : #accessing }
CMToExcel >> workbook [
	"Return the value of workbook"
	
	^workbook
]
