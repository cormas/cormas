Class {
	#name : 'CMMaximumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'data collection' }
CMMaximumValueCollector >> aggregate: aCollection [ 

	^ aCollection max
]
