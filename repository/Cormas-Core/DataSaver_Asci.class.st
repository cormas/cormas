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

{ #category : #save }
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

{ #category : #save }
DataSaver_Asci >> saveCollection: aCollection [
	"Updates a file in the current model 'data' directory and writes in it a tupple separated by aChar, at the end of the previous data.
	ex: self updateFile: 'aFile.txt' dataCollection: #(0 11 67) ."
	
	self
		updateFile: self filename
		dataCollection: aCollection
]

{ #category : #save }
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

{ #category : #save }
DataSaver_Asci >> saveTimes: aCollection [
	"Create a file in the current model 'data' directory and writes in it a tupple separated by aChar.
	ex: self initFile: 'aFile.txt' dataCollection: #('time' '0' '1' ...)  "
	
	aCollection addFirst: 'time'.
	self
		initFile: self filename
		dataCollection: aCollection
]

{ #category : #save }
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

{ #category : #save }
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

{ #category : #save }
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
