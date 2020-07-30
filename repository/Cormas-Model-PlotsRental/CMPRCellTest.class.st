Class {
	#name : #CMPRCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRCellTest >> testShortName [
	self assert: CMPRCell shortName equals: 'Cell'
]
