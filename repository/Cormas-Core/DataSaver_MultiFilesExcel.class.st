Class {
	#name : #'DataSaver_MultiFilesExcel',
	#superclass : #'DataSaver_Excel',
	#instVars : [
		'excelDictionary'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #operation }
DataSaver_MultiFilesExcel >> displayFiles [
	"Display the Excel files"
	
	self excelDictionary values do: [:anExcel | anExcel isVisible: true]
]

{ #category : #accessing }
DataSaver_MultiFilesExcel >> excelDictionary [
	
	^excelDictionary ifNil: [excelDictionary := Dictionary new]
]

{ #category : #accessing }
DataSaver_MultiFilesExcel >> excelDictionary: anObject [
	
	excelDictionary := anObject
]

{ #category : #files }
DataSaver_MultiFilesExcel >> getAveragedTimeSeriesFilenameOfProbe: aProbeName [
	"Returne an Averaged time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^self getAveragedTimeSeriesFilename
]

{ #category : #'+ read' }
DataSaver_MultiFilesExcel >> getDataFromSheet: aString [
	"Returns a collection of data from the Excel sheet (aString)"
	
	^(self excelDictionary at: self filename tail asSymbol) getDataFromSheet:
			aString
]

{ #category : #files }
DataSaver_MultiFilesExcel >> getLastValueFilenameOfProbe: aProbeName [
	"Returne a LastValue Filename of aProbeName.
	aProbeName = <String>"
	
	^self getLastValueFilename
]

{ #category : #files }
DataSaver_MultiFilesExcel >> getPeriodAverageFilenameOfProbe: aProbeName [
	"Returne a Period Average Filename of aProbeName.
	aProbeName = <String>"
	
	^self getPeriodAverageFilename
]

{ #category : #files }
DataSaver_MultiFilesExcel >> getSimAverageFilenameOfProbe: aProbeName [
	"Returne a Sim Average Filename of aProbeName.
	aProbeName = <String>"
	
	^self getSimAverageFilename
]

{ #category : #files }
DataSaver_MultiFilesExcel >> getTimeSerieFilenameOfProbe: aProbeName [
	"Returne a time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^self getTimeSerieFilename
]

{ #category : #init }
DataSaver_MultiFilesExcel >> initExcelFile [
	"Create an Excel connexion with a worksheet for each probe"
	
	excel := CMToExcel
		connectToFilename: self excelFilename
		visible: true.
	excel isVisible: true.
	self createSheets
]

{ #category : #init }
DataSaver_MultiFilesExcel >> initExcelFile: aName [
	"Create an Excel connexion"
	
	| excelFile |
	excelFile := CMToExcel
		connectToFilename: self excelFilename
		visible: false.
	self excelDictionary
		at: aName asSymbol
		put: excelFile.
	^excelFile
]

{ #category : #init }
DataSaver_MultiFilesExcel >> prepareAveragedTimeSeriesFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile |
	filename := directory
		construct: self getAveragedTimeSeriesFilename asFilename.
	self globalDataByLineOrColumn.
	excelFile := self initExcelFile: self getAveragedTimeSeriesFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	self probes keys
		do:
			[:key | 
			self
				saveTimeStepsLabeled: ('Time \ ' , key asString) asString
				OnSheet: key asString
				onFile: self getAveragedTimeSeriesFilename]
]

{ #category : #init }
DataSaver_MultiFilesExcel >> prepareLastValueFiles [
	"Create the Excel conexion and file (one sheet per probe) and save the titles' columns"
	
	| excelFile title |
	filename := directory construct: self getLastValueFilename asFilename.
	excelFile := self initExcelFile: self getLastValueFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title add: 'Value at ' , self timeSteps last asString.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getLastValueFilename]	"excelFile isVisible: true"
]

{ #category : #init }
DataSaver_MultiFilesExcel >> preparePeriodAverageFiles: periodList [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile title |
	filename := directory construct: self getPeriodAverageFilename asFilename.
	excelFile := self initExcelFile: self getPeriodAverageFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title
		add:
			('Average on period [' , periodList first asString , ' '
				, periodList last asString , ']') asString.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getPeriodAverageFilename]	"excelFile isVisible: true"
]

{ #category : #init }
DataSaver_MultiFilesExcel >> prepareSimAverageFiles [
	"Create the Excel conexion and file (one sheet per probe) and save the titles' columns"
	
	| excelFile title |
	filename := directory construct: self getSimAverageFilename asFilename.
	excelFile := self initExcelFile: self getSimAverageFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	title := List new.
	title add: 'Average on simulation'.
	self probes keys
		do:
			[:key | 
			title addFirst: 'Probe: ' , key asString.
			self
				saveCollectionWithLabel: title
				onSheet: key asString
				onFile: self getSimAverageFilename]	"excelFile isVisible: true"
]

{ #category : #init }
DataSaver_MultiFilesExcel >> prepareTimeSeriesFiles [
	"Create the Excel conexion and file (one sheet per probe) and save time steps (first column)"
	
	| excelFile |
	filename := directory construct: self getTimeSerieFilename asFilename.
	self globalDataByLineOrColumn.
	excelFile := self initExcelFile: self getTimeSerieFilename.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	self probes keys
		do:
			[:key | 
			"aCollection := OrderedCollection with: ('Time \ ' , key asString) asString.
1 to: self cormasModel sensitivitySetter totalSimNumberWithRepeat do: [:i| aCollection add: 'sim_', i printString].
			self saveCollectionWithLabel: aCollection onSheet: key asString onFile: self getTimeSerieFilename."
			self
				saveTimeStepsLabeled: ('Time \ ' , key asString) asString
				OnSheet: key asString
				onFile: self getTimeSerieFilename]	"(self excelDictionary at: (self getTimeSerieFilename) asSymbol) isVisible: true.
	(self excelDictionary at: (self getTimeSerieFilename) asSymbol) closeApplication"
]

{ #category : #operation }
DataSaver_MultiFilesExcel >> saveAndRelease [
	"save and release all the connexions"
	
	self excelDictionary
		keysAndValuesDo:
			[:aName :aFile | 
			filename := directory construct: aName asString.
			aFile saveFile.
			aFile justRelease].
	excelDictionary := nil.
	COMSessionManager shutdownImage	"terminateServer allOwnedInterfaces"
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> saveAveragedTimeSeriesFiles: aDictionaryOfAverages [
	"Add the Averaged value of the selected probes at current time step (and averaged over repetitions) to each file"
	
	| aCollection varInformation |
	varInformation := self getInformation.
	aDictionaryOfAverages
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getAveragedTimeSeriesFilename]
]

{ #category : #'- save' }
DataSaver_MultiFilesExcel >> saveCollectionWithLabel: aCollection onSheet: sheetName onFile: aFileName [
	"Create the column (or a line) containing the label and the values.

	aCollection = ('aString' 3 5 88 90)
	sheetName = <Integer or String>
	aFileName = <String> ex: 'TimeSeries.xls'"
	
	| label |
	label := aCollection first asString.
	aCollection removeFirst.
	(self excelDictionary at: aFileName asSymbol) saveLabel: label and:
			aCollection onSheet: sheetName
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> savePeriodAverageFiles: list2 [
	"Add the average value between the first and last list2 of the selected probes to the PeriodAverage file"

	| aCollection |
	self probes
		keysAndValuesDo: [ :key :coll | 
			aCollection := List
				with:
					(Cormas
						average:
							((self getCollectionOfNumbers: coll)
								copyFrom: 1 + list2 first
								to: 1 + list2 last)).
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getPeriodAverageFilename ]
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> saveSensitivityClassification: aDictionary [
	"Save aDictionary into the current directory"
	
	| aCollection aFileName excelFile |
	filename := self directory
		construct: 'globalSensitivity' , self class extension.
	aFileName := 'globalSensitivity' , self class extension.
	excelFile := self initExcelFile: aFileName.
	excelFile createSheetsFromProbes: self probes keys asSortedCollection.
	excelFile dataSavedByLine: true.
	aDictionary
		keysAndValuesDo:
			[:key :dico | 
			aCollection := OrderedCollection new.
			dico
				keysAndValuesDo:
					[:k :v | 
					aCollection
						add:
							(List
								with: k asString
								with: v)].
			self
				saveCollectionWithLabel:
					(List
						with: 'Probe: ' , key asString
						with: 'sensitivity')
				onSheet: key asString
				onFile: aFileName.
			aCollection
				do:
					[:coll | 
					self
						saveCollectionWithLabel: coll
						onSheet: key asString
						onFile: aFileName]]
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> saveSimAverageFiles [
	"Add the Sim Averaged value of the selected probes to the SimAverage file"

	| aCollection |
	self probes
		keysAndValuesDo: [ :key :coll | 
			aCollection := List
				with: (Cormas average: (self getCollectionOfNumbers: coll)).
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getSimAverageFilename ]
]

{ #category : #'- save' }
DataSaver_MultiFilesExcel >> saveTimeStepsLabeled: aLabel OnSheet: sheetNumber onFile: aFileName [
	"Create the first column containing the time values for the probe's sheet.
	sheetNumber = <Integer or String>"
	
	(self excelDictionary at: aFileName asSymbol)
		saveLabel: aLabel
		and: self timeSteps
		onSheet: sheetNumber
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> updateLastValuesOfGlobalProbes [
	"Add the last value of the selected probes to each csv file"
	
	| aCollection |
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getLastValueFilename]
]

{ #category : #'+ save' }
DataSaver_MultiFilesExcel >> updateValuesOfGlobalProbes [
	"Add the value of the selected probes to each Excel file"
	
	| aCollection |
	self currentParameter isNil ifFalse: [self currentParameter asString].
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: self getInformation.
			self
				saveCollectionWithLabel: aCollection
				onSheet: key asString
				onFile: self getTimeSerieFilename]
]
