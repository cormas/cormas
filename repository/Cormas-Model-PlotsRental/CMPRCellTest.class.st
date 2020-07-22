Class {
	#name : #CMPRCellTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental'
}

{ #category : #tests }
CMPRCellTest >> testShortName [
	self assert: CMPRCell shortName equals: 'PRCell'
]
