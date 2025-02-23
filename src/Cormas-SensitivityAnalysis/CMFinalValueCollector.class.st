Class {
	#name : 'CMFinalValueCollector',
	#superclass : 'CMDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'data collection' }
CMFinalValueCollector >> activateProbeBeforeSimulation [

	"do nothing"
	probe isActive: true
]

{ #category : 'data collection' }
CMFinalValueCollector >> collectDataAfterSimulation [
	
	data add: (simulation data last at: probe name).
]
