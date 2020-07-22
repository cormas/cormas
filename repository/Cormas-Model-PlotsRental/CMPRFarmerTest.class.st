Class {
	#name : #CMPRFarmerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRFarmerTest >> testShortName [
	self assert: CMPRFarmer shortName equals: 'PRFarmer'
]
