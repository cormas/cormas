Class {
	#name : #CMECECRestrainedTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECRestrainedTest >> testShortName [
	self assert: CMECECRestrained shortName equals: 'Restrained'
]
