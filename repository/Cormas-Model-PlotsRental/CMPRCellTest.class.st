Class {
	#name : #CMPRCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRCellTest >> testEntityName [
	self assert: CMPRCell entityName equals: 'Cell'
]
