Class {
	#name : #CMECECUnrestrainedTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-ECEC-Tests'
}

{ #category : #tests }
CMECECUnrestrainedTest >> testShortName [
	self assert: CMECECUnrestrained shortName equals: 'Unrestrained'
]
