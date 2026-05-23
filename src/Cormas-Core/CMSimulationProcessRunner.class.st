Class {
	#name : 'CMSimulationProcessRunner',
	#superclass : 'Object',
	#instVars : [
		'simulationProcess',
		'stopCondition',
		'simulation',
		'simulationBlock',
		'stepDelay',
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
			(Delay forMilliseconds: stepDelay) wait ].
		
		whenFinishedBlock value ]
]

{ #category : 'api - type of simulation' }
CMSimulationProcessRunner >> beSimulationAfterEach: aNumberOfSteps do: aBlock [

	simulationBlock := [ 
		[ stopCondition value: simulation cormasModel ] whileFalse: [
			simulation runStep.
			simulation currentTimeStep % aNumberOfSteps = 0 ifTrue: [ aBlock value ].
			(Delay forMilliseconds: stepDelay) wait ].
		
		whenFinishedBlock value ]
]

{ #category : 'api - type of simulation' }
CMSimulationProcessRunner >> beSimulationAfterEachDo: aBlock [

	simulationBlock := [ 
		[ stopCondition value: simulation cormasModel ] whileFalse: [
			simulation runStep.
			aBlock value.
			(Delay forMilliseconds: stepDelay) wait ].
		
		whenFinishedBlock value ]
]

{ #category : 'accessing' }
CMSimulationProcessRunner >> cormasSimulation: aCMSimulation [

	simulation := aCMSimulation
]

{ #category : 'initialization' }
CMSimulationProcessRunner >> initialize [

	super initialize.
	stepDelay := 0. "milliseconds"
	whenFinishedBlock := [ "do nothing" ]
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
CMSimulationProcessRunner >> stepDelay: aNumberOfMilliseconds [

	stepDelay := aNumberOfMilliseconds
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
