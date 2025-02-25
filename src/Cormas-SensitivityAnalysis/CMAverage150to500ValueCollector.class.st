Class {
	#name : 'CMAverage150to500ValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMAverage150to500ValueCollector class >> collectorNameFromTranslator: aTranslator [

	^ 'Average 150-500'
]

{ #category : 'data collection' }
CMAverage150to500ValueCollector >> aggregate: aCollection [

	^ (aCollection copyFrom: 150 to: 500) average
]
