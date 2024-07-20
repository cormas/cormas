Class {
	#name : 'CMSimulationManager',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'finalTime'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'time' }
CMSimulationManager class >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ 100
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
CMSimulationManager >> finalTime [
	^ finalTime ifNil: [ finalTime := self class defaultFinalTime]
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
	
	self cormasModel activeInit ifNil: [ ^ self error: 'No active init!' ].
	Cursor wait showWhile: [ self cormasModel initializeSimulation ].
]

{ #category : 'replay-private' }
CMSimulationManager >> stepNameStart [
	"Return the begining part of each stepFilename (=> 'step_' )  "
	"return a string for the file"
	
	^'step_'
]
