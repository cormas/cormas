Class {
	#name : #CMPRFarmerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRFarmerTest >> testModelPrefix [
	self assert: CMPRFarmer modelClass modelPrefix equals: 'PR'
]

{ #category : #tests }
CMPRFarmerTest >> testShortName [
	self assert: CMPRFarmer shortName equals: 'Farmer'
]
