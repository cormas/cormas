Class {
	#name : 'CMMaximumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'data collection' }
CMMaximumValueCollector >> aggregate: aCollection [ 

	^ aCollection max
]
