Class {
	#name : #CMGroveTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMGroveTest >> testShortName [
	self assert: CMGrove shortName equals: 'Grove'
]
