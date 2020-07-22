Class {
	#name : #CMFragmentedForestTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMFragmentedForestTest >> testShortName [
	self assert: CMFragmentedForest shortName equals: 'FragmentedForest'
]
