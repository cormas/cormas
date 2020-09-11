Class {
	#name : #CMDemoAggregatesFragmentedForestTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesFragmentedForestTest >> testEntityName [
	self
		assert: CMDemoAggregatesFragmentedForest entityName
		equals: 'FragmentedForest'
]
