Class {
	#name : 'CMDataCollector',
	#superclass : 'Object',
	#instVars : [
		'probe',
		'simulation',
		'data'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMDataCollector class >> forProbe: aProbe on: aSimulation [

	^ self new
		probe: aProbe;
		simulation: aSimulation;
		yourself
]

{ #category : 'data collection' }
CMDataCollector >> activateProbeBeforeSimulation [
	"Choose to activate a probe or not depending on the subclass"
	self subclassResponsibility
]

{ #category : 'data collection' }
CMDataCollector >> collectDataAfterSimulation [

	data add: self value
]

{ #category : 'accessing' }
CMDataCollector >> data [

	^ data
]

{ #category : 'initialization' }
CMDataCollector >> initialize [

	super initialize.
	data := OrderedCollection new.
]

{ #category : 'accessing' }
CMDataCollector >> probe [

	^ probe
]

{ #category : 'accessing' }
CMDataCollector >> probe: aProbe [

	probe := aProbe
]

{ #category : 'accessing' }
CMDataCollector >> simulation: aSimulation [

	simulation := aSimulation
]

{ #category : 'evaluating' }
CMDataCollector >> value [

	self subclassResponsibility
]
