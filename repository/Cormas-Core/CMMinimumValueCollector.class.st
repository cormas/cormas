Class {
	#name : 'CMMinimumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMMinimumValueCollector class >> collectorName [

	^ 'Minimum value'
]

{ #category : 'data collection' }
CMMinimumValueCollector >> aggregate: aCollection [

	^ aCollection min
]
