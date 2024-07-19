Class {
	#name : 'CMSimulationManager',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'simName',
		'simFolder',
		'traceSize',
		'finalTime'
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

{ #category : 'actions' }
CMSimulationManager >> cancel [
	
	self closeRequest.
	^false
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

{ #category : 'init' }
CMSimulationManager >> initializeSimulation [
	self setSimName.
	self simFolder: nil.
	self traceSize: 0.
	"the 2 following instructions are the responsability of the CMSpecSimulationWindow  isn't it?
	self allReplayButtonsTo: false.
	self finalTime > 0 ifTrue: [self simButtonAt: #run displayActivated: true]."
	"The 2 following instructions replace the old cormas-vw instruction self cormas initiSimulation ( which was delegating the init simulation to cormas). Now it is the simManger which is in charge of initializing the simulation"
	self cormasModel activeInit ifNil: [ ^ self error: 'No active init!' ].
	Cursor wait showWhile: [ self cormasModel initializeSimulation ].
	"the  following instruction is not yet operational with cormas-pharo
	self enableBackward ifTrue: [self storeCurrentStep]"
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

{ #category : 'accessing' }
CMSimulationManager >> traceSize [
	
	^traceSize ifNil: [traceSize := 0]
]

{ #category : 'accessing' }
CMSimulationManager >> traceSize: anObject [
	
	traceSize := anObject
]
