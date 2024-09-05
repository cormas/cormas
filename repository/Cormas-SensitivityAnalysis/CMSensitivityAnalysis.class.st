Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'activeInitMethod',
		'activeControlMethod',
		'numberOfRepetitions',
		'simulations',
		'dataCollectors',
		'data'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis class >> defaultNumberOfRepetitions [

	^ 10
]

{ #category : 'instance creation' }
CMSensitivityAnalysis class >> for: aModelClass [

	^ self new
		modelClass: aModelClass;
		yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> activeControlMethod: aMethod [

	activeControlMethod := aMethod
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> activeInitMethod: aMethod [

	activeInitMethod := aMethod
]

{ #category : 'adding' }
CMSensitivityAnalysis >> addSimulationForParameter: aParameter value: aValue [

	| simulation |
	
	simulation := (CMSimulation for: modelClass)
		activeInitMethod: activeInitMethod;
		activeControlMethod: activeControlMethod;
		yourself.
		
	simulation initialParameterValues at: aParameter put: aValue.
	simulations add: simulation
]

{ #category : 'adding' }
CMSensitivityAnalysis >> clearSimulations [

	simulations removeAll
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> dataCollectors: aCollection [

	dataCollectors := aCollection
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initialize [

	super initialize.
	
	numberOfRepetitions := self class defaultNumberOfRepetitions.
	simulations := OrderedCollection new.
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> modelClass: aClass [

	modelClass := aClass 
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfRepetitions [

	^ numberOfRepetitions
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfRepetitions: aNumber [

	numberOfRepetitions := aNumber
]

{ #category : 'running' }
CMSensitivityAnalysis >> run [

	simulations do: [ :simulation |
		self runSimulation: simulation ]
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> runSimulation: aSimulation [

	numberOfRepetitions timesRepeat: [ 
		dataCollectors do: #activateProbeBeforeSimulation.
		aSimulation runAllSteps.
		dataCollectors do: #collectDataAfterSimulation ]
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> simulations [

	^ simulations
]
