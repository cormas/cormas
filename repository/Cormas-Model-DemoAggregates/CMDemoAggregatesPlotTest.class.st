Class {
	#name : #CMDemoAggregatesPlotTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesPlotTest >> testShortName [
	self assert: CMDemoAggregatesPlot shortName equals: 'Plot'
]
