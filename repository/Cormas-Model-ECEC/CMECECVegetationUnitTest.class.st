Class {
	#name : #CMECECVegetationUnitTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECVegetationUnitTest >> testShortName [
	self assert: CMECECVegetationUnit shortName equals: 'VegetationUnit'
]
