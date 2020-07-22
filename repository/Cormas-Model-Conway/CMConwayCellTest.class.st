Class {
	#name : #CMConwayCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Conway-Tests'
}

{ #category : #tests }
CMConwayCellTest >> testShortName [
	self assert: CMConwayCell shortName equals: 'Cell'
]
