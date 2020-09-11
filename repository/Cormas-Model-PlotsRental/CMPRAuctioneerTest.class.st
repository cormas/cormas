Class {
	#name : #CMPRAuctioneerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRAuctioneerTest >> testEntityName [
	self assert: CMPRAuctioneer entityName equals: 'Auctioneer'
]
