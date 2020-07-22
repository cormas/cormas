Class {
	#name : #CMPRAuctioneerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental'
}

{ #category : #tests }
CMPRAuctioneerTest >> testShortName [
	self assert: CMPRAuctioneer shortName equals: 'PRAuctioneer'
]
