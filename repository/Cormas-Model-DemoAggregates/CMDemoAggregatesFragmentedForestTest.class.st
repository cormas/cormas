Class {
	#name : #CMDemoAggregatesFragmentedForestTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesFragmentedForestTest >> testShortName [
	self assert: CMDemoAggregatesFragmentedForest shortName equals: 'FragmentedForest'
]
