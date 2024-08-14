Class {
	#name : 'CMFinalValueCollector',
	#superclass : 'CMDataCollector',
	#category : 'Cormas-Core-Analysis',
	#package : 'Cormas-Core',
	#tag : 'Analysis'
}

{ #category : 'as yet unclassified' }
CMFinalValueCollector class >> collectorName [

	^ 'Final value'
]

{ #category : 'data collection' }
CMFinalValueCollector >> activateProbeBeforeSimulation [

	"do nothing"
]

{ #category : 'data collection' }
CMFinalValueCollector >> collectDataAfterSimulation [
	
	data add: probe value.
]
