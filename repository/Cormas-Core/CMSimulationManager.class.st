Class {
	#name : 'CMSimulationManager',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'simNumero',
		'simName',
		'simFolder',
		'buttonsForwardAreOn',
		'isRandomSeedFixed',
		'fixedRandomSeedValue',
		'traceSize',
		'processRun',
		'processReplayBackward',
		'processReplayForward',
		'undoList',
		'redoList',
		'finalTime',
		'enableBackward'
	],
	#classInstVars : [
		'newFolder'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'accessing' }
CMSimulationManager class >> bosExtension [
	
	^'.bos'
]

{ #category : 'time' }
CMSimulationManager class >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ 100
]

{ #category : 'accessing' }
CMSimulationManager class >> newFolder [
	
	^newFolder ifNil: [newFolder := 'A new folder']
]

{ #category : 'accessing' }
CMSimulationManager class >> newFolder: aFilenmaFolder [
	
	^newFolder := aFilenmaFolder
]

{ #category : 'accessing' }
CMSimulationManager class >> newFolderName [
	"return a String for newFolder (starting at model's name"
	
	| i listComp str |
	self newFolder isString ifTrue: [^self newFolder].
	listComp := self newFolder components.
	i := listComp
		indexOf: 'Models'
		ifAbsent: [^self newFolder asString].
	str := '..'.
	(listComp
		copyFrom: i + 1
		to: listComp size) do: [:e | str := str , listComp first , e].
	^str
]

{ #category : 'accessing' }
CMSimulationManager class >> separator [
	
	^'-------'
]

{ #category : 'replay-private' }
CMSimulationManager class >> simNameStart [
	"Return the begining part of each simName (=> 'sim_' )  "
	
	^'sim_'
]

{ #category : 'accessing' }
CMSimulationManager >> buttonsForwardAreOn [
	
	^ buttonsForwardAreOn 
		ifNil: [ buttonsForwardAreOn := false ]
]

{ #category : 'actions' }
CMSimulationManager >> cancel [
	
	self closeRequest.
	^false
]

{ #category : 'replay-forward' }
CMSimulationManager >> copyPreviousBackStepsInNewFolder [
	
	| stepFiles previousFolder |
	stepFiles := (self simFolder directories select: [ : st | st beginsWith: self stepNameStart ])
		select: [ : str | 
			(str
				copyFrom: 1 + self stepNameStart size
				to: str size) asNumber <= self currentTime ].	"change it simFolder and simName"
				
	previousFolder := self simFolder copy.
	self simFolder: self class newFolder.
	self simName: self class newFolder tail.	"copy the stepfiles to the new folder"
	stepFiles do: [ : str | 
		| files |
		(files := previousFolder filesMatching: str) isEmpty
			ifFalse: [ files first copyTo: (self simFolder / files first tail) ] ]
]

{ #category : 'accessing' }
CMSimulationManager >> cormas [
	
	^self cormasModel cormas
]

{ #category : 'accessing' }
CMSimulationManager >> cormasModel [
	
	^cormasModel
]

{ #category : 'accessing' }
CMSimulationManager >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : 'accessing' }
CMSimulationManager >> cormasModelClass [
	
	^self cormasModel class
]

{ #category : 'time' }
CMSimulationManager >> currentSimEnded [
	
	^ self finalTime <= self currentTime
]

{ #category : 'time' }
CMSimulationManager >> currentTime [
	
	^ self cormasModel timeStep
]

{ #category : 'time' }
CMSimulationManager >> currentTime: anInteger [
	self cormasModel timeStep: anInteger
]

{ #category : 'time' }
CMSimulationManager >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ self class defaultFinalTime
]

{ #category : 'simulate' }
CMSimulationManager >> displayRunDuration: duration [
	"display on the Transcript, the duration time of the simulation"

	| txt |
	txt := 'Simulation [' , self simName , '] was run in ' , duration printString
		, ' milliseconds'.
	duration > 1000
		ifTrue: [ | dur |
			txt := txt , ', ie. '.
			dur := Time fromSeconds: duration / 1000.
			txt := txt , dur hours printString , ' h: ' , dur minutes printString , ' m: '
				, dur seconds asFloat printString , ' s.' ].
	Transcript
		cr;
		show: txt
]

{ #category : 'replay-backward' }
CMSimulationManager >> enableBackward [
	"not yet implemented in cormas-pharo"
		^ false
]

{ #category : 'time' }
CMSimulationManager >> finalTime [
	^ finalTime ifNil: [ finalTime := self defaultFinalTime]
]

{ #category : 'time' }
CMSimulationManager >> finalTime: anInteger [
	finalTime := anInteger
	
]

{ #category : 'time' }
CMSimulationManager >> finishSimulation [
	self cormasModel timeStep: self finalTime
]

{ #category : 'accessing' }
CMSimulationManager >> fixedRandomSeedValue [
	^ fixedRandomSeedValue
]

{ #category : 'accessing' }
CMSimulationManager >> fixedRandomSeedValue: anObject [
	fixedRandomSeedValue := anObject
]

{ #category : 'accessing' }
CMSimulationManager >> getStepNumberOfBosFilename: aFilename [
	"Return the number from the name of the bosFile.
	Example: 'step_26.bos' => 26
	aFilename = <String>"
	
	| name |
	name := (Cormas splitString: aFilename with: $.) first.
	name := name
		copyFrom: self stepNameStart size + 1
		to: name size.
	^Cormas stringAsObjectType: name
]

{ #category : 'simulate' }
CMSimulationManager >> initRandomSeed [
	
	self isRandomSeedFixed
		ifTrue: [Cormas randomSeed: self fixedRandomSeedValue]
		ifFalse: [Cormas initRandomSeed]
]

{ #category : 'init' }
CMSimulationManager >> initializeSimulation [
	self setSimName.
	self simFolder: nil.
	self simNumero: self simNumero + 1.
	self traceSize: 0.
	"the 2 following instructions are the responsability of the CMSpecSimulationWindow  isn't it?
	self allReplayButtonsTo: false.
	self finalTime > 0 ifTrue: [self simButtonAt: #run displayActivated: true]."
	self initRandomSeed.
	"The 2 following instructions replace the old cormas-vw instruction self cormas initiSimulation ( which was delegating the init simulation to cormas). Now it is the simManger which is in charge of initializing the simulation"
	self cormasModel activeInit isNil
		ifTrue: [ ^ self cormas alert_NoInit ].
	Cursor wait showWhile: [ self cormasModel initializeSimulation ].
	"the  following instruction is not yet operational with cormas-pharo
	self enableBackward ifTrue: [self storeCurrentStep]"
]

{ #category : 'time' }
CMSimulationManager >> intoASimulation [
	"return if the current sim is between the time range (0 - final time) "
	
	^(self currentTime = 0 or: [self finalTime <= self currentTime]) not
]

{ #category : 'accessing' }
CMSimulationManager >> isRandomSeedFixed [
	^ isRandomSeedFixed ifNil: [ isRandomSeedFixed := false ]
]

{ #category : 'accessing' }
CMSimulationManager >> isRandomSeedFixed: aBoolean [
	 isRandomSeedFixed := aBoolean
]

{ #category : 'init' }
CMSimulationManager >> newSimName [
	"Return a new simName defined from the current clock time. 
	Ex:    self basicNew newSimName  =>   sim_2014.04.22-14.09.43"
	
	| d |
	d := DateAndTime now.
	^ self simNameStart , d year printString , '.'
		,
			(d month < 10
				ifTrue: [ '0' , d month printString ]
				ifFalse: [ d month printString]) , '.'
		,
			(d day < 10
				ifTrue: [ '0' , d day printString ]
				ifFalse: [ d day printString ]) , '-'
		,
			(d hour < 10
				ifTrue: [ '0' , d hour printString ]
				ifFalse: [ d hour printString ]) , '.'
		,
			(d minute < 10
				ifTrue: [ '0' , d minute printString ]
				ifFalse: [ d minute printString ]) , '.'
		,
			(d second < 10
				ifTrue: [ '0' , d second printString ]
				ifFalse: [ d second printString ])
]

{ #category : 'undo/redo' }
CMSimulationManager >> redo [
	"reload the last redo BOS File from the redoList"
	
	| filename currentFile |
	self redoList size < 2 ifTrue: [ ^ self alertMessage: 'No available Redo' ].
	currentFile := self redoList last.
	self redoList removeLast.
	filename := self redoList last.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifTrue: [ self undoList add: currentFile ]
		ifFalse: [ redoList := nil ]
]

{ #category : 'accessing' }
CMSimulationManager >> redoList [
	
	^redoList ifNil: [redoList := OrderedCollection new]
]

{ #category : 'accessing' }
CMSimulationManager >> redoList: anObject [
	
	redoList := anObject
]

{ #category : 'replay-private' }
CMSimulationManager >> setSimName [
	"set the simName attribute to the current time"
	
	self simName: self newSimName.
	^simName
]

{ #category : 'replay-private' }
CMSimulationManager >> simFolder [
	"return the appropriate Dump folder = simName"
	
	simFolder
		ifNil: [ simFolder := (Cormas dumpPath: self cormasModel class name) / self simName ].
	simFolder ensureCreateDirectory. 
	^ simFolder
]

{ #category : 'replay-private' }
CMSimulationManager >> simFolder: aFilename [
	"Set the simFolder = aFilename"
	
	^simFolder := aFilename
]

{ #category : 'accessing' }
CMSimulationManager >> simName [
	^ simName ifNil: [ simName := 'unnamed' ]
]

{ #category : 'accessing' }
CMSimulationManager >> simName: aName [
	
	simName := aName.
]

{ #category : 'replay-private' }
CMSimulationManager >> simNameStart [
	" Return the begining part of each simName (=> 'sim_' )  "
	
	^ self class simNameStart 
]

{ #category : 'accessing' }
CMSimulationManager >> simNumero [
	
	^simNumero ifNil: [simNumero := 0]
]

{ #category : 'accessing' }
CMSimulationManager >> simNumero: nb [
	
	undoList := nil.
	redoList := nil.
	simNumero := nb.
]

{ #category : 'replay-store/restore' }
CMSimulationManager >> snapshotCurrentState [
	"Snapshot the current simulation state as BOS file. Time is temporary set to 0, in order to use the BOS file as initial state of further simulations"
	
	| finename currentTime text |
	finename := self 
		requestFileNameForSave: 'Save current simulation state as'
		default: ((Cormas dumpPath: self cormasModel class name) / (self stepFileNameAtStep: 0)).
	finename isEmpty ifTrue: [^nil].
	currentTime := self currentTime.
	self currentTime: 0.
	self cormasModel dumpOrganizationOnFile: finename asFilename.
	self currentTime: currentTime.
	text := ('	Dump at step ' , currentTime printString) asText.
	text := text , '\	The current simulation state has been saved as ' withCRs , (finename asText emphasizeAllWith: #italic).
	text := text
		,
			'\	To reuse it as starting point for the next simulations, write the following instruction into an #init method: \	'
				withCRs.
	text := text
		,
			(('self restoreOrganizationFromFile: ''' , finename , ''' asFilename')
				asText emphasizeAllWith: #bold).
	self alertMessage: text.
	Cormas println: text
]

{ #category : 'replay-private' }
CMSimulationManager >> stepFileNameAtStep: aTimeStep [
	"return a string for the file, with its extension. 
	aTimeStep: <Integer>
	Example:   stepFileNameAtStep: 22 =>   'step_22.bos'   "
	
	^self stepNameStart , aTimeStep printString , self class bosExtension
]

{ #category : 'replay-private' }
CMSimulationManager >> stepNameStart [
	"Return the begining part of each stepFilename (=> 'step_' )  "
	"return a string for the file"
	
	^'step_'
]

{ #category : 'undo/redo' }
CMSimulationManager >> storeBeforeManipulation [
	"Store the whole state of the current model as BOS file into the appropriate simFolder . This is done before manipulation from the user, in order to enable the Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	| filename |
	filename := self simFolder / self stepNameStart , self currentTime printString , '_'
				, (self undoList size + 1) printString , self class bosExtension.
	self undoList addLast: filename.
	self redoList isEmpty 
		ifFalse: [ redoList := nil ].
	self cormasModel dumpOrganizationOnFile: filename
]

{ #category : 'replay-store/restore' }
CMSimulationManager >> storeCurrentStep [
	"store the current step into the appropriate Dump folder (store After the step execution)"
	
	| filename |
	(filename := self simFolder / (self stepFileNameAtStep: self currentTime)) exists
		ifTrue: [ 
			self simFolder: self class newFolder.
			^ self storeCurrentStep ].
	self cormasModel dumpOrganizationOnFile: filename.
	self traceSize < self currentTime 
		ifTrue: [ traceSize := self currentTime ]
]

{ #category : 'init' }
CMSimulationManager >> terminateAllProcesses [
	processReplayForward isNil
		ifFalse: [ processReplayForward terminate.
			processReplayForward := nil ].
	processReplayBackward isNil
		ifFalse: [ processReplayBackward terminate.
			processReplayBackward := nil ].
	processRun isNil
		ifTrue: [ ^ self ].
	processRun terminate.
	processRun := nil
]

{ #category : 'accessing' }
CMSimulationManager >> traceSize [
	
	^traceSize ifNil: [traceSize := 0]
]

{ #category : 'accessing' }
CMSimulationManager >> traceSize: anObject [
	
	traceSize := anObject
]

{ #category : 'undo/redo' }
CMSimulationManager >> undo [
	"reload the last BOS File from the undoList"
	
	| filename |
	self undoList isEmpty ifTrue: [ ^ self alertMessage: 'No available Undo' ].
	filename := self undoList last.
	self redoList isEmpty
		ifTrue:
			[self storeBeforeManipulation.
			self redoList add: self undoList last.
			self undoList removeLast].
	self undoList removeLast.
	self redoList add: filename.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifFalse: [ undoList := nil ]
]

{ #category : 'accessing' }
CMSimulationManager >> undoList [
	
	^undoList ifNil: [undoList := OrderedCollection new]
]

{ #category : 'accessing' }
CMSimulationManager >> undoList: anObject [
	
	undoList := anObject
]
