Class {
	#name : #'DataSaver_Asci',
	#superclass : #DataSaver,
	#classInstVars : [
		'extension'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #accessing }
DataSaver_Asci class >> extension [
	
	^extension ifNil: [extension := '.csv']
]

{ #category : #accessing }
DataSaver_Asci class >> extension: anObject [
	
	extension := anObject
]

{ #category : #'+ save' }
DataSaver_Asci >> initFile: aStringOrFilename dataCollection: aCollec [
	"Create a file in the current model 'data' directory and writes in it a tupple separated by DataSaver separator.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' 'value1' 'value2')"
	
	| aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	aFilename exists ifTrue: [aFilename delete].
	self updateFile: aFilename dataCollection: aCollec
]

{ #category : #init }
DataSaver_Asci >> prepareAveragedTimeSeriesFiles [
	"Create the files (one per probe) and save time steps (first column)"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getAveragedTimeSeriesFilenameOfProbe: key asString.
			times := self timeSteps copy.
			times
				addFirst:
					'Probe: ' , key asString , ' (Average at Time, over repetitions)'.
			self updateFile: aFileName dataCollection: times]
]

{ #category : #init }
DataSaver_Asci >> prepareLastValueFiles [
	"Create the files (one per probe, LastValue_XXX.csv.) and save last time step"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getLastValueFilenameOfProbe: key asString.
			times := List new.
			times add: 'Probe: '.
			times add: 'Value at ' , self timeSteps last asString.
			self updateFile: aFileName dataCollection: times]
]

{ #category : #init }
DataSaver_Asci >> preparePeriodAverageFiles: periodList [
	"Create the files (one per probe) and save last time step"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			times := List new.
			times add: 'Probe: '.
			times
				add:
					'Average on period [' , periodList first asString , ' '
						, periodList last asString , ']'.
			aFileName := self getPeriodAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: times]
]

{ #category : #init }
DataSaver_Asci >> prepareSimAverageFiles [
	"Create the files (one per probe,SimAverage_XXX.csv.) and save the average of each probe"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getSimAverageFilenameOfProbe: key asString.
			times := List new.
			times add: 'Probe: '.
			times add: 'Average on simulation'.
			self updateFile: aFileName dataCollection: times]
]

{ #category : #init }
DataSaver_Asci >> prepareTimeSeriesFiles [
	"Create the files (one per probe) and save time steps (first column)"
	
	| aFileName times |
	self probes keys
		do:
			[:key | 
			aFileName := self getTimeSerieFilenameOfProbe: key asString.
			times := self timeSteps copy.
			times addFirst: 'Probe: ' , key asString , ' (Time)'.
			self updateFile: aFileName dataCollection: times]
]

{ #category : #'+ save multi probes' }
DataSaver_Asci >> saveAveragedTimeSeriesFiles: aDictionaryOfAverages [
	"Add the Averaged value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation |
	varInformation := self getInformation.
	aDictionaryOfAverages
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			aFileName := self getAveragedTimeSeriesFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]
]

{ #category : #'+ save' }
DataSaver_Asci >> saveCollection: aCollection [
	"Updates a file in the current model 'data' directory and writes in it a tupple separated by aChar, at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) ."
	
	self
		updateFile: self filename
		dataCollection: aCollection
]

{ #category : #'+ save multi probes' }
DataSaver_Asci >> savePeriodAverageFiles: list2 [
	"Add the average value between the first and last list2 of the selected probes to each PeriodAverage csv file"

	| aCollection aFileName varInformation info |
	info := self getInformation.
	self probes
		keysAndValuesDo: [ :key :coll | 
			aCollection := List
				with:
					(Cormas
						average:
							((self getCollectionOfNumbers: coll)
								copyFrom: 1 + list2 first
								to: 1 + list2 last)).
			info = ' '
				ifTrue: [ varInformation := key asString ]
				ifFalse: [ varInformation := key asString , ': ' , info ].
			aCollection addFirst: varInformation.
			aFileName := self getPeriodAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection ]
]

{ #category : #'+ save' }
DataSaver_Asci >> saveSensitivityClassification: aDictionary [
	"Save aDictionary into the current directory"
	
	| aCollection aFileName |
	aDictionary
		keysAndValuesDo:
			[:key :dico | 
			aCollection := OrderedCollection new.
			dico
				keysAndValuesDo:
					[:k :v | 
					aCollection
						add:
							(Array
								with: k asString
								with: v)].
			aFileName := 'globalSensitivityOf_' , key asString
				, self class extension.
			self
				updateFile: aFileName
				dataCollection:
					(Array
						with: 'Probe: ' , key asString
						with: 'sensitivity').
			aCollection
				do: [:coll | self updateFile: aFileName dataCollection: coll]]
]

{ #category : #'+ save multi probes' }
DataSaver_Asci >> saveSimAverageFiles [
	"Add the Sim Average value of the selected probes to each csv file"

	| aCollection aFileName varInformation info |
	info := self getInformation.
	self probes
		keysAndValuesDo: [ :key :coll | 
			aCollection := List
				with: (Cormas average: (self getCollectionOfNumbers: coll)).
			info = ' '
				ifTrue: [ varInformation := key asString ]
				ifFalse: [ varInformation := key asString , ': ' , info ].
			aCollection addFirst: varInformation.
			aFileName := self getSimAverageFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection ]
]

{ #category : #'+ save' }
DataSaver_Asci >> saveTimes: aCollection [
	"Create a file in the current model 'data' directory and writes in it a tupple separated by aChar.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' '0' '1' ...)  "
	
	aCollection addFirst: 'time'.
	self
		initFile: self filename
		dataCollection: aCollection
]

{ #category : #'+ save' }
DataSaver_Asci >> saveValuesOfGlobalProbe [
	"Add the value of a probe to each sheet (probeFile type) at time 'time' 
	aDictionary : probeName + aCollection"
	
	| aCollection |
	self saveTimes: self timeSteps.
	self probes
		keysAndValuesDo:
			[:k :coll | 
			aCollection := self getCollectionOfNumbers: coll.
			aCollection addFirst: k asString.
			self saveCollection: aCollection]
]

{ #category : #'+ save' }
DataSaver_Asci >> saveValuesOfLocalProbe [
	
	| aCollection |
	self saveTimes: self timeSteps.
	self probes
		keysAndValuesDo:
			[:attribut :dicoID | 
			dicoID
				keysAndValuesDo:
					[:id :coll | 
					aCollection := self getCollectionOfNumbers: coll.
					aCollection addFirst: attribut asString , '_' , id printString.
					self saveCollection: aCollection]]
]

{ #category : #'+ save' }
DataSaver_Asci >> updateFile: aStringOrFilename dataCollection: aCollec [
	"Updates a file in the current model 'data' directory and writes in it a tupple (separated by self class separator), at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) "
	
	| stream aFilename |
	aFilename := self stringToFilename: aStringOrFilename.
	stream := aFilename appendStream.
	aCollec
		do:
			[:element | 
			stream nextPutAll: element asString.
			stream nextPutAll: DataSaver_Asci separatorAsString].
	stream nextPutAll: '\' withCRs.
	stream close
]

{ #category : #'+ save multi probes' }
DataSaver_Asci >> updateLastValuesOfGlobalProbes [
	"Add the last value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation info |
	info := self getInformation.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := List with: (self getCollectionOfNumbers: coll) last.	"varInformation := key asString, varInformation."
			info = ' '
				ifTrue: [varInformation := key asString]
				ifFalse: [varInformation := key asString , ': ' , info].
			aCollection addFirst: varInformation.
			aFileName := self getLastValueFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]
]

{ #category : #'+ save multi probes' }
DataSaver_Asci >> updateValuesOfGlobalProbes [
	"Add the value of the selected probes to each csv file"
	
	| aCollection aFileName varInformation |
	varInformation := self getInformation.
	self probes
		keysAndValuesDo:
			[:key :coll | 
			aCollection := self getCollectionOfNumbers: coll.	"varInformation := key asString, varInformation."
			self currentParameter isNil ifTrue: [varInformation := key asString].
			aCollection addFirst: varInformation.
			aFileName := self getTimeSerieFilenameOfProbe: key asString.
			self updateFile: aFileName dataCollection: aCollection]
]
