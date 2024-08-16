Class {
	#name : 'CMMinimumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'data collection' }
CMMinimumValueCollector >> aggregate: aCollection [

	^ aCollection min
]
