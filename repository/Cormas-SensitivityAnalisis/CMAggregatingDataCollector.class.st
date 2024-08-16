Class {
	#name : 'CMAggregatingDataCollector',
	#superclass : 'CMDataCollector',
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'data collection' }
CMAggregatingDataCollector >> activateProbeBeforeSimulation [

	probe isActive: true
]

{ #category : 'data collection' }
CMAggregatingDataCollector >> aggregate: aCollection [

	self subclassResponsibility
]

{ #category : 'data collection' }
CMAggregatingDataCollector >> collectDataAfterSimulation [

	| value |
	value := self aggregate: (simulation data collect: [ :row | row at: probe name ]).
	data add: value.
]
