Class {
	#name : #CMDemoAggregatesGroveTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesGroveTest >> testShortName [
	self assert: CMDemoAggregatesGrove shortName equals: 'Grove'
]
