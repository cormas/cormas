Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'currentTimeStep',
		'finalTime',
		'data'
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
	
	^ cormasModel
]

{ #category : 'accessing' }
CMSimulation >> cormasModel: anObject [
	
	cormasModel := anObject.
	self initializeModel.
]

{ #category : 'accessing' }
CMSimulation >> currentTimeStep [

	^ currentTimeStep 
]

{ #category : 'time' }
CMSimulation >> finalTime [

	^ finalTime
]

{ #category : 'time' }
CMSimulation >> finalTime: anInteger [

	finalTime := anInteger
	
]

{ #category : 'time' }
CMSimulation >> finishSimulation [

	currentTimeStep := self finalTime
]

{ #category : 'time' }
CMSimulation >> hasEnded [
	
	^ self finalTime <= self currentTimeStep
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	
	currentTimeStep := 0.
	finalTime := self class defaultFinalTime.
	
	data := Dictionary new.
	
	self initializeProbes.
]

{ #category : 'initialization' }
CMSimulation >> initializeModel [

	cormasModel initializeProbes.
	"remove the previous entities of the collections (theXXXs), except for theCells"
	cormasModel initEntities.
	"set default attributes values of entities"
	"Call the selected INIT method"
	cormasModel perform: cormasModel activeInit.	"launch the selected INIT method"
	cormasModel updateEntities.	"updates theXXXs collections"
	cormasModel updateDataForChart.
	cormasModel channel ifNil: [ cormasModel initializeChannel ].
	cormasModel theAgentsComm do: [ :p | p channel: cormasModel channel ].
	cormasModel initStatus: true.
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [

	"do nothing"
]

{ #category : 'scheduling' }
CMSimulation >> runStep [
	"The main step method that activates the agents:
		- INCREMENT the timeStep (DO NOT USE the #incrementTimeStep as updates the UI before agents get a new patch)
		- EXECUTE the selected #Step method (of the ScenarioBuilder Interface) for the new timeStep,
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	currentTimeStep := currentTimeStep + 1.
	
	cormasModel activeControl last = $:
		ifTrue: [ cormasModel perform: cormasModel activeControl with: currentTimeStep ]
		ifFalse: [ cormasModel perform: cormasModel activeControl ].
	cormasModel updateEntities.
	cormasModel channel ifNotNil: [ cormasModel channel sendAllMessages ].
	cormasModel updateDataForChart.
]
