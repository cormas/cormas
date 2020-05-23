Class {
	#name : #CMECECModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECModelTest >> testECECModelHasAProbeNamedVegetationBiomass [
	self assert: (CMECECModel probes includes: #vegetationBiomass)
]

{ #category : #tests }
CMECECModelTest >> testECECModelHasThreeProbes [
	self assert: CMECECModel probes size equals: 3
]
