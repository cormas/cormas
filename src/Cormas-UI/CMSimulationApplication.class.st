Class {
	#name : 'CMSimulationApplication',
	#superclass : 'SpApplication',
	#instVars : [
		'cormasModel',
		'simulation',
		'announcer'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'accessing' }
CMSimulationApplication >> announcer [

	^ announcer
]

{ #category : 'accessing' }
CMSimulationApplication >> cormasModel [

	^ cormasModel
]

{ #category : 'accessing' }
CMSimulationApplication >> cormasModel: aCormasModel [

	cormasModel := aCormasModel
]

{ #category : 'initialization' }
CMSimulationApplication >> initialize [

	super initialize.
	announcer := Announcer new
]

{ #category : 'accessing' }
CMSimulationApplication >> simulation [

	^ simulation
]

{ #category : 'accessing' }
CMSimulationApplication >> simulation: aSimulation [

	simulation := aSimulation
]

{ #category : 'as yet unclassified' }
CMSimulationApplication >> start [

	| presenter |
	
	cormasModel ifNil: [ self error: [ 'Provide cormasModel to run the application' ] ].
	
	presenter := CMSimulationPresenter newApplication: self model: cormasModel.
	presenter open.
	presenter window centered
]
