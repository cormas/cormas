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
		'whenFinishedBlock'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'api - type of simulation' }
CMSimulationProcessRunner >> beDefaultSimulation [

	simulationBlock := [
		[ stopCondition value: simulation cormasModel ] whileFalse: [
			simulation runStep.
			(Delay forMilliseconds: intervalDelay) wait ].
		
		whenFinishedBlock value ]
]

{ #category : 'api - type of simulation' }
CMSimulationProcessRunner >> beSimulationAfterEachIntervalDo: aBlock [
	"Interval is a given number of steps after which we execute aBlock"

	simulationBlock := [ 
		[ stopCondition value: simulation cormasModel ] whileFalse: [
			simulation runStep.
			simulation currentTimeStep % stepsPerInterval = 0 ifTrue: [ aBlock value ].
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
	whenFinishedBlock := [ "do nothing" ]
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

{ #category : 'api - running' }
CMSimulationProcessRunner >> isSimulationRunning [

	simulationProcess ifNil: [ ^ false ].
	^ simulationProcess isActive
]

{ #category : 'api - processing' }
CMSimulationProcessRunner >> pause [

	simulationProcess suspend
]

{ #category : 'api - running' }
CMSimulationProcessRunner >> resume [

	simulationProcess resume
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

{ #category : 'accessing' }
CMSimulationProcessRunner >> stopCondition: aFullBlockClosure [

	stopCondition := aFullBlockClosure
]

{ #category : 'enumerating' }
CMSimulationProcessRunner >> whenFinishedDo: aBlock [
	"A block to execute when simulation was finished because the stop condition was fullfilled"
	
	whenFinishedBlock := aBlock
]
