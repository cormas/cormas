Class {
	#name : #CMECECModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECModelTest >> testAnAbstractClassHasNoInstances [
	| model |
	model := CMECECModel
		initialize;
		new.
	model initSimulation.
	self assert: (model theEntities: CMECECForager) size equals:0
]

{ #category : #tests }
CMECECModelTest >> testECECModelHasAProbeNamedVegetationBiomass [
	self assert: (CMECECModel probes includes: #vegetationBiomass)
]

{ #category : #tests }
CMECECModelTest >> testECECModelHasThreeProbes [
	self assert: CMECECModel probes size equals: 3
]
