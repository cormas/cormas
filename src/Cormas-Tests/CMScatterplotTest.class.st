"
I test the definition of a `CMScatterplot` and of its `CMPointSeries`, without drawing it.
"
Class {
	#name : 'CMScatterplotTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'tests' }
CMScatterplotTest >> testAScatterplotRefusesASeriesOfAnotherKind [

	self
		should: [
			CMScatterplot new add:
				(CMLineSeries new probe: #numberOfAliveCells) ]
		raise: Error
]

{ #category : 'tests' }
CMScatterplotTest >> testPointsAreLabelledByTheirProbeOnY [

	self
		assert: (CMPointSeries new probeX: #age y: #energy) label
		equals: 'energy'.
	self
		assert:
		(CMPointSeries new probeX: #age y: #energy ofAll: CMMockAnimal)
			label
		equals: 'energy'
]

{ #category : 'tests' }
CMScatterplotTest >> testPointsNeedAProbeForEachAxis [

	self
		should: [ CMPointSeries new probe: #energy ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'probeX:y:') ].
	self
		should: [ CMPointSeries new probe: #energy ofAll: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'probeX:y:') ]
]

{ #category : 'tests' }
CMScatterplotTest >> testPointsOfAllInstancesShowASingleStep [

	self deny: (CMScatterplot new
			 pointsX: #numberOfAliveCells y: #numberOfDeadCells;
			 yourself) isSingleStep.
	self assert: (CMScatterplot new
			 pointsX: #energy y: #energy ofAll: CMMockAnimal;
			 yourself) isSingleStep
]

{ #category : 'tests' }
CMScatterplotTest >> testPointsOverTimeAndPointsOfAllInstancesCannotBeMixed [

	self
		should: [
				CMScatterplot new
					pointsX: #numberOfAliveCells y: #numberOfDeadCells;
					pointsX: #energy y: #energy ofAll: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'one step') ]
]

{ #category : 'tests' }
CMScatterplotTest >> testThePointsOfAllInstancesOfAClassCannotBeShownTwice [

	| chart |
	chart := CMScatterplot new
		         pointsX: #energy y: #energy ofAll: CMMockCow;
		         pointsX: #energy y: #energy ofAll: CMMockGoat;
		         yourself.
	self
		should: [ chart pointsX: #energy y: #energy ofAll: CMMockCow ]
		raise: Error
]

{ #category : 'tests' }
CMScatterplotTest >> testThePointsOfTheSameProbesCannotBeShownTwice [

	| chart |
	chart := CMScatterplot new
		         pointsX: #numberOfAliveCells y: #numberOfDeadCells;
		         pointsX: #numberOfDeadCells y: #numberOfAliveCells;
		         yourself.
	self
		should: [
				chart add: (CMPointSeries new
						 probeX: #numberOfAliveCells y: #numberOfDeadCells;
						 label: 'Cells';
						 yourself) ]
		raise: Error
]
