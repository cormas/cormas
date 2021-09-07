Class {
	#name : #CMECECModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECModelTest >> testAnAbstractClassHasNoInstances [

	| tmp1 tmp2 |
	tmp2 := CMECECModel.
	tmp2 initialize.
	tmp1 := tmp2 new.
	tmp1 initSimulation.
	self assert: (tmp1 theEntities: CMECECForager) size equals: 0
]

{ #category : #tests }
CMECECModelTest >> testECECModelHasAProbeNamedVegetationBiomass [

	self assert: (CMECECModel probes includes: #vegetationBiomass)
]

{ #category : #tests }
CMECECModelTest >> testECECModelHasThreeProbes [

	self assert: CMECECModel probes size equals: 3
]
