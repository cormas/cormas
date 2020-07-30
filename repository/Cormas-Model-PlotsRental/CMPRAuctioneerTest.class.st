Class {
	#name : #CMPRAuctioneerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRAuctioneerTest >> testShortName [
	self assert: CMPRAuctioneer shortName equals: 'Auctioneer'
]
