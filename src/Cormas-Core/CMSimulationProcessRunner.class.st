Class {
	#name : 'CMSimulationProcessRunner',
	#superclass : 'Object',
	#instVars : [
		'simulationProcess',
		'stopCondition',
		'simulation',
		'simulationBlock',
		'stepsPerInterval',
		'intervalDelay',
		'whenFinishedBlock',
		'shouldPause',
		'isPaused',
		'pauseSemaphore'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'running' }
CMSimulationProcessRunner >> beDefaultSimulation [

	simulationBlock := [
		                   [ stopCondition value: simulation cormasModel ]
			                   whileFalse: [
					                   simulation runStep.
					                   self waitWhilePaused.
					                   (Delay forMilliseconds: intervalDelay) wait ].
		                   whenFinishedBlock value ]
]

{ #category : 'running' }
CMSimulationProcessRunner >> beSimulationAfterEachIntervalDo: aBlock [
	"Interval is a given number of steps after which we execute aBlock"

	simulationBlock := [
		                   [ stopCondition value: simulation cormasModel ]
			                   whileFalse: [
					                   simulation runStep.
					                   simulation currentTimeStep % stepsPerInterval
					                   = 0 ifTrue: [ aBlock value ].
					                   self waitWhilePaused.
					                   (Delay forMilliseconds: intervalDelay) wait ].
		                   whenFinishedBlock value ]
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> cormasSimulation: aCMSimulation [

	simulation := aCMSimulation
]

{ #category : 'initialization' }
CMSimulationProcessRunner >> initialize [

	super initialize.
	stepsPerInterval := 1.
	intervalDelay := 0. "milliseconds"
	whenFinishedBlock := [ "do nothing" ].
	shouldPause := false.
	isPaused := false.
	pauseSemaphore := Semaphore new
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> intervalDelay: aNumberOfMilliseconds [

	intervalDelay := aNumberOfMilliseconds
]

{ #category : 'api - running' }
CMSimulationProcessRunner >> isProcessConfigured [

	^ simulationProcess isNotNil and: [ simulationProcess isTerminated not ]
]

{ #category : 'api - running' }
CMSimulationProcessRunner >> isSimulationConfigured [

	^ simulationBlock isNotNil
]

{ #category : 'testing' }
CMSimulationProcessRunner >> isSimulationRunning [
	"Answer whether the simulation runs its steps: its process has started, has not finished, and has not stopped after a pause. A paused simulation runs until its current step is over. Between two steps, the process waits, but the simulation still runs"

	simulationProcess ifNil: [ ^ false ].
	^ simulationProcess isTerminated not and: [ isPaused not ]
]

{ #category : 'running' }
CMSimulationProcessRunner >> pause [
	"Stop the simulation once its current step is over, with what follows the step, so that the model is never left half changed"

	shouldPause := true
]

{ #category : 'running' }
CMSimulationProcessRunner >> resume [

	shouldPause := false.
	pauseSemaphore signal
]

{ #category : 'api - running' }
CMSimulationProcessRunner >> runInBackground [

	simulationProcess := simulationBlock newProcess.
	simulationProcess resume
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> stepsPerInterval: aPositiveInteger [

	stepsPerInterval := aPositiveInteger
]

{ #category : 'running' }
CMSimulationProcessRunner >> stop [
	"End the simulation at once, also while it is paused, when nobody needs it any more. A stopped simulation cannot be resumed"

	simulationProcess ifNotNil: [ :process | process terminate ]
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> stopCondition [

	^ stopCondition
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> stopCondition: aFullBlockClosure [

	stopCondition := aFullBlockClosure
]

{ #category : 'running' }
CMSimulationProcessRunner >> waitWhilePaused [

	[ shouldPause ] whileTrue: [
			isPaused := true.
			pauseSemaphore wait ].
	isPaused := false
]

{ #category : 'enumerating' }
CMSimulationProcessRunner >> whenFinishedDo: aBlock [
	"A block to execute when simulation was finished because the stop condition was fullfilled"
	
	whenFinishedBlock := aBlock
]
