Class {
	#name : #CMPRFarmerTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-PlotsRental-Tests'
}

{ #category : #tests }
CMPRFarmerTest >> testEntityName [
	self assert: CMPRFarmer entityName equals: 'Farmer'
]

{ #category : #tests }
CMPRFarmerTest >> testModelPrefix [
	self assert: CMPRFarmer modelClass shortName equals: 'PR'
]
