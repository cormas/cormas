Class {
	#name : 'CMMinimumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'data collection' }
CMMinimumValueCollector >> aggregate: aCollection [

	^ aCollection min
]
