Class {
	#name : 'CMAreaChartTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMAreaChartTest >> testTheAreasOfAllInstancesOfAClassCannotBeShownTwice [

	| chart |
	chart := CMAreaChart new
		         areas: #state ofAll: CMMockCell;
		         yourself.
	self
		should: [ chart areas: #state ofAll: CMMockCell ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMMockCell') ]
]

{ #category : 'tests' }
CMAreaChartTest >> testTheSameProbeCannotBeShownTwice [

	| chart |
	chart := CMAreaChart new
		         area: #numberOfSheep;
		         yourself.
	self
		should: [ chart area: #numberOfSheep ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'numberOfSheep') ]
]
