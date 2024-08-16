Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'simulation',
		'dataCollectors',
		'data'
	],
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'instance creation' }
CMSensitivityAnalysis class >> for: aModel [

	^ self new
		cormasModel: aModel;
		yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> dataCollectors: aCollection [

	dataCollectors := aCollection
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initialize [

	super initialize.
	dataCollectors := OrderedCollection new.
]

{ #category : 'running' }
CMSensitivityAnalysis >> run [

	
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> simulation: aSimulation [

	simulation := aSimulation 
]
