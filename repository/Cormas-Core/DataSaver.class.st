Class {
	#name : #DataSaver,
	#superclass : #Object,
	#instVars : [
		'cormasModel',
		'filename',
		'timeSteps',
		'probes',
		'directory',
		'currentParameter'
	],
	#classInstVars : [
		'separator'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #accessing }
DataSaver class >> extension [
	
	^'.txt'
]

{ #category : #util }
DataSaver class >> getFileName: nameWithoutExtension forModel: currentModel [
	"return a Filename to store the data.
	currentModel : <CormasModel>"
	
	| fileName |
	fileName := (Cormas dataPath: currentModel class name)
		construct: nameWithoutExtension asString , self extension.
	^fileName asFilename
]

{ #category : #new }
DataSaver class >> newData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
	"Create a new instance of DataSaver, ready to save a dictionary of data on HD (ask for file).
aDicoOfData : <Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ]
aCollOfTimeSteps : <OrderedCollection> OrderedCollection (0 1 2 3 4 .....19 20)
cormasModel : an instance of <CormasModel>"
	
	| inst |
	inst := self newWith: cormasModel.
	inst ifNil: [^nil].
	inst timeSteps: aCollOfTimeSteps.
	inst probes: aDicoOfData.
	^inst
]

{ #category : #new }
DataSaver class >> newOnFolder: folder model: cormasModel [
	
	| instance |
	instance := self new.
	instance cormasModel: cormasModel.
	instance directory: folder.
	^instance
]

{ #category : #new }
DataSaver class >> newWith: cormasModel [
	"Create a new instance of DataSaver (ask for file destination).
cormasModel : an instance of <CormasModel>"
	
	| fileName instance |
	fileName := self requestForFilename: cormasModel.
	fileName ifNil: [^nil].
	instance := self new.
	instance cormasModel: cormasModel.
	instance filename: fileName.
	^instance
]

{ #category : #new }
DataSaver class >> newWith: cormasModel filename: nameWithoutExtension [
	
	| fileName instance |
	fileName := self getFileName: nameWithoutExtension forModel: cormasModel.
	fileName ifNil: [^nil].
	instance := self new.
	instance cormasModel: cormasModel.
	instance filename: fileName.
	^instance
]

{ #category : #util }
DataSaver class >> requestForDirectory: currentModel [
	"request a directory name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	^self requestForDirectory: currentModel defaultName: 'newName'
]

{ #category : #util }
DataSaver class >> requestForDirectory: currentModel defaultName: aString [
	"request a directory name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	| fileName aName |
	aName := (Cormas dataPath: currentModel class name) construct: aString.
	fileName := Dialog requestNewDirectoryName: 'Name a directory' default:
			aName.
	fileName = ''
		ifTrue: [^nil]
		ifFalse: [^fileName asFilename]
]

{ #category : #util }
DataSaver class >> requestForFilename: currentModel [
	"request a file name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	^self
		requestForFilename: currentModel
		extension: self extension
]

{ #category : #util }
DataSaver class >> requestForFilename: currentModel extension: stringExtension [
	"request a file name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	| defaultFileName fileName |
	defaultFileName := (Cormas dataPath: currentModel class name)
		construct: currentModel class name asString , stringExtension.
	fileName := Dialog requestNewFileName: 'Save as' default: defaultFileName.
	fileName = ''
		ifTrue: [^nil]
		ifFalse: [^fileName asFilename]
]

{ #category : #public }
DataSaver class >> saveGlobalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
	"Save a dictionary of data on HD (ask for file).
aDicoOfData : <Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ]
aCollOfTimeSteps : <OrderedCollection> OrderedCollection (0 1 2 3 4 .....19 20)
cormasModel : an instance of <CormasModel>"
	
	| inst |
	inst := self newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst saveValuesOfGlobalProbe
]

{ #category : #public }
DataSaver class >> saveLocalData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel [
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
	inst saveValuesOfLocalProbe
]

{ #category : #util }
DataSaver class >> separator [
	
	separator ifNil: [separator := $;].
	^separator
]

{ #category : #util }
DataSaver class >> separator: anObject [
	
	separator := anObject
]

{ #category : #util }
DataSaver class >> separatorAsString [
	"DataSaver_Asci separatorAsString"
	
	^self separator asSymbol asString
]

{ #category : #accessing }
DataSaver >> cormas [
	
	^Cormas current
]

{ #category : #accessing }
DataSaver >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
DataSaver >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #accessing }
DataSaver >> currentParameter [
	
	^currentParameter
]

{ #category : #accessing }
DataSaver >> currentParameter: anObject [
	
	currentParameter := anObject
]

{ #category : #accessing }
DataSaver >> directory [
	
	^directory
]

{ #category : #accessing }
DataSaver >> directory: anObject [
	
	directory := anObject
]

{ #category : #accessing }
DataSaver >> filename [
	
	^filename
]

{ #category : #accessing }
DataSaver >> filename: anObject [
	
	filename := anObject
]

{ #category : #files }
DataSaver >> getAveragedTimeSeriesFilename [
	"Returne an Averaged time Series Filename"
	
	^'AveragedTimeSeries' , self class extension
]

{ #category : #files }
DataSaver >> getAveragedTimeSeriesFilenameOfProbe: aProbeName [
	"Returne an Averaged time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^'AveragedTimeSeries_' , aProbeName asString , self class extension
]

{ #category : #converting }
DataSaver >> getCollectionOfNumbers: aCollection [
	
	^aCollection collect: [:e | e asFloat]
]

{ #category : #files }
DataSaver >> getLastValueFilename [
	"Returne a Last Value Filename"
	
	^'LastValue' , self class extension
]

{ #category : #files }
DataSaver >> getLastValueFilenameOfProbe: aProbeName [
	"Returne a LastValue Filename of aProbeName.
	aProbeName = <String>"
	
	^'LastValue_' , aProbeName asString , self class extension
]

{ #category : #files }
DataSaver >> getPeriodAverageFilename [
	"Returne a Period Average Filename"
	
	^'PeriodAverage' , self class extension
]

{ #category : #files }
DataSaver >> getPeriodAverageFilenameOfProbe: aProbeName [
	"Returne a Period Average Filename of aProbeName.
	aProbeName = <String>"
	
	^'PeriodAverage_' , aProbeName asString , self class extension
]

{ #category : #files }
DataSaver >> getSimAverageFilename [
	"Returne a Sim Average Filename"
	
	^'SimAverage' , self class extension
]

{ #category : #files }
DataSaver >> getSimAverageFilenameOfProbe: aProbeName [
	"Returne a Sim Average Filename of aProbeName.
	aProbeName = <String>"
	
	^'SimAverage_' , aProbeName asString , self class extension
]

{ #category : #files }
DataSaver >> getTimeSerieFilename [
	"Returne a Excel time Series Filename"
	
	^'TimeSeries' , self class extension
]

{ #category : #files }
DataSaver >> getTimeSerieFilenameOfProbe: aProbeName [
	"Returne a time Series Filename of aProbeName.
	aProbeName = <String>"
	
	^'TimeSeries_' , aProbeName asString , self class extension
]

{ #category : #testing }
DataSaver >> isDataSaver_Excel [
	
	^false
]

{ #category : #init }
DataSaver >> prepareTimeSeriesFiles [
	"Create the file and set the variables names and the time steps."
	
	self subclassResponsibility
]

{ #category : #accessing }
DataSaver >> probes [
	"A dictionary of the data: probe name as key and values as collection:
<Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ...... ]"
	
	^probes
]

{ #category : #accessing }
DataSaver >> probes: aDictionary [
	"A dictionary of the data: probe name as key and values as collection:
<Dictionary> simple :
	[ #attribut1 (1 3 0 99 )
	  #attribut2 (23 4 8 1) ...... ]"
	
	probes := aDictionary
]

{ #category : #'+ save' }
DataSaver >> saveAveragedTimeSeriesFiles: aDictionary [
	"Add the Averaged value of the selected probes at current time step (and averaged over repetitions) to each file"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> savePeriodAverageFiles: list2 [
	"Add the average value between the first and last list2 of the selected probes to the PeriodAverage file"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> saveSensitivityClassification: aDictionary [
	"Save aDictionary into the current directory"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> saveSimAverageFiles [
	"Add the Sim Averaged value of the selected probes to the SimAverage file"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> saveValuesOfGlobalProbe [
	"Add the value of a probe to each sheet (probeFile type) at time 'time' 
	aDictionary : probeName + aCollection"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> saveValuesOfLocalProbe [
	"Add the value of a probe to each sheet (probeFile type) at time 'time' "
	
	self subclassResponsibility
]

{ #category : #private }
DataSaver >> setOATfilename [
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory "
	
	^filename := 'OATanalysis.' , self class extension
]

{ #category : #private }
DataSaver >> stringToFilename: aStringOrFilename [
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory "
	
	self directory isNil
		ifTrue: [^self cormasModel stringToFilename: aStringOrFilename]
		ifFalse: [^self directory construct: aStringOrFilename]
]

{ #category : #accessing }
DataSaver >> timeSteps [
	
	^timeSteps
]

{ #category : #accessing }
DataSaver >> timeSteps: aColl [
	
	timeSteps := aColl
]

{ #category : #'+ save' }
DataSaver >> updateLastValuesOfGlobalProbes [
	"Add the last value of the selected probes to target file"
	
	self subclassResponsibility
]

{ #category : #'+ save' }
DataSaver >> updateValuesOfGlobalProbes [
	"Add the value of the selected probes to target file"
	
	self subclassResponsibility
]
