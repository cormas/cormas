Class {
	#name : #CMECECUnrestrainedTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECUnrestrainedTest >> testEntityName [
	self assert: CMECECUnrestrained entityName equals: 'Unrestrained'
]
