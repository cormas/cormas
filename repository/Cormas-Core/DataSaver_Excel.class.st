Class {
	#name : #'DataSaver_Excel',
	#superclass : #DataSaver,
	#instVars : [
		'excel',
		'sheets'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #accessing }
DataSaver_Excel class >> extension [
	
	^'.xls'
]

{ #category : #new }
DataSaver_Excel class >> newData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
	
	| inst |
	inst := super newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst createExcelConnexion.
	^inst
]

{ #category : #new }
DataSaver_Excel class >> requestForFilename: currentModel [
	"request a file name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	^self requestForFilename: currentModel extension: '.xls'
]

{ #category : #public }
DataSaver_Excel class >> saveGlobalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
	"aDicoOfData : <Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ]"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst globalDataByLineOrColumn.
	inst saveValuesOfGlobalProbe
]

{ #category : #public }
DataSaver_Excel class >> saveLocalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
	"aDicoOfData : <Dictionary> complex :
	[ #attribut1 [ id_1 (1 3 0 99 )
				id_2 (1 3 0 99 )
				id_4 (7 4 0 92 )]
	  #attribut2 [ id_1 (4 3 0 29 )
				id_2 (6 3 0 93 )
				id_4 (7 4 0 92 )] ]"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst localDataByLineOrColumn.
	inst saveValuesOfLocalProbe
]

{ #category : #release }
DataSaver_Excel >> closeAllExcelApplications [
	
	filename := directory
		construct: self getAveragedTimeSeriesFilename asFilename.
	self excel halt	"	filename := directory construct: (self getLastValueFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getPeriodAverageFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getSimAverageFilename asFilename).  
	self excel closeApplication.
	filename := directory construct: (self getTimeSerieFilename asFilename).  
	self excel closeApplication."
]

{ #category : #init }
DataSaver_Excel >> createExcelConnexion [
	"self filename: (self directory construct: 'analysis.xls')."
	
	excel := CMToExcel
		connectToFilename: self excelFilename
		visible: false
]

{ #category : #init }
DataSaver_Excel >> createSheets [
	"The sheets of the probes : Create a sheet for each probe"
	
	self excel createSheets: self probes size
]

{ #category : #accessing }
DataSaver_Excel >> excel [
	
	^excel
]

{ #category : #accessing }
DataSaver_Excel >> excel: anObject [
	
	excel := anObject
]

{ #category : #init }
DataSaver_Excel >> excelFilename [
	"convert the filename titi.xls as 'titi'"
	
	^Cormas removeExtensionOf: self filename
]

{ #category : #'+ read' }
DataSaver_Excel >> getDataFromSheet: aString [
	"Returns a collection of data from the Excel sheet (aString)"
	
	^(self excelDictionary at: self filename tail asSymbol) getDataFromSheet:
			aString
]

{ #category : #init }
DataSaver_Excel >> globalDataByLineOrColumn [
	"If the number of probes exceeds 256, the data are saved by line.
self probes : <Dictionary> simple :
	[ #probe1 (1 3 0 99 )
	  #probe2 (1 3 0 99 )
	  #probe3 (7 4 0 92 )]
	  #probe4 (4 3 0 29 ) ]"
	
	| v |
	v := self probes size > 255.
	v ifTrue: [self excel dataSavedByLine: true].
	self probes
		keysAndValuesDo:
			[:probe :coll | 
			coll size > 255
				ifTrue:
					[v
						ifTrue:
							[self cormas warn:
									'Excel is unable to save more than 256 time steps and probes'.
							self halt]]]	"self excel dataSavedByLine: false   ... by default, it is false"
]

{ #category : #init }
DataSaver_Excel >> initExcelFile [
	"Create an Excel connexion and a worksheet for each probe"
	"self createExcelConnexion."
	
	excel := CMToExcel
		connectToFilename: self excelFilename
		visible: true.
	excel isVisible: true.
	self createSheets
]

{ #category : #testing }
DataSaver_Excel >> isDataSaver_Excel [
	
	^true
]

{ #category : #init }
DataSaver_Excel >> localDataByLineOrColumn [
	"If the number of instances (ID) or the number of time steps exceeds 256, the data are saved by line.
self probes : <Dictionary> complex :
	[ #attribut1 [ id_1 (1 3 0 99 )
				id_2 (1 3 0 99 )
				id_4 (7 4 0 92 )]
	  #attribut2 [ id_1 (4 3 0 29 )
				id_2 (6 3 0 93 )
				id_4 (7 4 0 92 )] ]"
	
	self probes
		keysAndValuesDo:
			[:probe :id_Dict | 
			id_Dict size > 255
				ifTrue:
					[self excel dataSavedByLine: true.
					^true].
			id_Dict
				keysAndValuesDo:
					[:id :coll | 
					coll size > 255
						ifTrue:
							[self excel dataSavedByLine: true.
							^true]]]	"self excel dataSavedByLine: false   ... by default, it is false"
]

{ #category : #init }
DataSaver_Excel >> prepareAveragedTimeSeriesFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory
		construct: self getAveragedTimeSeriesFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled:
					('Probe: ' , key asString , ' (Average at Time, over repetitions)')
						asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"
]

{ #category : #init }
DataSaver_Excel >> prepareLastValueFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory construct: self getLastValueFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled:
					('Probe: ' , key asString , ' (at time ' , self timeSteps last asString ,
							')') asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"
]

{ #category : #init }
DataSaver_Excel >> preparePeriodAverageFiles: periodList [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory construct: self getPeriodAverageFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled:
					('Probe: ' , key asString , 'Average on period ['
						, periodList first asString , ' ' , periodList last asString , ']')
						asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"
]

{ #category : #init }
DataSaver_Excel >> prepareSimAverageFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory construct: self getSimAverageFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled:
					('Probe: ' , key asString , ' (Average on simulation)') asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"
]

{ #category : #init }
DataSaver_Excel >> prepareTimeSeriesFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| sheet |
	filename := directory construct: self getTimeSerieFilename asFilename.
	self globalDataByLineOrColumn.
	self initExcelFile.
	sheet := 1.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled: ('Probe: ' , key asString , ' (Time)') asString
				OnSheet: sheet.
			sheet := sheet + 1]	"self excel closeApplication"
]

{ #category : #release }
DataSaver_Excel >> release [
	
	COMSessionManager shutdownImage.
	excel := nil	"self excel closeApplication"
]

{ #category : #release }
DataSaver_Excel >> saveAndRelease [
	
	self excel saveFile.
	self release
]

{ #category : #'save_private' }
DataSaver_Excel >> saveCollectionWithLabel: aCollection [
	"Create the column (or a line) containing the label and the values
	aCollection = ('aString' 3 5 88 90)"
	
	self saveCollectionWithLabel: aCollection onSheet: 1
]

{ #category : #'save_private' }
DataSaver_Excel >> saveCollectionWithLabel: aCollection onSheet: sheetNumber [
	"Create the column (or a line) containing the label and the values
	aCollection = ('aString' 3 5 88 90)"
	
	| label |
	label := aCollection first asString.
	aCollection removeFirst.
	self excel saveLabel: label and: aCollection onSheet: sheetNumber
]

{ #category : #'save_private' }
DataSaver_Excel >> saveTimeStepsLabeled: aLabel OnSheet: sheetNumber [
	"Create the first column containing the time values for the probe's sheet"
	
	self excel
		saveLabel: aLabel
		and: self timeSteps
		onSheet: sheetNumber
]

{ #category : #'+ save' }
DataSaver_Excel >> saveValuesOfGlobalProbe [
	"Add the value of a probe to each sheet (probeFile type) at time 'time' 
	aDictionary : probeName + aCollection"
	
	| aCollection |
	excel createSheetsFromProbes: (List with: 'Data').
	self
		saveTimeStepsLabeled: 'Time' asString
		OnSheet: 'Data'.
	self probes keys asSortedCollection
		do:
			[:k | 
			| coll |
			coll := self probes at: k.	"self probes keysAndValuesDo: 
			[:k :coll | "
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: k asString.
			self saveCollectionWithLabel: aCollection onSheet: 'Data'].
	self excel formatSheet: 'Data'.
	self excel isVisible: true.
	self excel createChartFromSheet: self excel sheets first.
	self excel saveFile.
	COMSessionManager shutdownImage.
	excel := nil	"self excel closeApplication"
]

{ #category : #'+ save' }
DataSaver_Excel >> saveValuesOfLocalProbe [
	"Add the value of a probe to each sheet (probeFile type) at time 'time' "
	
	| sheetNumber aCollection |
	excel
		createSheetsFromProbes:
			(List withAll: (self probes keys collect: [:s | s asString])).
	sheetNumber := 1.
	self probes
		keysAndValuesDo:
			[:probe :dicoID | 
			self
				saveTimeStepsLabeled: 'Time : ' , probe asString
				OnSheet: probe asString.
			dicoID
				keysAndValuesDo:
					[:id :coll | 
					aCollection := self getCollectionOfNumbers: coll.
					aCollection addFirst: 'id_' , id printString.
					self
						saveCollectionWithLabel: aCollection
						onSheet: probe asString].
			self excel formatSheet: probe asString.
			sheetNumber := sheetNumber + 1].
	self excel isVisible: true.	"self excel createChartFromSheet: self excel sheets first."
	self excel saveFile.
	COMSessionManager shutdownImage.
	excel := nil	"self excel closeApplication"
]

{ #category : #'+ save' }
DataSaver_Excel >> updateLastValuesOfGlobalProbes [
	"Add the last value of the selected probes to each csv file"
	
	| aCollection varInformation |
	filename := directory construct: self getLastValueFilename asFilename.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.	"varInformation := key asString, varInformation."
			varInformation := key asString.
			self currentParameter isNil
				ifFalse:
					[varInformation := varInformation , ': ' , self currentParameter asString].
			aCollection addFirst: varInformation.
			self saveCollectionWithLabel: aCollection onSheet: 1]
]

{ #category : #'+ save' }
DataSaver_Excel >> updateValuesOfGlobalProbes [
	"Add the value of the selected probes to each csv file"
	
	| aCollection varInformation |
	filename := directory construct: self getTimeSerieFilename asFilename.
	self currentParameter isNil
		ifFalse: [varInformation := self currentParameter asString].
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			self saveCollectionWithLabel: aCollection onSheet: 1]
]
