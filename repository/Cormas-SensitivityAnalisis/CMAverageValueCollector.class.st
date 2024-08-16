Class {
	#name : 'CMAverageValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'data collection' }
CMAverageValueCollector >> aggregate: aCollection [

	^ aCollection average
]
