Class {
	#name : 'CMAverageValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMAverageValueCollector class >> collectorName [

	^ 'Average value'
]

{ #category : 'data collection' }
CMAverageValueCollector >> aggregate: aCollection [

	^ aCollection average
]
