Class {
	#name : 'CMMaximumValueCollector',
	#superclass : 'CMAggregatingDataCollector',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMMaximumValueCollector class >> collectorName [

	^ 'Maximum value'
]

{ #category : 'data collection' }
CMMaximumValueCollector >> aggregate: aCollection [ 

	^ aCollection max
]
