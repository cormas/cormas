Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'activeInitMethod',
		'activeControlMethod',
		'simulations',
		'dataCollectors',
		'data'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

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

{ #category : 'running' }
CMSensitivityAnalysis >> run [

	
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> simulations [

	^ simulations
]
