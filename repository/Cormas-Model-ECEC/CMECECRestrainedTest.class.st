Class {
	#name : #CMECECRestrainedTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECRestrainedTest >> testEntityName [
	self assert: CMECECRestrained entityName equals: 'Restrained'
]
