Class {
	#name : 'CMAverageValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'data collection' }
CMAverageValueCollector >> aggregate: aCollection [

	^ aCollection average
]
