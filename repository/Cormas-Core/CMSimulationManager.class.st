Class {
	#name : #CMSimulationManager,
	#superclass : #Object,
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
	#category : #'Cormas-Core-Kernel'
}

{ #category : #accessing }
CMSimulationManager class >> bosExtension [
	
	^'.bos'
]

{ #category : #time }
CMSimulationManager class >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ 100
]

{ #category : #accessing }
CMSimulationManager class >> newFolder [
	
	^newFolder ifNil: [newFolder := 'A new folder']
]

{ #category : #accessing }
CMSimulationManager class >> newFolder: aFilenmaFolder [
	
	^newFolder := aFilenmaFolder
]

{ #category : #accessing }
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

{ #category : #accessing }
CMSimulationManager class >> separator [
	
	^'-------'
]

{ #category : #'replay-private' }
CMSimulationManager class >> simNameStart [
	"Return the begining part of each simName (=> 'sim_' )  "
	
	^'sim_'
]

{ #category : #'replay-private' }
CMSimulationManager >> allReplayButtonsTo: bool [
	"bool = false => all replay buttons are grey and inactivate.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward  "
	
	self simButtonAt: #stepBack displayActivated: bool.
	self simButtonAt: #runBack displayActivated: bool.
	self simButtonAt: #replayRunForward displayActivated: bool.
	self simButtonAt: #replayStepForward displayActivated: bool
]

{ #category : #actions }
CMSimulationManager >> applyUserChangeForFinalStep: aNewFinalStep [
	"this method is call from Cormas when user have manually change the inputField current step"
	
	aNewFinalStep < 0 ifTrue: [^false].
	self finalTime = aNewFinalStep ifTrue: [^true].
	self currentTime < aNewFinalStep
		ifTrue:
			[self simButtonAt: #run displayActivated: true.
			^true]
		ifFalse:
			[self simButtonAt: #run displayActivated: false.
			^false]
]

{ #category : #actions }
CMSimulationManager >> applyUserChangeForStep: aNewStep [
	"this method is call from Cormas when user have manually change the inputField current step"
	
	self enableBackward ifFalse: [^false].
	aNewStep < 0 ifTrue: [^false].
	self currentTime = aNewStep ifTrue: [^true].
	aNewStep = 0
		ifTrue: [self setButtonsForTime0]
		ifFalse: [self setButtonsForTime1].
	self currentTime < aNewStep ifTrue: [^self replayStepForward: aNewStep].
	self currentTime > aNewStep
		ifTrue:
			[buttonsForwardAreOn := false.
			^self restoreOrganizationAt: aNewStep].
	^false
]

{ #category : #accessing }
CMSimulationManager >> buttonsForwardAreOn [
	
	^ buttonsForwardAreOn 
		ifNil: [ buttonsForwardAreOn := false ]
]

{ #category : #actions }
CMSimulationManager >> cancel [
	
	self closeRequest.
	^false
]

{ #category : #'replay-forward' }
CMSimulationManager >> confirmDeviation [
	"check if bos file for next step exists. If not, then continue to simulate and to save into the same folder (continue the same simulation process).
	If exists, then proposes to save the sim history (from 0 to currentStep) into a new folder"
	
	| finename resp |
	(finename := self simFolder / (self stepFileNameAtStep: self currentTime + 1)) exists
		ifTrue: [ 
			self class newFolder: ((Cormas dumpPath: self cormasModel class name) / self newSimName).
			(resp := self openNewDeviationWin)
				ifTrue: [
					self simNumero: self simNumero + 1.
					self enableBackward
						ifTrue: [
							self copyPreviousBackStepsInNewFolder.
							self traceSize: self currentTime ]
						ifFalse: [ self traceSize: 0 ] ].
			^ resp]
		ifFalse: [ ^ true ]
]

{ #category : #'replay-forward' }
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

{ #category : #accessing }
CMSimulationManager >> cormas [
	
	^self cormasModel cormas
]

{ #category : #accessing }
CMSimulationManager >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
CMSimulationManager >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #accessing }
CMSimulationManager >> cormasModelClass [
	
	^self cormasModel class
]

{ #category : #time }
CMSimulationManager >> currentSimEnded [
	
	^ self finalTime <= self currentTime
]

{ #category : #time }
CMSimulationManager >> currentTime [
	
	^ self cormasModel timeStep
]

{ #category : #time }
CMSimulationManager >> currentTime: anInteger [
	self cormasModel timeStep: anInteger
]

{ #category : #time }
CMSimulationManager >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ self class defaultFinalTime
]

{ #category : #simulate }
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

{ #category : #'replay-backward' }
CMSimulationManager >> enableBackward [
	"not yet implemented in cormas-pharo"
		^ false
]

{ #category : #ui }
CMSimulationManager >> enableBackward: bool [
	
	enableBackward := bool.
	bool
		ifFalse: [self allReplayButtonsTo: false]
		ifTrue:
			[self currentTime = 0
				ifTrue: [self allReplayButtonsTo: false]
				ifFalse: [self allReplayButtonsTo: true]]
]

{ #category : #time }
CMSimulationManager >> finalTime [
	^ finalTime ifNil: [ finalTime := self defaultFinalTime]
]

{ #category : #time }
CMSimulationManager >> finalTime: anInteger [
	finalTime := anInteger
	
]

{ #category : #time }
CMSimulationManager >> finishSimulation [
	self cormasModel timeStep: self finalTime
]

{ #category : #accessing }
CMSimulationManager >> fixedRandomSeedValue [
	^ fixedRandomSeedValue
]

{ #category : #accessing }
CMSimulationManager >> fixedRandomSeedValue: anObject [
	fixedRandomSeedValue := anObject
]

{ #category : #accessing }
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

{ #category : #simulate }
CMSimulationManager >> initRandomSeed [
	
	self isRandomSeedFixed
		ifTrue: [Cormas randomSeed: self fixedRandomSeedValue]
		ifFalse: [Cormas initRandomSeed]
]

{ #category : #init }
CMSimulationManager >> initScenario [
	
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.	"*** initialize the simulation ***"
	self initializeSimulation.
	self keepOrReleaseRandomSeed
]

{ #category : #init }
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

{ #category : #time }
CMSimulationManager >> intoASimulation [
	"return if the current sim is between the time range (0 - final time) "
	
	^(self currentTime = 0 or: [self finalTime <= self currentTime]) not
]

{ #category : #accessing }
CMSimulationManager >> isRandomSeedFixed [
	^ isRandomSeedFixed ifNil: [ isRandomSeedFixed := false ]
]

{ #category : #accessing }
CMSimulationManager >> isRandomSeedFixed: aBoolean [
	 isRandomSeedFixed := aBoolean
]

{ #category : #simulate }
CMSimulationManager >> loopRunStep_untilFinalTime [
	[[ self currentTime < self finalTime ] whileTrue: [ self runStepByStep ]] fork
]

{ #category : #init }
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

{ #category : #ui }
CMSimulationManager >> openNewDeviationWin [
	
	| resp |
	(self openDialogInterface: #windowNewDeviation) ifFalse: [^false].
	resp := self deviationChoice value.
	resp = #noDeviation.
	resp = #deviationRandom ifTrue: [Cormas initRandomSeed].
	resp = #newDeviation
		ifTrue:
			[releaseRandomSeed value: true.
			^self setStepMethod].
	^true
]

{ #category : #'undo/redo' }
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

{ #category : #accessing }
CMSimulationManager >> redoList [
	
	^redoList ifNil: [redoList := OrderedCollection new]
]

{ #category : #accessing }
CMSimulationManager >> redoList: anObject [
	
	redoList := anObject
]

{ #category : #'replay-forward' }
CMSimulationManager >> replayRunForward [
	"Replay the stored simulation history forward using BOS file.
	Threaded process"
	
	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].	"Suspend or resume current process"
	processReplayForward isNil
		ifFalse:
			[processReplayForward suspendedContext isNil
				ifFalse:
					[processReplayForward suspendingList isNil
						ifFalse: [^processReplayForward suspend]
						ifTrue: [^processReplayForward resume]]].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Forward threaded    *********************"
	processReplayForward := ["***"
	[self currentTime < self traceSize or: [processReplayForward = nil]]
		whileTrue:
			[self replayStepForward
				ifFalse:
					[processReplayForward terminate.
					processReplayForward := nil.
					^nil]]	"***"] forkAt: Processor userBackgroundPriority.	"  *********************       END PROCESS ***        ************************"	"*********************************************************************************"	"Normaly, the instructions below are not called, because #terminate (called on process) will leave this current method"
	self finalTime = self currentTime
		ifTrue:
			[processReplayForward terminate.
			processReplayForward := nil]
]

{ #category : #'replay-forward' }
CMSimulationManager >> replayStepForward [
	"Replay a step forward using BOS file"
	
	^ self replayStepForward: self currentTime + 1
]

{ #category : #'replay-forward' }
CMSimulationManager >> replayStepForward: newStep [
	"Replay a newStep forward using BOS file"
	
	| filename resp |
	(filename := self simFolder / (self stepFileNameAtStep: newStep)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false.
			self alertMessage: 'Sorry, there is no bos file at time ' , newStep printString ,
							'
for simulation ' , self simName.
			^ false].
	undoList := nil.
	redoList := nil.
	resp := self cormasModel restoreOrganizationFromFile: filename.
	(filename := self simFolder / (self stepFileNameAtStep: newStep + 1)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false ].
	^ resp
]

{ #category : #'replay-store/restore' }
CMSimulationManager >> restoreOrganizationAt: aStep [
	" Restore the stored model state at aStep "
	
	| finename |
	(finename := self simFolder / (self stepFileNameAtStep: aStep)) exists
		ifFalse: [ self alertMessage: 'Sorry, there is no bos file at time ' , aStep printString ,
							'
for simulation ' , self simName.
			^ false].
	self buttonsForwardAreOn
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true.
			self simButtonAt: #run displayActivated: true.
			buttonsForwardAreOn := true ].
	^ self cormasModel restoreOrganizationFromFile: finename
]

{ #category : #'replay-backward' }
CMSimulationManager >> runBack [
	"Replay the story of the stored simulation backwards, using BOS file.
Threaded process"

	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse: [ processRun terminate.
			processRun := nil ].
	processReplayForward isNil
		ifFalse: [ processReplayForward terminate.
			processReplayForward := nil ].	"Suspend or resume current process"
	processReplayBackward isNil
		ifFalse: [ processReplayBackward suspendedContext isNil
				ifFalse: [ processReplayBackward suspendingList isNil
						ifFalse: [ ^ processReplayBackward suspend ]
						ifTrue: [ ^ processReplayBackward resume ] ] ].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Back threaded    *********************"
	processReplayBackward := [ "***"
	[ self currentTime <= 0 or: [ processReplayBackward isNil ] ]
		whileFalse: [ "***"
			self stepBack
				ifFalse: [ processReplayBackward terminate.
					processReplayBackward := nil.
					^ nil ] ] ] forkAt: Processor userBackgroundPriority.	"  ********************       END PROCESS ***        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self currentTime = 0
		ifTrue: [ processReplayBackward terminate.
			processReplayBackward := nil ]
]

{ #category : #simulate }
CMSimulationManager >> runSimulation [
	"  Loop over the STEPs until simulation end. This take place into a treaded process (called from runSimulationThreaded).
	Display the Duration time on the Transcript"

	| chrono |
	chrono := Time millisecondsToRun: [ self runSimulation_Basic ].
	"self simButtonAt: #run displayActivated: false."
	self displayRunDuration: chrono.
	processRun ifNotNil: [:p| p terminate.
	processRun := nil]
]

{ #category : #simulate }
CMSimulationManager >> runSimulation_Basic [
	"Run one simulation step by step.
	Do not display the Duration time on the Transcript.
	Method called from #runSimulation but also from SensitivityAnalysisAbstract #runOneSimulation"

	| continue |
	continue := true.
	[ continue ]
		whileTrue: [ self currentSimEnded
				ifTrue: [ continue := false ]
				ifFalse:
					[ " *********   One Step  ***********" " *********     Done  ***********" self runStepByStep ifNil: [ continue := false ] ] ].
	"what is the need of having  'continue' temporary variable here ?
	why the method is not written as siply as    [self currentSimEnded] whileFalse: [ self runStepByStep ]"
]

{ #category : #simulate }
CMSimulationManager >> runStepByStep [
	
	self buttonsForwardAreOn ifTrue: [buttonsForwardAreOn := false].
	undoList := nil.
	redoList := nil.
	self enableBackward
		ifTrue:
			[self confirmDeviation
				ifFalse: [^nil]
				ifTrue:
					[self cormasModel activeControl isNil
						ifTrue: [self setStepMethod ifFalse: [^nil]]]]
		ifFalse:
			[self cormasModel activeControl isNil
				ifTrue: [^self cormas alert_NoDynamic]].	"  **********   RUN Step   ********"
	self cormasModel runStep.	"  **********    Done   ********"
	self enableBackward ifTrue: [self storeCurrentStep]
]

{ #category : #'replay-private' }
CMSimulationManager >> setButtonsForTime0 [
	
	self simButtonAt: #stepBack displayActivated: false.
	self simButtonAt: #runBack displayActivated: false.
	enableBackward value
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false]
]

{ #category : #'replay-private' }
CMSimulationManager >> setButtonsForTime1 [
	
	enableBackward value
		ifTrue:
			[self simButtonAt: #stepBack displayActivated: true.
			self simButtonAt: #runBack displayActivated: true]
]

{ #category : #'replay-private' }
CMSimulationManager >> setSimName [
	"set the simName attribute to the current time"
	
	self simName: self newSimName.
	^simName
]

{ #category : #'replay-forward' }
CMSimulationManager >> setStepMethod [
	" Answer a <Boolean> "
	| resp |
	(self enableBackward isKindOf: Boolean)
		ifTrue: [ enableBackwardValue := self enableBackward asValue ].
	self listControle list: (self cormasModel class organization listAtCategoryNamed: #control).
	self listControle isEmpty
		ifTrue: [ 
			self alertMessage: 'The model does not define any method for control !'.
			^ false].
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl]
		ifFalse: [
			self listControle notEmpty
				ifTrue: [ self listControle selection: self listControle list first ] ].
	self finalStep value: self cormasModel finalTime.
	resp := self openDialogInterface: #changeStepInterface.
	resp ifFalse: [ ^ false ].
	self listControle selection isNil
		ifTrue: [ 
			self alertMessage: 'Please, select a method of #control'.
			^ self setStepMethod]
		ifFalse: [ self cormasModel activeControl: self listControle selection ].
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.
	self keepOrReleaseRandomSeed.
	^ true
]

{ #category : #'replay-private' }
CMSimulationManager >> simButtonAt: buttonName displayActivated: bool [
	"bool = false => display the buttonName in grey color and inactivate it, 
			otherwise, display the button in red or green and activate it.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward 
	bool = <Bollean>

List of buttons : runBackButton stepBackButton <--  Time  --> replayStepForwardButton replayRunForwardButton stepButton runButton 
List of icons : 
		runBack_offIcon     -     runBackIcon
		stepBack_offIcon   -   stepBackIcon
		replayStepForwardIcon  - ->   replayStepForward_offIcon (= step_offIcon)
		replayRunForwardIcon   - ->  replayRunForward_offIcon (= run_offIcon)
		step_offIcon    -    stepIcon
		run_offIcon   -      runIcon
"
	
	| aLabel aButtonName |
	(#(#step #stepBack #run #runBack #replayRunForward #replayStepForward)
		includes: buttonName) ifFalse: [self halt].
	aLabel := buttonName.
	aButtonName := buttonName.
	bool ifFalse: [aLabel := aLabel , '_off'].
	aLabel := (aLabel , #Icon) asSymbol.
	aButtonName := (aButtonName , #Button) asSymbol.	"Dev todo: 'Ancienne m√©thode pour simInterface independante'.  "	"self cormas simulationWin controller notNil 
		ifTrue: 
			[self simulationWin controller closeAndUnschedule.
			self simulationWin: nil]."
	(self cormas mainBuilder componentAt: aButtonName) isNil
		ifFalse:
			[(self cormas mainBuilder componentAt: aButtonName)
				label: (Cormas perform: aLabel)]
]

{ #category : #'replay-private' }
CMSimulationManager >> simFolder [
	"return the appropriate Dump folder = simName"
	
	simFolder
		ifNil: [ simFolder := (Cormas dumpPath: self cormasModel class name) / self simName ].
	simFolder ensureCreateDirectory. 
	^ simFolder
]

{ #category : #'replay-private' }
CMSimulationManager >> simFolder: aFilename [
	"Set the simFolder = aFilename"
	
	^simFolder := aFilename
]

{ #category : #accessing }
CMSimulationManager >> simName [
	^ simName ifNil: [ simName := 'unnamed' ]
]

{ #category : #accessing }
CMSimulationManager >> simName: aName [
	
	simName := aName.
]

{ #category : #'replay-private' }
CMSimulationManager >> simNameStart [
	" Return the begining part of each simName (=> 'sim_' )  "
	
	^ self class simNameStart 
]

{ #category : #accessing }
CMSimulationManager >> simNumero [
	
	^simNumero ifNil: [simNumero := 0]
]

{ #category : #accessing }
CMSimulationManager >> simNumero: nb [
	
	undoList := nil.
	redoList := nil.
	simNumero := nb.
]

{ #category : #'replay-store/restore' }
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

{ #category : #'replay-backward' }
CMSimulationManager >> stepBack [
	"Replay a step backward using BOS file"
	
	self currentTime <= 0 ifTrue: [ ^ false ].
	^ self restoreOrganizationAt: self currentTime - 1
]

{ #category : #'replay-private' }
CMSimulationManager >> stepFileNameAtStep: aTimeStep [
	"return a string for the file, with its extension. 
	aTimeStep: <Integer>
	Example:   stepFileNameAtStep: 22 =>   'step_22.bos'   "
	
	^self stepNameStart , aTimeStep printString , self class bosExtension
]

{ #category : #'replay-private' }
CMSimulationManager >> stepNameStart [
	"Return the begining part of each stepFilename (=> 'step_' )  "
	"return a string for the file"
	
	^'step_'
]

{ #category : #'undo/redo' }
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

{ #category : #'replay-store/restore' }
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

{ #category : #init }
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

{ #category : #accessing }
CMSimulationManager >> traceSize [
	
	^traceSize ifNil: [traceSize := 0]
]

{ #category : #accessing }
CMSimulationManager >> traceSize: anObject [
	
	traceSize := anObject
]

{ #category : #'undo/redo' }
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

{ #category : #accessing }
CMSimulationManager >> undoList [
	
	^undoList ifNil: [undoList := OrderedCollection new]
]

{ #category : #accessing }
CMSimulationManager >> undoList: anObject [
	
	undoList := anObject
]
