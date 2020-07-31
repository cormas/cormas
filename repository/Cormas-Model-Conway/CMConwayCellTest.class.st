Class {
	#name : #CMConwayCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Conway-Tests'
}

{ #category : #tests }
CMConwayCellTest >> testEntityName [
	self assert: CMConwayCell entityName equals: 'Cell'
]
