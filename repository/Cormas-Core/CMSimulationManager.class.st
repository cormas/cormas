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
CMSimulationManager class >> separator [
	
	^'-------'
]

{ #category : 'replay-private' }
CMSimulationManager class >> simNameStart [
	"Return the begining part of each simName (=> 'sim_' )  "
	
	^'sim_'
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
	
	self cormasModel activeInit ifNil: [ ^ self error: 'No active init!' ].
	Cursor wait showWhile: [ self cormasModel initializeSimulation ].
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
