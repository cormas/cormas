Class {
	#name : #CMECECVegetationUnitTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECVegetationUnitTest >> testEntityName [
	self assert: CMECECVegetationUnit entityName equals: 'VegetationUnit'
]
