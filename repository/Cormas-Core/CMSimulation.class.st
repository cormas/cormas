Class {
	#name : 'CMSimulation',
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
CMSimulation class >> defaultFinalTime [
	" Answer an <Integer> representing the default final step time "

	^ 100
]

{ #category : 'instance creation' }
CMSimulation class >> for: aModel [

	^ self new
		cormasModel: aModel;
		yourself
]

{ #category : 'accessing' }
CMSimulation >> cormasModel [
	
	^cormasModel
]

{ #category : 'accessing' }
CMSimulation >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : 'accessing' }
CMSimulation >> cormasModelClass [
	
	^self cormasModel class
]

{ #category : 'time' }
CMSimulation >> currentSimEnded [
	
	^ self finalTime <= self currentTime
]

{ #category : 'time' }
CMSimulation >> currentTime [
	
	^ self cormasModel timeStep
]

{ #category : 'time' }
CMSimulation >> currentTime: anInteger [
	self cormasModel timeStep: anInteger
]

{ #category : 'time' }
CMSimulation >> finalTime [
	^ finalTime ifNil: [ finalTime := self class defaultFinalTime]
]

{ #category : 'time' }
CMSimulation >> finalTime: anInteger [
	finalTime := anInteger
	
]

{ #category : 'time' }
CMSimulation >> finishSimulation [
	self cormasModel timeStep: self finalTime
]

{ #category : 'init' }
CMSimulation >> initializeSimulation [
	
	self cormasModel activeInit ifNil: [ ^ self error: 'No active init!' ].
	Cursor wait showWhile: [ self cormasModel initializeSimulation ].
]

{ #category : 'replay-private' }
CMSimulation >> stepNameStart [
	"Return the begining part of each stepFilename (=> 'step_' )  "
	"return a string for the file"
	
	^'step_'
]
