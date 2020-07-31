Class {
	#name : #CMDemoAggregatesPlotTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-DemoAggregates-Tests'
}

{ #category : #tests }
CMDemoAggregatesPlotTest >> testEntityName [
	self assert: CMDemoAggregatesPlot entityName equals: 'Plot'
]
