Class {
	#name : #CMPlotTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMPlotTest >> testShortName [
	self assert: CMPlot shortName equals: 'Plot'
]
