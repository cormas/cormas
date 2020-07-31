Class {
	#name : #CMDemoAggregatesGroveTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesGroveTest >> testEntityName [
	self assert: CMDemoAggregatesGrove entityName equals: 'Grove'
]
